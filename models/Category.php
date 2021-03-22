<?php

/**
 *User: lxw
 *Date: 2021-01-26
 */

namespace app\models;

use Yii;
use yii\db\ActiveRecord;
use yii\helpers\ArrayHelper;

class Category extends ActiveRecord
{
    public static function tableName()
    {

        return "{{%category}}";
    }

    public function attributeLabels()
    {
        return [
            'parentid' => '上级分类',
            'title' => '分类名称'
        ];
    }

    public function rules()
    {
        return [
            ['parentid', 'required', 'message' => '上级分类不能为空'],
            ['title', 'required', 'message' => '分类名称'],
            ['createtime', 'safe'],
        ];
    }

    //添加分类
    public function add($data)
    {
        $data['Category']['createtime'] = time();
        if ($this->load($data) && $this->save()) {
            return true;
        } else {
            return false;
        }
    }

    //获取全部分类
    public function getData()
    {
        $cates = self::find()->all();
        return ArrayHelper::toArray($cates);
    }


    //得到分类树  **重点**
    public function getTree($cates, $pid = 0)
    {
        $tree = [];
        foreach ($cates as $cate) {
            if ($cate['parentid'] == $pid) {
                $tree[] = $cate;
                $tree = array_merge($tree, $this->getTree($cates, $cate['cateid']));
            }
        }
        return $tree;
    }

    //设置分类前缀 **重点**
    public function setPrefix($data, $p = '|----')
    {
        $tree = [];
        $num = 1;
        $prefix = [0 => 1];
//        var_dump($data);die;
        while ($val = current($data)) {
            $key = key($data);
            if ($key > 0) {
                if ($data[$key - 1]['parentid'] != $val['parentid']) {
                    $num++;
                }
            }

            if (array_key_exists($val['parentid'], $prefix)) {
                $num = $prefix[$val['parentid']];
            }
            $val['title'] = str_repeat($p, $num) . $val['title'];
            $prefix[$val['parentid']] = $num;
            $tree[] = $val;
            next($data);
        }
        return $tree;
    }

    //操作: **重点**
    public function getOptions()
    {
        $data = $this->getData();
        $tree = $this->getTree($data);
        $tree = $this->setPrefix($tree);
        $options = ['添加顶级分类'];
        foreach ($tree as $cate) {
            $options[$cate['cateid']] = $cate['title'];
        }
        return $options;
    }

    //分类列表
    public function getTreeList()
    {
        $data = $this->getData();
        $tree = $this->getTree($data);
        return $this->setPrefix($tree);
    }

    //菜单
    public function getMenu()
    {
        $top = self::find()->where('parentid = :pid', [':pid' => 0])->limit(10)->orderBy('createtime asc')->asArray()->all();
        $data = array();
        foreach ($top as $k => $cate) {
            $cate['children'] = self::find()->where('parentid = :pid', [':pid' => $cate['cateid']])->limit(10)->asArray()->all();
            $data[$k] = $cate;
        }
        return $data;
    }
}