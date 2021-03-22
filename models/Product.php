<?php

/**
 *User: lxw
 *Date: 2021-01-31
 */

namespace app\models;


use yii\db\ActiveRecord;

class Product extends ActiveRecord
{

//    const AK = 'toix9okVaTB0uz6oxPe_vTnW-psg62jGuQOb01uZ';
//    const SK = '9BbqEK8nmW-LlLWnmt4Aqe3CWWKN-IiSJMDlY0a3';
//    const DOMAIN = 'o7zgluxwg.bkt.clouddn.com';
//    const BUCKET = 'imooc-shop';
    const AK = '7OZquWHGCAZUgrvM2_0K8ZHERWhgw2aoE0ZehBt1';
    const SK = 'EcujbZayJMVx5jt1P0xb9dE_hBL908BpLNDOtJMK';
    const DOMAIN = 'http://static.welltrend.com.cn/';
    const BUCKET = 'static';

    public $cate;

    public function rules()
    {
        return [
            ['title', 'required', 'message' => '标题不能为空'],
            ['descr', 'required', 'message' => '描述不能为空'],
            ['cateid', 'required', 'message' => '分类不能为空'],
            ['price', 'required', 'message' => '单价不能为空'],
            [['price', 'saleprice'], 'number', 'min' => 0.01, 'message' => '价格必须是数字'],
            ['num', 'integer', 'min' => 0, 'message' => '库存必须是数字'],
            [['issale', 'ishot', 'pics', 'istui'], 'safe'],
            [['cover'], 'required']
        ];
    }

    public function attributeLabels()
    {
        return [
            'cateid' => '分类名称',
            'title' => '商品名称',
            'descr' => '商品描述',
            'price' => '商品价格',
            'ishot' => '是否热卖',
            'issale' => '是否促销',
            'saleprice' => '促销价格',
            'num' => '库存',
            'cover' => '图片封面',
            'pics' => '商品图片',
            'ison' => '是否上架',
            'istui' => '是否推荐',
        ];
    }

    public static function tableName()
    {
        return "{{%product}}";

    }

    public function add($data)
    {
        if ($this->load($data) && $this->save()) {
            return true;
        } else {
            return false;
        }

    }

}