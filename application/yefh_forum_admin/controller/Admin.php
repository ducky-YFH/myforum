<?php

namespace app\yefh_forum_admin\controller;

use think\Controller;
use think\Db;

class Admin extends Controller
{
  // -------------------连接后台数据库-------------------
  public function connDb()
  {
    $db = Db::connect('db_con2');
    return $db;
  }
  // --------------------检查登录状态---------------------
  public function check()
  {
    if (!session('?user')) {
      $this->error('你尚未登录', 'yefh_forum/user/login');
    }
  }
  // ---------------------显示登录页---------------------
  public function alogin()
  {
    $res = $this->connDb()->name('admin')->select();
    return view();
  }
  // ————————————————————实现登录功能————————————————————
  public function doalogin()
  {
    $re = $this->connDb()->name('admin')
      ->where('user', input('user'))
      ->where('pwd', md5(input('pwd')))
      ->find();
    if ($re) {
      session('user', $re['user']);
      $this->success('登录成功', 'yefh_forum_admin/deal/index');
    } else {
      $this->error('登录失败');
    }
  }
  // ---------------------改密码页面---------------------
  public function aPa()
  {
    return view();
  }
  public function doApa()
  {
    $this->check();
    $dbPass = $this->connDb()
      ->name('admin')
      ->where('user', session('user'))
      ->find()['pwd'];
    if (md5(input('oldpwd')) === $dbPass) {
      if(input('newpwd') !== input('repwd')){
        $this->error("两次新密码不一致");
      }
      // 修改密码
      $re = $this->connDb()->name('admin')
        ->where('user', session('user'))
        ->setField('pwd', md5(input('newpwd')));
      session('user', null);
      $this->success('修改成功！重新登录', 'yefh_forum_admin/admin/alogin');
    } else {
      $this->error("旧密码错误");
    }
  }
  // --------------------实现注销功能--------------------
  public function aLogOut()
  {
    $this->check();
    session('user', null);
    $this->success('注销成功！', 'yefh_forum_admin/admin/alogin');
  }
}
