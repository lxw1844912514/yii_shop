<?php

/**
 *User: lxw
 *Date: 2021-01-14
 */

namespace app\controllers;
use app\models\Product;
class IndexController extends CommonController
{
    public $layout=false;
    public function actionIndex()
    {
        $this->layout = "layout1";
        $data['tui'] = Product::find()->where('istui = "1" and ison = "1"')->orderby('createtime desc')->limit(4)->all();
        $data['new'] = Product::find()->where('ison = "1"')->orderby('createtime desc')->limit(4)->all();
        $data['hot'] = Product::find()->where('ison = "1" and ishot = "1"')->orderby('createtime desc')->limit(4)->all();
        $data['all'] = Product::find()->where('ison = "1"')->orderby('createtime desc')->limit(7)->all();
//        $this->dd($last = $data['all'][count($data['all'])-1]);
        return $this->render("index", ['data' => $data]);
    }
}