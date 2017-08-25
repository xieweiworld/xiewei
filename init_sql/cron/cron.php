<?php

/**
 * 计划任务处理类
 * Class Cron
 */
class Cron {

    public function __construct() {
        error_reporting(E_ERROR);
        echo "\n\n==================== Start cron [" . date('Y-m-d H:i:s', time()) . "] ====================\n";
        $this->init();
    }

    /**
     * 车主关怀提醒检查
     */
    public function careRemindCheck() {
        echo "\nCron name: CareRemindCheck\n";
        if (is_file(YYUC_ROOT . 'assets/log/cron/' . date('Ymd') . '_careRemindCheck.log')) { // 当天有记录日志则代表已运行，不重复运行
            echo "\nis checked\n";
            return;
        }
        \Customer\RemindRecordModel::getInstance()->check();
    }

    /**
     * 车主关怀短信发送
     */
    public function careRemindSend() {
        echo "\nCron name: CareRemindSend\n";
        $remindRecordModel =  \Customer\RemindRecordModel::getInstance();
        for ($i = 1; $i <= $remindRecordModel->maxSendCount; $i++) {
            echo "\nSend cron run {$i}...\n";

            $sendList = $remindRecordModel->getSendList();
            foreach ($sendList as $send) {
                $sms = \SMS\SMSFactory::getSms(\SMS\Channel::CHUANGLAN);
                $r = $sms->send($send['mobile'], $send['content']);
                echo 'send result' . json_encode($r);
                if ($r['status']) {
                    echo "SMS Send Fail, customer_remind_record id => " . $send['id'];
                    $r = \SMS\SMSFactory::getSms(\SMS\Channel::SUBMAIL)->send($send['mobile'], $send['content']);
                }
                $remindRecordModel->updateSendStatus($send['id'], $r['status']);
            }

            if (!count($sendList)) {
                break;
            } else {
                sleep($remindRecordModel->sendInterval);
            }
        }
    }

    /**
     * 卡券发送
     */
    public function sendCoupon() {
        echo "\nCron name: SendCoupon\n";
        include_once 'sendCoupon.php';
        $coupon = new sendCoupon();
        $coupon->sendCoupons();
    }

    /**
     * 商品详情同步至七牛
     */
    public function uploadProductDescription() {
        echo "\nCron name: UploadProductDescription\n";
        include_once 'uploadMallProductDescriptionToQiNiu.php';
        $upload = new UploadMallProductDescriptionToQiNiu();
        $upload->uploadToQiNiu();
    }

    /**
     * 商户APP端营业日报
     */
    public function sendBusinessReport() {
        echo "\nCron name: sendBusinessReport\n";
        include_once 'sendBusinessReport.php';
        $businessReport = new sendBusinessReport();
        $businessReport->sendBusinessReport();
    }

    /**
     * 商城失效订单
     */
    public function handleMallExpiredOrders() {
        echo "\nCron name: HandleMallExpiredOrders\n";
        include_once 'OrderLoseTask.php';
        new OrderLoseTask();
    }

    /**
     * 商户备份信息邮件发送
     */
    public function SendBackupEmailToCustomer() {
        echo "\nCron name: SendBackupEmailToCustomer\n";
        include_once 'sendBackupEmail.php';
        $sendBackupEmail = new SendBackupEmail();
        $sendBackupEmail->HandleBackupSend();
    }

    /**
     * 运行队列守护进程
     */
    public function runQueueDaemon() {
        echo "\nCron name: RunQueueDaemon\n";
        $hostname = str_replace(array('http:', 'https:', '/'), '', Conf::$http_name);
        $fp = fsockopen($hostname, "80", $errno, $errstr, 1);
        $out = "GET /system/service/queue.html HTTP/1.1\r\n";
        $out .= "Host: {$hostname}\r\n";
        $out .= "Connection: close\r\n\r\n";
        fwrite($fp, $out);
        usleep(1000);
        fclose($fp);
        exit;
    }


    private function init() {
        // 常亮定义
        define('YYUC_ROOT', str_replace('\\', '/', dirname(dirname(__DIR__))) . '/'); // 项目根目录
        define('YYUC_FRAME_PATH', YYUC_ROOT . 'wx/');
        define('YYUC_LIB', YYUC_ROOT . 'yyuc/');
        define('YYUC_CTR', YYUC_ROOT . 'wx/controller/');
        define('YYUC_FUN', YYUC_ROOT . 'wx/fun/');
        define('YYUC_HELPER', YYUC_ROOT . 'wx/helper/');
        define('YYUC_MODEL', YYUC_ROOT . 'wx/model/');
        define('YYUC_BMODEL', YYUC_ROOT . 'wx/model/business/');

        //加载配置文件
        require YYUC_FRAME_PATH.'conf.php';
        // 自动加载
        require YYUC_FRAME_PATH . 'autoloader.php';

        require YYUC_FUN . 'additions.php';

        define('SITE', Conf::$http_name);
    }

    public function __destruct() {
        echo "\nEnd cron [" . TimeHelper::now() . "]\n";
    }
}

call_user_func_array(array(new Cron(), $argv[1]), array());