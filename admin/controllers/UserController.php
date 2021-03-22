<?php

/**
 * 会员管理
 *User: lxw
 *Date: 2021-01-22
 */

namespace app\admin\controllers;


use app\models\Profile;
use app\models\User;
use yii\data\Pagination;
use yii\web\Controller;
use Yii;

class UserController extends Controller
{
    //会员列表
    public function actionUsers()
    {
        $model = User::find()->joinWith('profile');//关联user和profile表
        $count = $model->count();
        $pageSize = Yii::$app->params['pageSize']['user'];
        $pager = new Pagination(['totalCount' => $count, 'pageSize' => $pageSize]);
        $users = $model->offset($pager->offset)->limit($pager->limit)->all();
        $this->layout = 'layout1';
        return $this->render('users', ['users' => $users, 'pager' => $pager]);
    }

    //添加会员
    public function actionReg()
    {
        $this->layout = 'layout1';
        $model = new User();
        if (\Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            if ($model->reg($post)) {
                $this->redirect(['user/users']);
                Yii::$app->session->setFlash('info', '添加会员成功');

            }
        }
        $model->userpass = '';
        $model->repass = '';
        return $this->render('reg', ['model' => $model]);
    }


    //删除用户
    public function actionDel()
    {
        try {
            $userId = Yii::$app->request->get('userid');
            if (empty($userId)) {
                throw new \Exception();
            }
            //开启事务
            $trans = Yii::$app->db->beginTransaction();
            if ($obj = Profile::find()->where('userid=:id', [':id' => $userId])->one()) {
                $res = Profile::deleteAll('userid=:id', [':id' => $userId]);
                if (empty($res)) {
                    throw  new \Exception();
                }
            }
            if (!User::deleteAll('userid=:id', [':id' => $userId])) {
                throw new \Exception();
            }
            $trans->commit();//提交事务
        } catch (\Exception $exception) {
            if (Yii::$app->db->getTransaction()) {
                $trans->rollBack(); //回滚事务
            }
        }
        return $this->redirect(['user/users']);
    }
}