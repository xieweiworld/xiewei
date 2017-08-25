<?php
class sendBusinessReport {
    private $table = 'user_staff_app_logins';
    
    public function sendBusinessReport() {
        $staffArr = $this->lists('l.app_wxid,l.staff_id,s.is_system,s.wid,s.manage_type,s.lbsid');
        if($staffArr){
            $lbsModel = \LBS\LBSModel::getInstance();
            foreach ($staffArr as $k => $v){
                Session::set('is_system',$v['is_system']);
                Session::set('wid',$v['wid']);
                if($v['is_system'] == 1 || $v['manage_type'] == 1){ //是系统管理员或者管理全部门店
                    $lbsArr = $lbsModel->getLbs('full_path,name',$where = " and is_enable = 1 and wid  = ".$v['wid']." and type = 1");
                }else{ //管辖的门店
                    $lbsArr = $lbsModel->getAdminStores($v['staff_id'],$v['wid'],'s.store_id id,l.name,l.full_path,l.type');
                }                
                if(count($lbsArr) >= 1 ){
                    foreach ($lbsArr as $item => $val){
                        Session::set('SELECTED_STORE_FULLPATH',$val['full_path']);
                        $this->send($v['staff_id'],$v['wid'],$val['name'],$v['app_wxid']);
                    }
                }

            }
            
        }

    }

    private function lists($select = 'l.*') {
        $sql = "SELECT $select FROM  $this->table l INNER JOIN user_staff s ON l.staff_id = s.id WHERE l.is_delete = 0 AND l.is_login = 1 AND l.app_wxid != '' ";
        return DB::get_db()->query($sql);
    }

    private function send($staffId,$wid,$name,$openId){
        $menuList = \authModel::getInstance()->getMenus($staffId,true);
        $dataList = $menuList['AppRight']['children']['AppDataDashboard']['children'];
        $countData = \Mmalls\DefinedModel::getInstance()->getCountData($dataList,'','',$wid);

        $data = array();
        $data['data'] = '';
        $data['name'] = $name;
        foreach ($countData as $item => $val){
            if($val['right_code'] != 'MMalls/PricePerUser'){
                if($val['right_code'] == 'MMalls/BillingCars'){
                    $data['data'] .= $val['right_name'].' '.$val['tally'].',';
                }else{
                    $data['data'] .= $val['right_name'].' ￥'.$val['tally'].',';
                }
            }
        }
        $data['data'] = rtrim($data['data'], ",") ;
        dump($data);
        exit();
        WeixinTemplateModel::getInstance()->sendBusinessReportMsgToCustomer($data,$openId);
    }

}