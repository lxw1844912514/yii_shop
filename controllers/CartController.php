<?php

/**
 *User: lxw
 *Date: 2021-01-15
 */

namespace app\controllers;


use app\models\Cart;
use app\models\Product;
use app\models\User;
use yii\web\Controller;

class CartController extends Controller
{
    public $layout = false;

    //购物车页面
    public function actionIndex()
    {
        $this->layout = 'layout1';
        return $this->render('index');
    }

    //添加到购物车
    public function actionAdd()
    {
        if (\Yii::$app->session['isLogin'] != 1) {
            return $this->redirect(['member/auth']);
        }
        $userid = User::find()->where('username= :name', [':name' => \Yii::$app->session['loginname']])->one()->userid;
        if (\Yii::$app->request->isPost) {
            $post = \Yii::$app->request->post();
            $num = \Yii::$app->request->post()['productnum'];
            $data['Cart'] = $post;
            $data['Cart']['userid'] = $userid;
        }

        if (\Yii::$app->request->isGet) {
            $productid = \Yii::$app->request->get('productid');
            $model = Product::find()->where('productid =:pid', [':pid' => $productid])->one();
            $price = $model->issale ? $model->$model->saleprice : $model->price;
            $num = 1;
            $data['Cart'] = ['productid' => $productid, 'productnum' => $num, 'price' => $price, 'userid' => $userid];

            if (!$model = Cart::find()->where('productid = :pid and userid = :uid ', [':pid' => $productid, ':uid' => $userid])->one()) {
                $model = new Cart;
            } else {
                $data['Cart']['productnum'] = $model->productnum + $num;
            }
            $data['Cart']['createtime'] = time();
            $model->load($data);
            $model->save();
            return $this->redirect(['cart/index']);
        }

    }
}