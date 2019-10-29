<?php

namespace app\yefh_forum\controller;

use think\Controller;

class Index extends Controller
{
  // 1711140136-检查登录状态
  public function check()
  {
    if (!session('?unick')) {
      $this->error('你尚未登录', 'User/login');
    }
  }
  // 1711140136-论坛门户页
  public function index()
  {
    return view();
  }
  // 1711140136-帖子列表页
  public function view()
  {
    // 查询数据
    $re = db("mes")
      ->where("sid", 1)
      ->order("mcreateat desc,mid")
      ->select();
    return view("", ["mes" => $re]);
  }
  // 1711140136-帖子发布页
  public function post()
  {
    $this->check();
    return view();
  }
  // 1711140136-执行发帖处理
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
  // 1711140136-帖子详细页
  public function detail()
  {
    return view();
  }
  // 1711140136-回复帖子
  public function doRes()
  {
    $this->check();
    config("database.username", "change");
    config("database.password", "66666666");
  }
  // 1711140136-渲染修改密码表单
  public function changePa()
  {
    $this->check();
    return view();
  }
  // 1711140136-执行修改密码
  public function doChangePa()
  {
    config("database.username", "change");
    config("database.password", "66666666");
  }
  // 1711140136-渲染上传用户头像表单
  public function me()
  {
    $this->check();
    return view();
  }
  // 1711140136-上传（更新）头像
  public function upMe()
  {
    config("database.username", "change");
    config("database.password", "66666666");
    // 获取上传文件
    $file = request()->file("avatar");
    // 定义上传文件目的地址
    $path = ROOT_PATH."public/static/upload/avatar";
    if($file){
      // ---------------判断图片格式---------------
      // 获取上传图片格式
      $type = $file->getInfo()["type"];
      $types = ["image/x-icon","image/png","image/jpeg"];
      if(!in_array($type, $types)){
        $this->error("只支持jpg,icon,png文件格式!", "Index/person");
      }
      // -----------限制图片上传大小，限定100k之内-----------
      // 获取图片大小
      $size = $file->getInfo()["size"];
      if($size > 1024 * 100){
        $this->error("上传图片的大小不能超过100k", "Index/person");
      }
      // 将文件移动到定义的目录下面
      $info = $file->move($path);
      // 获取移动后头像的名称
      $avatarName = $info->getSaveName();
      // 将获取到的头像名称存到数据库
      $re = db("user")->where("unick",session("unick"))->setField("uimg",$avatarName);
      // 判断是否成功存进数据库
      if ($re == 1) {
        // ---------------------删除旧头像---------------------
        $oldPath = ROOT_PATH."public\static\upload\avatar\\".session("uimg");
        $defaultPath = ROOT_PATH."public\static\upload\avatar\\"."default.png";
        if($oldPath !== $defaultPath){
          unlink($oldPath);
        }
        session("uimg",$avatarName);
        $this->success("上传成功", "Index/person");
      } else {
        $this->error("上传失败！", "Index/person");
      }
    }else{
      $this->error("请选择上传图片！", "Index/person");
    }
  }
  // 1711140136-个人页
  public function person()
  {
    $this->check();
    return view();
  }
  // 1711140136-注销用户
  public function logout()
  {
    $this->check();
    session('unick', null);
    $this->success('注销成功！', 'User/login');
  }
}
