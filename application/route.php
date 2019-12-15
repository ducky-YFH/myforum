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

return [
  // 前台
  '[home]' => [
    // 主页
    "myforum" => "yefh_forum/index/index",
    // 帖子列表页
    "view/[:sid]" => "yefh_forum/index/view",
    // 详细页
    "detail/[:mid]" => "yefh_forum/index/detail",
    // 发帖页
    "post/[:sid]/[:nowSec]" => "yefh_forum/index/post",
    // 联系页
    "contact" => "yefh_forum/user/contact",
    // 个人中心页
    "person" => "yefh_forum/index/person",
    // 发帖功能
    "doPost" => "yefh_forum/index/doPost",
    //  回复功能
    "doRes/:mid" => "yefh_forum/index/doRes",
    // 上传头像功能
    "upMe" => "yefh_forum/index/upMe",
    // 注销功能
    "logout" => "yefh_forum/index/logout",
    // 登录功能
    "dologin" => "yefh_forum/user/dologin",
    // 注册功能
    "doRegister" => "yefh_forum/user/doRegister",
    // 检查用户是否存在
    "checkuser" => "yefh_forum/user/checkUser",
    // 登录页
    'login' => 'yefh_forum/user/login',
    // 注册页
    'register' => 'yefh_forum/user/register',
    // 报错页
    '__miss__' => 'yefh_forum/index/misserror',
  ],
  // 后台
  '[admin]' => [
    // 首页
    'index' => 'yefh_forum_admin/deal/index',
    'forumInfo' => 'yefh_forum_admin/deal/forumInfo',
    // 帖子管理
    'mesdeal' => 'yefh_forum_admin/deal/mesdeal',
    'showmes' => 'yefh_forum_admin/deal/showmes',
    'delmes' => 'yefh_forum_admin/deal/delmes',
    'resdeal' => 'yefh_forum_admin/deal/resdeal',
    'delres' => 'yefh_forum_admin/deal/delres',
    // 用户管理
    'userdeal' => 'yefh_forum_admin/deal/userdeal',
    'userPower' => 'yefh_forum_admin/deal/userPower',
    // 板块管理操作
    'sectiondeal' => 'yefh_forum_admin/deal/sectiondeal',
    'addSection' => 'yefh_forum_admin/deal/addSection',
    'alterSection' => 'yefh_forum_admin/deal/alterSection',
    'delSection' => 'yefh_forum_admin/deal/delSection',
    // 回收站管理
    'binsec' => 'yefh_forum_admin/bindeal/binsec',
    'binsecBack' => 'yefh_forum_admin/bindeal/binsecBack',
    'delSec' => 'yefh_forum_admin/bindeal/delSec',
    'binmes' => 'yefh_forum_admin/bindeal/binmes',
    'secMes' => 'yefh_forum_admin/bindeal/secMes',
    'backMes' => 'yefh_forum_admin/bindeal/backMes',
    'removemes' => 'yefh_forum_admin/bindeal/removemes',
    'binres' => 'yefh_forum_admin/bindeal/binres',
    'secRes' => 'yefh_forum_admin/bindeal/secRes',
    'backRes' => 'yefh_forum_admin/bindeal/backRes',
    'removeRes' => 'yefh_forum_admin/bindeal/removeRes',
    // 广告管理
    'ad' => 'yefh_forum_admin/advdeal/ad',
    'addadv' => 'yefh_forum_admin/advdeal/addadv',
    'doAddAdv' => 'yefh_forum_admin/advdeal/doAddAdv',
    'alteradv/:aid' => 'yefh_forum_admin/advdeal/alteradv',
    'changeAdv' => 'yefh_forum_admin/advdeal/changeAdv',
    'delAdv' => 'yefh_forum_admin/advdeal/delAdv',
    'auditAD' => 'yefh_forum_admin/advdeal/auditAD',
    'slidedeal' => 'yefh_forum_admin/advdeal/slidedeal',
    'addSlide' => 'yefh_forum_admin/advdeal/addSlide',
    'doAddSlide' => 'yefh_forum_admin/advdeal/doAddSlide',
    'alterSlide/:cid' => 'yefh_forum_admin/advdeal/alterSlide',
    'changeSlide' => 'yefh_forum_admin/advdeal/changeSlide',
    'delCarousel' => 'yefh_forum_admin/advdeal/delCarousel',
    'auditSlide' => 'yefh_forum_admin/advdeal/auditSlide',
    // 登录和更改密码
    'alogin' => 'yefh_forum_admin/admin/alogin',
    'doalogin' => 'yefh_forum_admin/admin/doalogin',
    'apa' => 'yefh_forum_admin/admin/apa',
    'doApa' => 'yefh_forum_admin/admin/doApa',
    'aLogOut' => 'yefh_forum_admin/admin/aLogOut',
    '__miss__' => 'yefh_forum_admin/deal/misserror',
  ],
];
