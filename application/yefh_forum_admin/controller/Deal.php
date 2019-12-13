<?php

namespace app\yefh_forum_admin\controller;

use think\Controller;

class Deal extends Controller
{
  // --------------------检查登录状态---------------------
  public function check()
  {
    if (!session('?user')) {
      $this->error('你尚未登录', 'yefh_forum_admin/admin/alogin');
    }
  }
  public function index()
  {
    $this->check();
    return view();
  }
  public function forumInfo()
  {
    // 查询数据数量
    $data = db('section')
      ->where('sbin', 0)
      ->field('*,(select count(yefh_mes.sid) from yefh_mes where yefh_section.sid=yefh_mes.sid) num')
      ->select();
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($data, JSON_UNESCAPED_UNICODE));
  }
  // --------------------------帖子操作--------------------------
  // 显示所有帖子
  public function mesdeal()
  {
    $this->check();
    $section = db("section")
      ->where('sbin', 0)
      ->select();
    return view("", ["section" => $section]);
  }
  // 根据板块筛选帖子，默认显示为板块1的帖子
  public function showmes()
  {
    $sid =  input("sid");
    // 查询数据库是否有第一个板块，如果没有就自动筛选
    $mesSid = db('section')->where(['sid' => $sid, 'sbin' => 0])->find();
    if (empty($mesSid)) {
      $sid = db('section')->where(['sbin' => 0])->find()['sid'];
    }
    $mes = db()
      ->view("mes", "mid,mtitle,unick,mcreateat")
      ->where(array("sid" => $sid, 'mbin' => 0))
      ->select();
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($mes, JSON_UNESCAPED_UNICODE));
  }
  // 删除帖子
  public function delmes()
  {
    // 讲帖子放入回收站
    $mRes = db('mes')->where('mid', input('mid'))->setField(array('mbin' => 2, 'mdelat' => time()));
    // 将帖子下面的所有回复放入回收站
    $rRes = db('res')->where('mid', input('mid'))->setField(array('rbin' => 2, 'rdelat' => time()));
    $mRes == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // -------------------------------------------------------------

  // ---------------------------回复操作---------------------------
  // 帖子回复信息显示
  public function resdeal()
  {
    $this->check();
    $mes = db()
      ->view("mes", "mtitle,unick,mcreateat")
      ->view("user", "unick", "mes.unick=user.unick")
      ->view("section", "sname", "section.sid=mes.sid")
      ->where(array("mid" => input('mid'), "mbin" => 0))
      ->find();
    $res = db()
      ->view("res", "rid,rcontent,unick,rcreateat")
      ->view("user", "uimg", "res.unick=user.unick")
      ->where(array("mid" => input('mid'), "rbin" => 0))
      ->select();
    return view("", ["mes" => $mes, "res" => $res]);
  }
  // 删除回复事件
  public function delres()
  {
    $res = db('res')->where('rid', input("rid"))->setField(array('rbin' => 3, 'rdelat' => time()));
    $res == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }

  // -------------------------------------------------------------

  // -------------------------用户管理操作-------------------------
  // 用户显示
  public function userdeal()
  {
    $this->check();
    $user = db('user')->select();
    return view('', ['user' => $user]);
  }
  // 修改用户权限
  public function userPower()
  {
    $re = db('user')
      ->where('unick',  input("unick"))
      ->setField('power', input('power'));
    $re == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // -------------------------------------------------------------
  // -------------------------板块管理操作-------------------------
  // 板块显示
  public function sectiondeal()
  {
    $this->check();
    $sections = db('section')->where('sbin', 0)->select();
    return view('', ['sections' => $sections]);
  }
  // 添加板块事件
  public function addSection()
  {
    $info = [
      'sname' => input("sname"),
      'sremark' => input("sremark")
    ];
    $re = db("section")->insert($info);
    $re == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // 修改板块事件
  public function alterSection()
  {
    $re = db("section")
      ->where('sid',  input("sid"))
      ->setField(array('sname' => input('sname'), 'sremark' => input('sremark')));
    $re == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // 删除板块
  public function delSection()
  {
    // 设置板块为回收站模式
    $sRes = db('section')->where('sid', input('sid'))->setField(array('sbin' => 1, 'sdelat' => time()));
    // 其板块下面所有的帖子和回复都为回收站模式
    $mRes = db('mes')->where('sid', input('sid'))->setField(array('mbin' => 1, 'mdelat' => time()));
    // 根据删除板块的sid找出所有相关的mid，为了就是找到对应的rid
    $midLs = db()->view('mes', 'mid')->where('sid', input('sid'))->select();
    // 设置改板块下的回复为回收模式
    foreach ($midLs as $item) {
      db('res')->where($item)->setField(array('rbin' => 1, 'rdelat' => time()));
    }
    $sRes == 1 ? $sRes = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($sRes, JSON_UNESCAPED_UNICODE));
  }
  // -------------------------------------------------------------
}
