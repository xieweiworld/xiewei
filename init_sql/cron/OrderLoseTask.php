<?php
/**
 * User: Lance
 * Date: 2017/05/05
 */
class OrderLoseTask{
    public function __construct(){
        $this->index();
    }

    public function index(){
        $orderModel = \Mall\OrderModel::getInstance();
        $orderList = $orderModel->getLoseOrder('order_code');
        if($orderList){
            foreach ($orderList as $v){
                $orderModel->payDefeat($v['order_code'],3);
            }
        }
    }
}