<?php
class sendCoupon {
    private $table = 'wmall_coupon_list';

    public function sendCoupons() {
        $coupons = $this->lists('wid,id,mid,coupon_id');        
        if($coupons){
            $dataArray = array();
            $body = '';
            foreach ($coupons as $k => $v){
                $dataArray['is_notice'] = 2 ;
                $condition['id'] = $v['id'];
                DB::get_db()->prepareUpdate($this->table, $dataArray,$condition, false);
                if($this->getMidIsSubscribe($v['mid'])){
                    $res = WeixinTemplateModel::getInstance()->couponSendTemplate($v['coupon_id'],$v['mid'],$v['id'],$v['wid']);
                }else{
                    $res = array(
                        'errcode'=> 4,
                        'errmsg'=> '该车主已取消关注公众号'
                    );
                }

                if($res['errcode'] == 0){
                    $dataArray['is_notice'] = 1 ;
                }else{
                    $dataArray['is_notice'] = 3;
                    $dataArray['notice_state'] = $res['errmsg'];
                    Log::error('会员卡券id为' . $v['id'] . '卡券发送失败');
                    $tisi = $res['errcode']== 4 ? '失败原因' :'未发送原因';
                    $body .= 'wid => '.$v['wid'].'， 会员卡券id => '.$v['id'].'， 会员id=> '.$v['mid'].'， '.$tisi.' => code:'.$res['errcode'].' msg:'.$res['errmsg'].'<br/>';
                }

                $tableFields = DB::get_db()->getTableFields($this->table);
                $dataArray = \ArrayHelper::filter($dataArray, implode(',', $tableFields));

                $dataArray['update_date'] = TimeHelper::now();
                $dataArray['update_by'] = AdminHelper::getUsername();

                DB::get_db()->prepareUpdate($this->table, $dataArray,$condition, true);
            }
            if(!empty($body)){
                MailHelper::send('tests@91ycf.com', '卡券发送失败提醒', $body);
            }
        }

    }

    private function lists($select = '*') {
        $sql = "select $select from  $this->table where source = 1 and wid > 0 and is_delete = 0 and is_notice = 0 and is_picked = 0 and is_used = 0 and expired_at > now() limit 0,200 ";
        return DB::get_db()->query($sql);
    }

    private function getMidIsSubscribe($mid){
        $sql = "select wx_type from customer_wx_fans where mid = '$mid' order by subscribe_time desc limit 1";
        $res = DB::get_db()->query($sql);
        return $res[0]['wx_type'] == 2 ? false : true;
    }


}