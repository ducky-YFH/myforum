<?php

namespace app\yefh_forum_admin\controller;

use think\Controller;

class Deal extends Controller
{
  public function index()
  {
    return view();
  }
  public function forumInfo()
  {
    // 查询数据
    $data = db('section')
      ->field('*,(select count(yefh_mes.sid) from yefh_mes where yefh_section.sid=yefh_mes.sid) num')
      ->select();
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($data, JSON_UNESCAPED_UNICODE));
  }
  // --------------------------帖子操作--------------------------
  // 显示所有帖子
  public function mesdeal()
  {
    $section = db("section")
      ->select();
    return view("", ["section" => $section]);
  }
  // 根据板块筛选帖子，默认显示为板块1的帖子
  public function showmes($sid = 1)
  {
    $sid =  input("sid");
    $mes = db()
      ->view("mes", "mid,mtitle,unick,mcreateat")
      ->where("sid", $sid)
      ->select();
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($mes, JSON_UNESCAPED_UNICODE));;
  }
  // 删除帖子
  public function delmes()
  {
    $res = db('mes')->where('mid', input("mid"))->delete();
    $res == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));;
  }
  // -------------------------------------------------------------

  // ---------------------------回复操作---------------------------
  // 帖子回复信息显示
  public function resdeal()
  {
    $mes = db()
      ->view("mes", "mtitle,unick,mcreateat")
      ->view("user", "unick", "mes.unick=user.unick")
      ->view("section", "sname", "section.sid=mes.sid")
      ->where("mid", input('mid'))
      ->find();
    $res = db()
      ->view("res", "rid,rcontent,unick,rcreateat")
      ->view("user", "uimg", "res.unick=user.unick")
      ->where("mid", input('mid'))
      ->select();
    return view("", ["mes" => $mes, "res" => $res]);
  }
  // 删除帖子回复事件
  public function delres()
  {
    $res = db('res')->where('rid', input("rid"))->delete();
    $res == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));;
  }

  // -------------------------------------------------------------

  // -------------------------用户管理操作-------------------------
  // 用户显示
  public function userdeal()
  {
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
    $sections = db('section')->select();
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
    $re = db('section')->where('sid', input('sid'))->delete();
    $re == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // -------------------------------------------------------------

  public function recycledeal()
  {
    return view();
  }
}
