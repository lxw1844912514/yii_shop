<?php

/**
 *User: lxw
 *Date: 2021-01-15
 */

namespace app\controllers;


use yii\web\Controller;

class ProductController extends Controller
{
    public $layout = false; //去掉yii自带头部和脚部

    //产品分类页面
    public function actionIndex()
    {
        $this->layout='layout2';
        return $this->render('index');
    }


    //产品详情页面
    public function actionDetail()
    {
        $this->layout='layout2';
        return $this->render('detail');
    }
}