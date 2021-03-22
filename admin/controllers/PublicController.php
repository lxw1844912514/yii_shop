<?php

/**
 * 后台首页登录注册
 *User: lxw
 *Date: 2021-01-17
 */

namespace app\admin\controllers;

use Yii;

use app\admin\models\Manager;
use yii\web\Controller;

class PublicController extends Controller
{
    //登录
    public function actionLogin()
    {
        $this->layout = false;
        $model = new Manager();
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->login($post)) {
                $this->redirect(['default/index']);
                Yii::$app->end();
            }
        }
        return $this->render('login', array('model' => $model));
    }

    //退出登录
    public function actionLogout()
    {
        \Yii::$app->session->removeAll();
        if (!isset(Yii::$app->session['admin']['isLogin'])) {
            $this->redirect(['public/login']);
            Yii::$app->end();
        }
        $this->goback();
    }


    //找回密码
    public function actionSeekpassword()
    {
        $this->layout = false;
        $model = new Manager();

        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->seekPass($post)) {
                Yii::$app->session->setFlash('info', '电子邮件已发送');
            }
        }
        return $this->render('seekpassword', ['model' => $model]);
    }
}