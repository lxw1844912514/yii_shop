<?php

/**
 *User: lxw
 *Date: 2021-01-15
 */

namespace app\controllers;


use yii\web\Controller;

class OrderController extends Controller
{
//    public $layout = false;

    //订单中心
    public function actionIndex()
    {
        $this->layout='layout2';
        return $this->render('index');
    }

    //收银台页面
    public function actionCheck()
    {
        $this->layout='layout1';
        return $this->render('check');
    }
}