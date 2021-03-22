<?php

/**
 *User: lxw
 *Date: 2021-03-15
 */

namespace app\models;


use yii\db\ActiveRecord;

class Cart extends ActiveRecord
{
    public static  function tableName()
    {
        return "{{%cart}}";
    }

    public function rules()
    {

        return [
            [['productid','productnum','price','userid'],'required'],
            ['createtime','safe'] //safe 不验证
        ];
    }

}