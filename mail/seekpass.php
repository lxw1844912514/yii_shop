<p>尊敬的<?php echo $adminuser; ?>: 你好</p>

<p>你的找回密码连接如下:</p>
<?php $url=Yii::$app->urlManager->createAbsoluteUrl(['admin/manager/mailchangepass','timestamp'=>$time,'adminuser'=>$adminuser,'token'=>$token])?>
<p><a href="<?php echo $url; ?>"><?php echo $url; ?></a></p>

<p>该连接5分钟内有效,请勿发送给别人.</p>

<p>该邮件为系统自动发送,请勿回复.</p>