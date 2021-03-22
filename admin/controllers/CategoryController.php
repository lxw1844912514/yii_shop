<?php

/**
 * 分类管理
 *User: lxw
 *Date: 2021-01-26
 */

namespace app\admin\controllers;

use app\admin\Category;
use yii\web\Controller;

class CategoryController extends Controller
{
    //分类列表
    public function actionList()
    {
        $this->layout = 'layout1';
        $model = new Category();
        $cates = $model->getTreeList();

        return $this->render('list', ['cates' => $cates]);
    }

    //添加分类
    public function actionAdd()
    {
        $this->layout = 'layout1';
        $model = new Category();
        $list = $model->getOptions();
        if (\Yii::$app->request->isPost) {
            $post = \Yii::$app->request->post();
            if ($model->add($post)) {
                \Yii::$app->session->setFlash('info', '添加成功');
                $this->redirect(['category/add']);
            }
        }
        $model->title = '';
        return $this->render('add', ['list' => $list, 'model' => $model]);
    }

    //修改分类
    public function actionMod()
    {
        $this->layout = 'layout1';
        $cateid = \Yii::$app->request->get('cateid');
        $model = Category::find()->where('cateid =:id', [':id' => $cateid])->one();
        $list = $model->getOptions();
        if (\Yii::$app->request->isPost) {
            $post = \Yii::$app->request->post();
            if ($model->load($post) && $model->save()) {
                \Yii::$app->session->setFlash('info', '修改成功');
                $this->redirect(['category/list']);
            }
        }
        return $this->render('mod', ['model' => $model, 'list' => $list]);
    }

    //删除分类
    public function actionDel()
    {
        try {
            $cateid = \Yii::$app->request->get('cateid');
            if (empty($cateid)) {
                throw new \Exception('参数错误');
            }

            $data = Category::find()->where('parentid=:pid', [':pid' => $cateid])->one();
            if ($data) {
                throw  new \Exception(('该分类下有子类,不允许删除'));
            }
            if (!Category::deleteAll('cateid= :id', [':id' => $cateid])) {
                throw new \Exception('删除失败');
            }

        } catch (\Exception $exception) {
            \Yii::$app->session->setFlash('info', $exception->getMessage());
        }
        return $this->redirect(['category/list']);
    }


}