<!-- main container -->
<div class="content">

    <div class="container-fluid">
        <div id="pad-wrapper" class="users-list">
            <div class="row-fluid header">
                <h3>会员列表</h3>
                <div class="span10 pull-right">
                    <input type="text" class="span5 search" placeholder="请输入用户名"/>

                    <!-- custom popup filter -->
                    <!-- styles are located in css/elements.css -->
                    <!-- script that enables this dropdown is located in js/theme.js -->
                    <div class="ui-dropdown">
                        <div class="head" data-toggle="tooltip" title="Click me!">
                            Filter users
                            <i class="arrow-down"></i>
                        </div>
                        <div class="dialog">
                            <div class="pointer">
                                <div class="arrow"></div>
                                <div class="arrow_border"></div>
                            </div>
                            <div class="body">
                                <p class="title">
                                    Show users where:
                                </p>
                                <div class="form">
                                    <select>
                                        <option/>
                                        Name
                                        <option/>
                                        Email
                                        <option/>
                                        Number of orders
                                        <option/>
                                        Signed up
                                        <option/>
                                        Last seen
                                    </select>
                                    <select>
                                        <option/>
                                        is equal to
                                        <option/>
                                        is not equal to
                                        <option/>
                                        is greater than
                                        <option/>
                                        starts with
                                        <option/>
                                        contains
                                    </select>
                                    <input type="text"/>
                                    <a class="btn-flat small">Add filter</a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <a href="<?php echo yii\helpers\Url::to(['user/reg']) ?>" class="btn-flat success pull-right">
                        <span>&#43;</span>
                        添加会员
                    </a>
                </div>
            </div>

            <!-- Users table -->
            <div class="row-fluid table">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th class="span4 sortable">
                            用户名
                        </th>
                        <th class="span3 sortable">
                            <span class="line"></span>真实姓名
                        </th>
                        <th class="span3 sortable">
                            <span class="line"></span>邮箱
                        </th>
                        <th class="span2 sortable">
                            <span class="line"></span>昵称
                        </th>
                        <th class="span3 sortable ">
                            <span class="line"></span>性别
                        </th>
                        <th class="span3 sortable ">
                            <span class="line"></span>年龄
                        </th>
                        <th class="span3 sortable ">
                            <span class="line"></span>生日
                        </th>
                        <th class="span3 sortable ">
                            <span class="line"></span>操作
                        </th>
                    </tr>
                    </thead>
                    <tbody>
                    <!-- row -->
                    <?php foreach ($users as $user): ?>
                        <tr class="first">
                            <td>
                                <a href="user-profile.html" class="name">
                                    <?php if (empty($user->profile->avatar)): ?>
                                        <img src="<?php echo Yii::$app->params['defaultValue']['avartar'] ?>"
                                             class="img-circle avatar hidden-phone"/>
                                    <?php else: ?>
                                        <img src="assets/uploads/avatar/<?php echo $user->profile->avatar ?>"
                                             class="img-circle avatar hidden-phone"/>
                                    <?php endif ?>
                                    <?php echo $user->username ?>
                                </a>
                            </td>
                            <td>
                                <?php echo $user->profile->truename ?? '未填写' ?>
                            </td>
                            <td>
                                <span class="subtext"><?php echo $user->useremail ?></span>
                            </td>
                            <td>
                                <?php echo $user->profile->nickname ?? '未填写' ?>
                            </td>
                            <td>
                                <?php echo $user->profile->sex ?? '未填写' ?>
                            </td>
                            <td>
                                <?php echo $user->profile->age ?? '未填写' ?>
                            </td>
                            <td>
                                <?php echo $user->profile->birthday ?? date('Y-m-d H:i:s') ?>
                            </td>

                            <td class="span3 sortable align-left">
                                <a href="<?php echo yii\helpers\Url::to(['user/del', 'userid' => $user->userid]) ?>">删除</a>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
            <div class="pagination pull-right">
                <ul>
                    <li><a href="#">&#8249;</a></li>
                    <li><a class="active" href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                    <li><a href="#">&#8250;</a></li>
                </ul>
            </div>
            <!-- end users table -->
        </div>
    </div>
</div>
<!-- end main container -->