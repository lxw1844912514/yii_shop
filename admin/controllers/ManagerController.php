<?php

/**
 * 管理员管理
 *User: lxw
 *Date: 2021-01-19
 */

namespace app\admin\controllers;


use app\admin\models\Manager;
use yii\data\Pagination;
use yii\web\Controller;
use Yii;

class ManagerController extends Controller
{
    //找回密码时,通过邮箱中的连接修改密码
    public function actionMailchangepass()
    {
        $this->layout = false;
        $time = Yii::$app->request->get('timestamp');
        $adminuser = Yii::$app->request->get('adminuser');
        $token = Yii::$app->request->get('token');

        $model = new Manager();
        $myToken = $model->createToken($adminuser, $time);
        if ($token != $myToken) {
            $this->redirect(['public/login']);
            Yii::$app->end();
        }

        if (time() - $time > 30000) {
            $this->redirect(['public/login']);
            Yii::$app->end();
        }

        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->changePass($post)) {
//                $this->redirect(['public/login']);
                Yii::$app->session->setFlash('info', '密码修改成功');
            }
        }
        $model->adminuser = $adminuser;
        return $this->render('mailchangepass', ['model' => $model]);
    }

    //管理员列表
    public function actionManagers()
    {
        $this->layout = 'layout1';
        $model = Manager::find();
        $count = $model->count();
        $pageSize = Yii::$app->params['pageSize']['manage'];
        $pager = new Pagination(['totalCount' => $count, 'pageSize' => $pageSize]);
        $managers = $model->offset($pager->offset)->limit($pager->limit)->all();
        return $this->render('managers', ['managers' => $managers, 'pager' => $pager]);
    }

    //添加管理员
    public function actionReg()
    {
        $this->layout = 'layout1';
        $model = new Manager();
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->reg($post)) {
                $this->redirect(['manager/managers']);
                Yii::$app->session->setFlash('info', '添加成功');
            } else {
                Yii::$app->session->setFlash('info', '添加失败');
            }
        }
        //添加完成后,将输入框重置为空
        $model->adminuser = '';
        $model->adminemail = '';
        $model->adminpass = '';
        $model->repass = '';
        return $this->render('reg', ['model' => $model]);

    }

    //删除管理员
    public function actionDel()
    {
        $adminid = (int)Yii::$app->request->get('adminid');
        if (empty($adminid)) {
            $this->redirect(['manager/managers']);
        }
        $model = new Manager();
        if ($model->deleteAll('adminid= :id', [':id' => $adminid])) {
            Yii::$app->session->setFlash('info', '删除成功');
            $this->redirect(['manager/managers']);
        }
    }

    //修改邮箱
    public function actionChangeemail()
    {
        $this->layout = 'layout1';
        $model = Manager::find()->where('adminuser= :user', [':user' => Yii::$app->session['admin']['adminuser']])->one();
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->changeemail($post)) {
                Yii::$app->session->setFlash('info', '修改成功');
                $this->redirect(['manager/managers']);
            }
        }
        $model->adminpass = '';
        return $this->render('changeemail', ['model' => $model]);
    }

    //修改密码
    public function actionChangepass()
    {
        $this->layout = 'layout1';
        $model = Manager::find()->where('adminuser=:user', [':user' => Yii::$app->session['admin']['adminuser']])->one();
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->changepass($post)) {
                Yii::$app->session->setFlash('info', '密码修改成功');
                $this->redirect(['manager/managers']);
            }
        }
        $model->adminpass = '';
        $model->repass = '';
        return $this->render('changepass', ['model' => $model]);
    }
}