<?php

/**
 *User: lxw
 *Date: 2021-01-17
 */

namespace app\admin\models;

use yii\db\ActiveRecord;


class Manager extends ActiveRecord
{
    public $rememberMe = true; //属性: 添加一个不存在的字段,
    public $repass = false;

    public static function tableName()
    {
        return '{{%manager}}';
    }

    //属性方法
    public function attributeLabels()
    {
        return [
            'adminuser' => '管理员账号',
            'adminemail' => '管理员邮箱',
            'adminpass' => '管理员密码',
            'repass' => '确认密码',
        ];

    }

    //路由规则
    public function rules()
    {
        return [
            ['adminuser', 'required', 'message' => '管理员账号不能为空', 'on' => ['login', 'seekpass', 'changepass', 'adminAdd', 'emailchange']],
            ['adminpass', 'required', 'message' => '管理员密码不能为空', 'on' => ['login', 'changepass', 'adminAdd', 'emailchange']],
            ['rememberMe', 'boolean', 'on' => 'login'],
            ['adminpass', 'validatePass', 'on' => ['login', 'emailchange']],

            ['adminemail', 'required', 'message' => '电子邮箱不能为空', 'on' => ['seekpass', 'adminAdd', 'emailchange']],
            ['adminemail', 'email', 'message' => '电子邮箱格式不正确', 'on' => ['seekpass', 'adminAdd', 'emailchange']],
            ['adminemail', 'validateEmail', 'on' => 'seekpass'],
            ['adminemail', 'unique', 'message' => '邮箱已注册', 'on' => ['adminAdd', 'emailchange']],

            ['adminuser', 'unique', 'message' => '管理员已注册', 'on' => 'adminAdd'],

            ['repass', 'required', 'message' => '确认密码不能为空', 'on' => ['changepass', 'adminAdd']],
            ['repass', 'compare', 'compareAttribute' => 'adminpass', 'message' => '两次密码不一致', 'on' => ['changepass', 'adminAdd']],

        ];
    }

    //验证账号密码是否匹配
    public function validatePass()
    {
        if (!$this->hasErrors()) {
            $data = self::find()->where('adminuser = :user and adminpass = :pass', [':user' => $this->adminuser, ':pass' => md5($this->adminpass)])->one();
            if (is_null($data)) {
                $this->addError('adminpass', '用户名或者密码错误');
            }
        }
    }

    //登录
    public function login($data)
    {
        $this->scenario = 'login';
        if ($this->load($data) && $this->validate()) {
            //todo::
            $lifetime = $this->rememberMe ? 24 * 3600 : 0;
            $session = \Yii::$app->session;
            session_name($lifetime);
           // session_set_cookie_params($lifetime);

            $session['admin'] = [
                'adminuser' => $this->adminuser,
                'isLogin' => 1,
            ];

            $this->updateAll(['logintime' => time(), 'loginip' => ip2long(\Yii::$app->request->userIP)], 'adminuser=:user', [':user' => $this->adminuser]);
            return (bool)$session['admin']['isLogin'];
        }

        return false;
    }

    //验证邮箱是否匹配
    public function validateEmail()
    {

        if (!$this->hasErrors()) {
            $data = self::find()->where('adminuser = :user and adminemail = :email ', [':user' => $this->adminuser, ':email' => $this->adminemail])->one();
            if (is_null($data)) {
                $this->addError('adminemail', '邮箱不匹配');
            }
        }
    }

    //找回密码
    public function seekPass($data)
    {
        $this->scenario = 'seekpass';
        if ($this->load($data) && $this->validate()) {
            $time = time();
            $token = $this->createToken($data['Manager']['adminuser'], $time);
            $mailer = \Yii::$app->mailer->compose('seekpass', ['adminuser' => $data['Manager']['adminuser'], 'time' => $time, 'token' => $token]);
            $mailer->setFrom('qingchunyangguang3@geekpandashare.com');
            $mailer->setTo($data['Manager']['adminemail']);
            $mailer->setSubject('yiiShop 商城测试');
            if ($mailer->send()) {
                return true;
            }
        }
        return false;
    }

    //创建token
    public function createToken($adminuser, $time)
    {
        return md5(md5($adminuser) . base64_encode(\Yii::$app->request->userIp) . md5($time));
    }


    //修改密码
    public function changePass($data)
    {
        $this->scenario = 'changepass';
        if ($this->load($data) && $this->validate()) {
            return (bool)$this->updateAll(['adminpass' => md5($this->adminpass)], 'adminuser=:user', [':user' => $this->adminuser]);
        }
        return false;
    }


    //注册添加管理员
    public function reg($data)
    {
        $this->scenario = 'adminAdd';
        if ($this->load($data) && $this->validate()) {
            $this->adminpass = md5($data['Manager']['adminpass']);
            $this->createtime = time();
            $this->logintime = time();
            if ($this->save(false)) { //此处false 代表不再验证
                return true;
            }
            return false;
        }
        return false;
    }

    //修改管理员信息
    public function changeemail($data)
    {
        $this->scenario = 'emailchange';
        if ($this->load($data) && $this->validate()) {
            return (bool)$this->updateAll(['adminemail' => $this->adminemail], 'adminuser =:user', [':user' => $this->adminuser]);
        }
        return false;
    }


}