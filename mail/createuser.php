<p>恭喜您,您的账号已经申请成功 !</p>

<p>欢迎加入商城</p>
<p>你的用户名为: <?php echo $username; ?></p>
<p>你的密码为:<?php echo $userpass; ?></p>

<p>您可以通过该邮箱或者用户名进行登录！</p>

<p>登录地址：<?php $url= Yii::$app->urlManager->createAbsoluteUrl(['member/auth']); ?></p>

<?php //$url=Yii::$app->urlManager->createAbsoluteUrl(['admin/manager/mailchangepass','timestamp'=>$time,'adminuser'=>$adminuser,'token'=>$token])?>
<p><a href="<?php echo $url; ?>"><?php echo $url; ?></a></p>


<p>该邮件为系统自动发送,请勿回复.</p>