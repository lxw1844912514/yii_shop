<?php

/**
 * 产品管理
 *User: lxw
 *Date: 2021-01-31
 */

namespace app\admin\controllers;


use app\models\Category;
use app\models\Product;
use crazyfd\qiniu\Qiniu;
use Yii;
use yii\data\Pagination;
use yii\web\Controller;

class ProductController extends Controller
{
    //商品列表
    public function actionList()
    {
        $this->layout = 'layout1';
        $model = Product::find();
        $count = $model->count();
        $pageSize = Yii::$app->params['pageSize']['manage'];
        $pager = new Pagination(['totalCount' => $count, 'pageSize' => $pageSize]);
        $products = $model->offset($pager->offset)->limit($pager->limit)->all();
        return $this->render('products', ['pager' => $pager, 'products' => $products]);
    }

    //添加商品
    public function actionAdd()
    {
        $this->layout = 'layout1';
        $model = new Product();
        $cate = new Category();
        $list = $cate->getOptions();
        unset($list[0]);

        if (\Yii::$app->request->isPost) {
            $post = \Yii::$app->request->post();
            $pics = $this->upload();
            if (!$pics) {
                $model->addError('cover', '封面不能为空');
            } else {
                $post['Product']['cover'] = $pics['cover'];
                $post['Product']['pics'] = $pics['pics'];
            }
            if ($pics && $model->add($post)) {
                \Yii::$app->session->setFlash('info', '添加成功');
            } else {
                \Yii::$app->session->setFlash('info', '添加失败');
            }

        }
        return $this->render('add', ['opts' => $list, 'model' => $model]);
    }

    //修改商品
    public function actionMod()
    {
        $this->layout = 'layout1';
        $cate = new Category();
        $list = $cate->getOptions();
        array_shift($list);
        $productid = Yii::$app->request->get('productid');
        $model = Product::find()->where('productid =:id', [':id' => $productid])->one();
        if (Yii::$app->request->isPost) {
            $post = Yii::$app->request->post();
            //修改封面
            $qiniu = new Qiniu(Product::AK, Product::SK, Product::DOMAIN, Product::BUCKET, 'east_china');
            $post['Product']['cover'] = $model->cover;
            if ($_FILES['Product']['error']['cover'] == 0) {
                $key = uniqid();
                $qiniu->uploadFile($_FILES['Product']['tmp_name']['cover'], $key);
                $post['Product']['cover'] = $qiniu->getLink($key);//覆盖原来的图片
                $qiniu->delete(basename($model->cover));//删除原来图片
            }

            //修改图片列表
            $pics = [];
            foreach ($_FILES['Product']['tmp_name']['pics'] as $key => $file) {
                if ($_FILES['Product']['error']['pics'][$key] > 0) {
                    continue;
                }
                $key = uniqid();
                $qiniu->uploadFile($file, $key);
                $pics[$key] = $qiniu->getLink($key);
            }
            $post['Product']['pics'] = json_encode(array_merge((array)json_decode($model->pics, true), $pics));
            if ($model->load($post) && $model->save()) {
                Yii::$app->session->setFlash('info', '修改成功');
            }
        }
        return $this->render('add', ['model' => $model, 'opts' => $list]);
    }

    //删除商品和商品图片
    public function actionDel()
    {
        $productid = Yii::$app->request->get('productid');
        $qiniu = new Qiniu(Product::AK, Product::SK, Product::DOMAIN, Product::BUCKET, 'east_china');
        $model = Product::find()->where('productid = :pid', [':pid' => $productid])->one();
        //删除封面图片
        $key = basename($model->cover);
        $qiniu->delete($key);
        //删除图片列表
        $pics = json_decode($model->pics, true);
        foreach ($pics as $k => $pic) {
            try {
                $qiniu->delete($k);
            } catch (\Exception $exception) {
                echo $exception->getMessage();
            }
        }
        Product::deleteAll('productid = :pid', [':pid' => $productid]);
        return $this->redirect(['product/list']);
    }

    //商品上架/下架
    public function actionOnoroff()
    {
        $productid = Yii::$app->request->get('productid');
        $model = Product::find()->where('productid = :pid', [':pid' => $productid])->one();
        Product::updateAll(['ison' => $model->ison ? 0 : 1], 'productid = :pid', [':pid' => $productid]);
        return $this->redirect(['product/list']);
    }


    //删除图片
    public function actionRemovepic()
    {
        $key = Yii::$app->request->get('key');
        $productId = Yii::$app->request->get('productid');
        $model = Product::find()->where('productid = :pid', [':pid' => $productId])->one();
        //七牛云删除图片操作
        $qiniu = new Qiniu(Product::AK, Product::SK, Product::DOMAIN, Product::BUCKET, 'east_china');
        $qiniu->delete($key);
        //更新数据库
        $pics = json_decode($model->pics, true);
        unset($pics[$key]);
        Product::updateAll(['pics' => json_encode($pics)], 'productid = :pid', [':pid' => $productId]);
        return $this->redirect(['product/mod', 'productid' => $productId]);
    }

    //上传图片
    public function upload()
    {
        if ($_FILES['Product']['error']['cover'] > 0) {
            return false;
        }

        $qiniu = new Qiniu(Product::AK, Product::SK, Product::DOMAIN, Product::BUCKET, 'east_china');
        $key = uniqid();
        $qiniu->uploadFile($_FILES['Product']['tmp_name']['cover'], $key);
        $cover = $qiniu->getLink($key);
        $pics = [];
        foreach ($_FILES['Product']['tmp_name']['pics'] as $k => $file) {
            if ($_FILES['Product']['error']['pics'][$k] > 0) {
                continue;
            }
            $key = uniqid();
            $qiniu->uploadFile($file, $key);
            $pics[$key] = $qiniu->getLink($key);
        }

        return ['cover' => $cover, 'pics' => json_encode($pics)];
    }


}