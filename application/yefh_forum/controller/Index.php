<?php

namespace app\yefh_forum\controller;

use think\Controller;

class Index extends Controller
{
  // 检查登录状态
  public function check()
  {
    if (!session('?unick')) {
      $this->error('你尚未登录', 'User/login');
    }
  }
  // 论坛门户页
  public function index()
  {
    return view();
  }
  // 帖子列表页
  public function view()
  {
    // 查询数据
    $re = db("mes")
      ->where("sid", 1)
      ->order("mcreateat desc,mid")
      ->select();
    return view("", ["mes" => $re]);
  }
  // 帖子发布页
  public function post()
  {
    $this->check();
    return view();
  }
  // 执行发帖处理
  public function doPost()
  {
    $this->check();
    config("database.username", "change");
    config("database.password", "66666666");
    $mes = [
      'mtitle' => input("mtitle"),
      'mcontent' => input("mcontent"),
      'unick' => session('unick'),
      'mcreateat' => time(),
      'sid' => 1
    ];
    // 写入帖子
    $re = db("mes")
      ->insert($mes);
    if ($re == 1) {
      $this->success("发帖成功！", "view");
    } else {
      $this->error("发帖失败！");
    }
  }
  // 帖子详细页
  public function detail()
  {
    return view();
  }
  // 回复帖子
  public function doRes()
  {
    $this->check();
    config("database.username", "change");
    config("database.password", "66666666");
  }
  // 渲染修改密码表单
  public function changePa()
  {
    $this->check();
    return view();
  }
  // 执行修改密码
  public function doChangePa()
  {
    config("database.username", "change");
    config("database.password", "66666666");
  }
  // 渲染上传用户头像表单
  public function me()
  {
    $this->check();
    return view();
  }
  // 上传（更新）头像
  public function upMe()
  {
    config("database.username", "change");
    config("database.password", "66666666");
  }
  // 个人页
  public function person()
  {
    $this->check();
    return view();
  }
  // 注销用户
  public function logout()
  {
    $this->check();
    session('unick', null);
    $this->success('注销成功！', 'User/login');
  }
}
