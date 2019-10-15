<?php

namespace app\yefh_forum\controller;

use think\Controller;

class Common extends Controller
{
  public function header()
  {
    // 查询模块
    $re = db("section")
      ->select();
    // 渲染、传递参数
    return view("", ["sec" => $re]);
  }
}
