<?php

namespace app\yefh_forum_admin\controller;

use think\Controller;

class Index extends Controller
{
  public function index()
  {
    return view();
  }
  // --------------------------帖子管理事件--------------------------
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
    exit(json_encode($mes, JSON_UNESCAPED_UNICODE));
  }
  // -------------------------------------------------------------

  // ---------------------------回复事件---------------------------
  public function resdeal()
  {
    $mes = db()
      ->view("mes", "mtitle,unick,mcreateat")
      ->view("user", "unick", "mes.unick=user.unick")
      ->view("section", "sname", "section.sid=mes.sid")
      ->where("mid", input('mid'))
      ->find();
    dump($mes);
    return view();
  }
  // -------------------------------------------------------------
  public function userdeal()
  {
    return view();
  }
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
