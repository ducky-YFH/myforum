<?php

namespace app\yefh_forum\controller;

use think\Controller;

class User extends Controller
{
  // 1711140136-登陆页面
  public function login()
  {
    return view();
  }
  // 1711140136-执行登陆验证
  public function doLogin()
  {
    // 获取表单的用户名和密码
    $unick = input('username');
    $upa = input('userpass');
    // 组织链式操作，执行登陆验证查询
    $re = db('user')
      ->where('unick', $unick)
      ->where('upa', md5($upa))
      ->find();
    // 判断查询结果，实现跳转
    if($re){
      session('unick', $re['unick']);
      $this->success('登录成功', 'Index/index');
    }else{
      $this->error('登录失败', 'User/login');
    }
  }
  // 1711140136-注册页面
  public function register()
  {
    return view();
  }
  // 1711140136-执行注册处理
  public function doRegister()
  { 
    $this->success('注册成功', 'User/login');
  }
  // 1711140136-联系我们
  public function contact()
  {
    return view();
  }
}
