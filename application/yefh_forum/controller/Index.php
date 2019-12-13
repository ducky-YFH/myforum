<?php

namespace app\yefh_forum\controller;

use think\Controller;
use think\Db;

class Index extends Controller
{
  // 检查用户权限
  public function checkPower()
  {
    $power = db()
      ->view('user', 'power')
      ->where('unick', session('unick'))
      ->find()['power'];
    return $power;
  }
  // -------------------连接后台数据库-------------------
  public function connDb()
  {
    $db = Db::connect('db_con2');
    return $db;
  }
  // ----------------------1711140136查询模块----------------------
  public function showSec()
  {
    $re = db("section")
      ->select();
    // 渲染、传递参数
    return $re;
  }
  // ---------------------1711140136-检查登录状态---------------------
  public function check()
  {
    if (!session('?unick')) {
      $this->error('你尚未登录', 'yefh_forum/user/login');
    }
  }
  // ----------------------1711140136-论坛门户页----------------------
  public function index()
  {
    $sec = $this->showSec();
    // 循环广告体
    $AD = $this->connDb()->name('ad')->select();
    foreach ($AD as $key => $val) {
      if ($val['acheck'] !== '审核通过') {
        unset($AD[$key]);
      }
    }
    // 前10个最新帖子
    $mes = db()
      ->view("mes", "mid,mtitle,mcontent,unick,mcreateat,sid")
      ->view("user", "uimg", "mes.unick=user.unick")
      ->order('mcreateat desc')
      ->limit(0, 10)
      ->select();
    // 轮播图
    $cData = $this->connDb()->name('carousel')->select();
    foreach ($cData as $key => $val) {
      if ($val['ccheck'] !== '审核通过') {
        unset($cData[$key]);
      }
    }
    return view("", ["sec" => $sec, "AD" => $AD, "mes" => $mes, "cData" => $cData]);
  }
  // ----------------------1711140136-帖子列表页----------------------
  public function view($sid = 0)
  {
    $sec = $this->showSec();
    //  如果没有详细的sid就查询所有帖子
    if ($sid === 0) {
      $mes = db()
        ->view("mes", "mid,mtitle,mcontent,unick,mcreateat,sid")
        ->view("user", "uimg", "mes.unick=user.unick")
        ->order('mcreateat desc')
        ->paginate(6);
    } else {
      // 如果传入的sid不存在就显示不合法
      $flag = db('section')->where('sid', input('sid'))->select();
      if (empty($flag)) {
        $this->error("参数有误！", "yefh_forum/index/view");
      }
      $mes = db()
        ->view("mes", "mid,mtitle,mcontent,unick,mcreateat,sid")
        ->view("user", "uimg", "mes.unick=user.unick")
        ->where("sid", $sid)
        ->order('mcreateat desc')
        ->paginate(6);
    }
    $page = $mes->render();
    foreach ($sec as $key => $value) {
      if ($value["sid"] == $sid) {
        $nowSec = $value["sname"];
        break;
      } else {
        $nowSec = "所有帖子";
      }
    }
    return view("", ["mes" => $mes, "sec" => $sec, "nowSec" => $nowSec, "page" => $page]);
  }
  // ------------------1711140136-帖子发布页------------------
  public function post()
  {
    $this->check();
    $sec = $this->showSec();
    return view("", ["sec" => $sec]);
  }
  // ------------------1711140136-执行发帖处理------------------
  public function doPost()
  {
    $this->check();
    config("database.username", "change");
    config("database.password", "66666666");
    $power = $this->checkPower();
    if ($power === '能正常登录，正常发言') {
      if (empty(input("sid"))) {
        $this->error("请选择一个帖子类型");
      }
      $mes = [
        'mtitle' => input("mtitle"),
        'mcontent' => input("mcontent"),
        'unick' => session('unick'),
        'mcreateat' => time(),
        'sid' => input("sid")
      ];
      // 写入帖子
      $re = db("mes")
        ->insert($mes);
      if ($re == 1) {
        $this->success("发帖成功！", url('yefh_forum/index/view', ['sid' => input('sid')]));
      } else {
        $this->error("发帖失败！");
      }
    } else {
      $this->error("没有权限发言！请联系管理员");
    }
  }
  // ------------------1711140136-帖子详细页------------------
  public function detail($mid = 0)
  {
    // 查询模块
    $sec = $this->showSec();
    // 判断数据库是否存mid
    if ($mid === 0 || empty(db('mes')->where('mid', input('mid'))->select())) {
      $this->error("参数错误！,将自动跳转到帖子列表页", 'view');
    }
    // 查询和这个帖子有关的评论，根据mid（帖子编号）
    $mes = db()
      ->view("mes", "mtitle,mcontent,unick,mcreateat")
      ->view("user", "uimg", "mes.unick=user.unick")
      ->view("section", "sname", "section.sid=mes.sid")
      ->where("mid", $mid)
      ->find();
    // 查询和这个帖子有关的评论，根据mid（帖子编号）
    $res = db()
      ->view("res", "rcontent,unick,rcreateat")
      ->view("user", "uimg", "res.unick=user.unick")
      ->where("mid", $mid)
      ->paginate(5);
    // ->select();
    $page = $res->render();
    return view("", ["sec" => $sec, "mes" => $mes, "res" => $res, "page" => $page]);
  }
  // -------------------1711140136-回复帖子-------------------
  public function doRes()
  {
    $this->check();
    config("database.username", "change");
    config("database.password", "66666666");
    $power = $this->checkPower();
    if ($power === '能正常登录，正常发言') {
      $res = [
        'rcontent' => input("rcontent"),
        'unick' => session("unick"),
        'rcreateat' => time(),
        'mid' => input("mid"),
        'rdelat' => 0,
        'rbin' => 0
      ];
      // 将数据插进数据库
      $re = db("res")->insert($res);
      if ($re == 1) {
        $this->success("回复成功");
      } else {
        $this->error("回复失败!");
      }
    } else {
      $this->error("没有权限发言，请联系管理员");
    }
  }
  // -------------------1711140136-执行修改密码-------------------
  public function doChangePa()
  {
    config("database.username", "change");
    config("database.password", "66666666");
    $this->check();
    $dbPass = db()->view('user', 'upa')
      ->where('unick', session('unick'))
      ->find()['upa'];
    if (md5(input('oldPass')) === $dbPass) {
      // 修改密码
      $re = db('user')
        ->where('unick', session('unick'))
        ->setField('upa', md5(input('newPass')));
      session('unick', null);
      $this->success('修改成功！重新登录', 'yefh_forum/user/login');
    } else {
      $this->error("旧密码错误", "yefh_forum/index/person");
    }
  }
  // ----------------1711140136-渲染上传用户头像表单----------------
  public function me()
  {
    $this->check();
    $sec = $this->showSec();
    return view("", ["sec" => $sec]);
  }
  // ------------------1711140136-上传（更新）头像------------------
  public function upMe()
  {
    config("database.username", "change");
    config("database.password", "66666666");
    // 获取上传文件
    $file = request()->file("avatar");
    // 定义上传文件目的地址
    $path = ROOT_PATH . "public/static/upload/avatar";
    if ($file) {
      // ---------------判断图片格式---------------
      // 获取上传图片格式
      $type = $file->getInfo()["type"];
      $types = ["image/x-icon", "image/png", "image/jpeg"];
      if (!in_array($type, $types)) {
        $this->error("只支持jpg,icon,png文件格式!", "yefh_forum/index/person");
      }
      // -----------限制图片上传大小，限定100k之内-----------
      // 获取图片大小
      $size = $file->getInfo()["size"];
      if ($size > 1024 * 100) {
        $this->error("上传图片的大小不能超过100k", "yefh_forum/index/person");
      }
      // 将文件移动到定义的目录下面
      $info = $file->move($path);
      // 获取移动后头像的名称
      $avatarName = $info->getSaveName();
      // 将获取到的头像名称存到数据库
      $re = db("user")->where("unick", session("unick"))->setField("uimg", $avatarName);
      // 判断是否成功存进数据库
      if ($re == 1) {
        // ---------------------删除旧头像---------------------
        $oldPath = ROOT_PATH . "public\static\upload\avatar\\" . session("uimg");
        $defaultPath = ROOT_PATH . "public\static\upload\avatar\\" . "default.png";
        if ($oldPath !== $defaultPath) {
          unlink($oldPath);
        }
        session("uimg", $avatarName);
        $this->success("上传成功", "yefh_forum/index/person");
      } else {
        $this->error("上传失败！", "yefh_forum/index/person");
      }
    } else {
      $this->error("请选择上传图片！", "yefh_forum/index/person");
    }
  }
  // --------------------1711140136-个人页--------------------
  public function person()
  {
    $this->check();
    $sec = $this->showSec();
    return view("", ["sec" => $sec]);
  }
  // --------------------1711140136-注销用户--------------------
  public function logout()
  {
    $this->check();
    session('unick', null);
    $this->success('注销成功！', 'yefh_forum/user/login');
  }

  public function missError()
  {
    $this->error("你访问的页面不存在！", "yefh_forum/index/index");
  }
}

// ++++++++++++++++++view++++++++++++++++++
// if (input("sid")) {
      // ->select();
// } 
// else {
//   $mes = db()
//       ->view("mes","mid,mtitle,mcontent,unick,mcreateat,sid")
//       ->view("user", "uimg", "mes.unick=user.unick")
//       ->paginate(6);
// }
