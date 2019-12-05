<?php

namespace app\yefh_forum_admin\controller;

use think\Controller;

class Index extends Controller
{
  public function index()
  {
    return view();
  }
  // --------------------------帖子操作--------------------------
  public function mesdeal()
  {
    $section = db("section")
      ->select();
    return view("", ["section" => $section]);
  }
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
  public function delmes()
  {
    $res = db('mes')->where('mid', input("mid"))->delete();
    $res == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));;
  }
  // -------------------------------------------------------------

  // ---------------------------回复操作---------------------------
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
  public function delres()
  {
    $res = db('res')->where('rid', input("rid"))->delete();
    $res == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));;
  }

  // -------------------------------------------------------------

  // -------------------------用户管理操作-------------------------
  public function userdeal()
  {
    $user = db('user')->select();
    return view('', ['user' => $user]);
  }
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
  public function sectiondeal()
  {
    return view();
  }
  public function recycledeal()
  {
    return view();
  }
  public function addeal()
  {
    return view();
  }
  public function slideshowdeal()
  {
    return view();
  }
  public function changePa()
  {
    return view();
  }
  public function logout()
  {
    return view();
  }
  public function reception()
  {
    return view();
  }
}
