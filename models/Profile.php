<?php

/**
 *User: lxw
 *Date: 2021-03-17
 */

namespace app\models;


use yii\db\ActiveRecord;

class Profile extends ActiveRecord
{
    public static function tableName()
    {
        return "{{%profile}}";
    }

}