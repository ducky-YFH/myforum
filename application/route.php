<?php
// +----------------------------------------------------------------------
// | ThinkPHP [ WE CAN DO IT JUST THINK ]
// +----------------------------------------------------------------------
// | Copyright (c) 2006~2018 http://thinkphp.cn All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: liu21st <liu21st@gmail.com>
// +----------------------------------------------------------------------
// 
use Think\Route;

// 主页
Route::rule("myforum","yefh_forum/index/index");
// 帖子列表页
Route::rule("view/[:sid]","yefh_forum/index/view");
// 详细页
Route::rule("detail/[:mid]","yefh_forum/index/detail");
// 发帖页
Route::rule("post/[:sid]/[:nowSec]","yefh_forum/index/post");
// 联系页
Route::rule("contact","yefh_forum/user/contact");
// 个人中心页
Route::rule("person","yefh_forum/index/person");
// 发帖功能
Route::rule("doPost","yefh_forum/index/doPost");
//  回复功能
Route::rule("doRes/:mid","yefh_forum/index/doRes");
// 上传头像功能
Route::rule("upMe","yefh_forum/index/upMe");
// 注销功能
Route::rule("logout","yefh_forum/index/logout");
// 登录功能
Route::rule("dologin","yefh_forum/user/dologin");
// 注册功能
Route::rule("doRegister","yefh_forum/user/doRegister");
// 后台登录页面
// Route::rule("admin","");

return [
	// 登录页
    'login' => 'yefh_forum/user/login',
    // 注册页
    'register' => 'yefh_forum/user/register',
    // 报错页
    // '__miss__' => 'yefh_forum/index/misserror' 
];
