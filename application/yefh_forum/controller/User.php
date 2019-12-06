<?php

namespace app\yefh_forum\controller;

use think\Controller;

class User extends Controller
{
  // -----------------1711140136-查询模块-----------------
  public function showSec()
  {
    $re = db("section")
      ->select();
    // 渲染、传递参数
    return $re;
  }
  // 1711140136-登陆页面
  public function login()
  {
    return view();
  }
  // -----------------1711140136-执行登陆验证-----------------
  public function doLogin()
  {
    // 获取表单的用户名和密码
    $unick = input('username');
    $upa = input('userpass');
    $power = db()->view('user', 'power')->where('unick', $unick)->find()['power'];
    if($power !== '禁止登录，禁止发言'){
      // 组织链式操作，执行登陆验证查询
      $re = db('user')
        ->where('unick', $unick)
        ->where('upa', md5($upa))
        ->find();
      // 判断查询结果，实现跳转
      if ($re) {
        session('unick', $re['unick']);
        session('uimg', $re['uimg']);
        $this->success('登录成功', 'yefh_forum/index/index');
      } else {
        $this->error('登录失败', 'yefh_forum/user/login');
      }
    }else{
      $this->error("没有登录权限，请联系管理员");
    }
  }
  // --------------------1711140136-注册页面--------------------
  public function register()
  {
    $sec = $this->showSec();
    return view("", ["sec" => $sec]);
  }
  // -------------------1711140136-执行注册处理-------------------
  public function doRegister()
  {
    config("database.username", "change");
    config("database.password", "66666666");
    $unick = input("username");
    $upa = input("password");
    $uemail = input("email");
    $utel = input("phone");
    // 查询数据库判断是否存在这个用户
    $checkRe = db("user")->where("unick", $unick)->find();
    if (empty($checkRe)) {
      $info = [
        'unick' => $unick,
        'upa' => md5($upa),
        'uemail' => $uemail,
        'utel' => $utel,
        'uimg' => "default.png",
        'power' => "能正常登录，正常发言"
      ];
      $re = db("user")->insert($info);
      if ($re == 1) {
        $this->success("注册" . $unick . "成功", "yefh_forum/user/login");
      } else {
        $this->success('注册失败！', 'yefh_forum/user/register');
      }
    } else {
      $this->success("注册失败,该名称已被注册");
    }
  }
  // ------------------1711140136-联系我们------------------
  public function contact()
  {
    $sec = $this->showSec();
    return view("", ["sec" => $sec]);
  }
}
