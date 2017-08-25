<?php
/**
 * // ********** 定时任务发送备份邮件至商户预留邮箱 **********
 * // 获取要发送的邮件的列表
 * // 生成 Excel 文件
 * // 压缩成 zip 文件
 * // 发送邮件
 * // 生成记录
 */

class SendBackupEmail
{

    private $backupSetTable = "wmall_backup_set"; // 备份设置

    private $autoBackupTable = "wmall_auto_backup";

    // 用于发送备份邮件的邮箱帐号信息
    private $sendEmailAccount = "yichefu@91ycf.com";
    private $sendEmailPass = "YCF=ylt123";

    public function __construct()
    {
    }

    /**
     * Main 方法: 处理备份商户会员资料
     */
    public function HandleBackupSend() {
        // 获取待发送列表
        $list = $this->getBackupSendList();
        if (!$list) {
            return ;
        }

        foreach ($list as $item) {
            // 获取需要发送的备份文件 [xml文件]
            // $dataTypeArr = \UtilityLib::getValElements($item['data_type'], array(1,2,4,8));
            if ($this->checkMe(1, $item['data_type'])) {
                // 会员备份, 生成 xml 文件
                exportDataXML::getInstance()->exportMember($item['wid']);
            }
            if ($this->checkMe(2, $item['data_type'])) {
                // 会员卡备份
                exportDataXML::getInstance()->exportCards($item['wid']);
            }
            if ($this->checkMe(4, $item['data_type'])) {
                // 卡消费记录
                exportDataXML::getInstance()->exportcardconsumption($item['wid']);
            }
            if ($this->checkMe(8, $item['data_type'])) {
                // 卡充值记录
                exportDataXML::getInstance()->exportCardRecharge($item['wid']);
            }

            // 生成要发送的邮件附件 zip 文件
            $zipFile = $this->getZipFile($item['wid']);
            if ($zipFile) {
                // 发送邮件
                Log::error("start send email");
                $issendMail = $this->sendEmail($item['wid'],$item['email'], $zipFile);
                // 生成记录
                $this->saveAutoBackup($item, $zipFile, $issendMail);

            } else {
                Log::error(" no file ");
            }
        }

    }

    /**
     * 获取待发送邮件列表
     * @return array
     */
    public function getBackupSendList() {
        $invalidTime = '0000-00-00 00:00:00';
        $res = \Pubs\BackupSet::getInstance()->lists(' and b.approve_state = 1 ', 'b.*', 0);
        if (!$res['list']) {
            return array();
        }
        $list = array();
        foreach ($res['list'] as $item) {
            if (!$item['last_saved_at'] || $item['last_saved_at'] == $invalidTime) {
                $list[] = $item;
            } else {
                $nextTime = date('Y-m-d', strtotime($item['last_saved_at'].'+'.intval($item['interval']).'day'));
                if ($nextTime == \TimeHelper::getDate()) {
                    $list[] = $item;
                }
            }
        }
        return $list;
    }

    /**
     * 生成备份记录
     * @param $data
     * @param $zipFile
     * @param $isSendMail
     * @return array
     */
    public function saveAutoBackup($data, $zipFile, $isSendMail) {
        $saveData = array(
            'wid' => $data['wid'],
            'title' => '会员资料自动备份',
            'content' => \TimeHelper::getDate(),
            'zipfile' => $zipFile,
            'backup_at' => \TimeHelper::getDate(),
            'data_type' => $data['data_type'],
            'mobile' => $data['mobile'],
            'is_mobile' => '',
            'email' => $data['email'],
            'is_email' => $isSendMail,
            'remark' => '',
        );
        $res = \Pubs\AutoBackup::getInstance()->save($saveData);
        $setData = array(
            'wid' => $data['wid'],
            'last_saved_at' => \TimeHelper::now()
        );
        // 存储上次备份时间
        \Pubs\BackupSet::getInstance()->saveByWid($setData);

        return $res;
    }

    /**
     * 生成备份文件 zip, 并返回路径
     * @param $wid
     * @return string
     */
    public function getZipFile($wid) {
        $savePath = YYUC_FRAME_PATH . '/public_html/' . Conf::$backupDataFolder . $wid . '/';
        $backupPath = $savePath . date('Ymd') . '/';
        $zipPath = $savePath . '会员资料自动备份_' . date('Ymd') . '.zip';

        if(PHP_OS == 'WINNT')  $zipPath = iconv('utf-8', 'gbk', $zipPath);

        fopen($zipPath, 'w');
        fclose($zipPath);

        \FILE::add_file_to_zip($backupPath, $zipPath);

        if (file_exists($zipPath)) {
            // TODO 删除原excel文件
            // $zipPath 是要发送邮件的附件
            return $zipPath;
        } else {
            Log::error("【备份商户数据】".date('Y年m月d日') . ", wid为 {$wid} 的商户备份数据时出错!!!");
            return '';
        }
    }

    /**
     * 发送备份邮件邮件给商户(含附件)
     * @param $wid
     * @param $toUser
     * @param $zipFile
     * @return bool
     */
    public function sendEmail($wid, $toUser, $zipFile) {
        $subject = "会员资料自动备份(". date('Y.m.d') .") -- 【易车服SCRM】";
        $pubName = get_wid_short_name($wid);
        $emailbody = $pubName . "：<br>";
        $emailbody .= "您的会员资料已备份成功，详情请见附件。<br><br><br>此邮件由易车服自动发出，请勿回复！";

        // 发邮件
        $issendMail = MailHelper::sendEmail($toUser, $this->sendEmailAccount, $this->sendEmailPass, $subject, $emailbody, $zipFile);

        return $issendMail;
    }

    /* ---------- 私有方法 ---------- */

    /**
     * 检查是否勾选该备份项
     * @param $index
     * @param $value
     * @return bool
     */
    private function checkMe($index, $value)
    {
        return ($index & $value) == $index;
    }

}