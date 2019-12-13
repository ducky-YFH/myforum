<?php

namespace app\yefh_forum_admin\controller;

use think\Controller;

class Bindeal extends Controller
{
  // --------------------检查登录状态---------------------
  public function check()
  {
    if (!session('?user')) {
      $this->error('你尚未登录', 'yefh_forum_admin/admin/alogin');
    }
  }
  // 板块显示
  public function binsec()
  {
    $this->check();
    $section = db('section')->where('sbin', '1')->select();
    return view('', ['section' => $section]);
  }
  // 板块还原
  public function binsecBack()
  {
    // 设置板块为回收站模式
    $sRes = db('section')->where('sid', input('sid'))->setField(array('sbin' => 0, 'sdelat' => ''));
    // 其板块下面所有的帖子和回复都为回收站模式
    $mRes = db('mes')->where('sid', input('sid'))->setField(array('mbin' => 0, 'mdelat' => ''));
    // 根据删除板块的sid找出所有相关的mid，为了就是找到对应的rid
    $midLs = db()->view('mes', 'mid')->where('sid', input('sid'))->select();
    // 设置改板块下的回复为回收模式
    foreach ($midLs as $item) {
      db('res')->where($item)->setField(array('rbin' => 0, 'rdelat' => ''));
    }
    $sRes == 1 ? $sRes = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($sRes, JSON_UNESCAPED_UNICODE));
  }
  // 板块彻底删除
  public function delSec()
  {
    // 删除回复(1)
    $rRes = db()
      ->view('res', 'rid')
      ->join("yefh_mes", "yefh_res.mid = yefh_mes.mid")
      ->join("yefh_section", "yefh_mes.sid = yefh_section.sid")
      ->where('yefh_section.sid', input('sid'))
      ->select();
    // 创建一个存储rid的数组
    $ridLs = [];
    foreach ($rRes as $item) {
      array_push($ridLs, $item['rid']);
    }
    // 删除回复(2)
    db('res')->whereIn('rid', $ridLs)->delete();
    // 删除帖子
    db('mes')->where('sid', input('sid'))->delete();
    // 删除板块
    $sRes = db('section')->where('sid', input('sid'))->delete();
    $sRes == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // 帖子显示
  public function binmes()
  {
    $this->check();
    $section = db('section')->select();
    return view('', ['section' => $section]);
  }
  // 根据板块筛选帖子显示
  public function secMes()
  {
    $this->check();
    // $section = db('section')->select();
    $mesLs = db('mes')->where('mbin > 0 AND sid = ' . input('sid'))->select();
    empty($mesLs) ? $response = ['success' => 0] : $response = ['success' => 1, 'mesLs' => $mesLs];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // 还原帖子
  public function backMes()
  {
    $this->check();
    // 讲帖子放入回收站
    $mRes = db('mes')->where('mid', input('mid'))->setField(array('mbin' => 0, 'mdelat' => 0));
    // 将帖子下面的所有回复放入回收站
    $rRes = db('res')->where('mid', input('mid'))->setField(array('rbin' => 0, 'rdelat' => 0));
    $mRes == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // 彻底删除帖子
  public function delmes()
  {
    // 删除其下的所有评论
    db('res')->where('mid', input('mid'))->delete();
    // 删除帖子
    $mRes = db('mes')->where('mid', input('mid'))->delete();
    // 删除板块
    $mRes == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // 回复显示
  public function binres()
  {
    $this->check();
    $section = db('section')->select();
    return view('', ['section' => $section]);
  }
  // 根据板块筛选回复显示
  public function secRes()
  {
    $this->check();
    // $section = db('section')->select();
    $resLs = db('section')
      ->join("yefh_mes", "yefh_mes.sid = yefh_section.sid")
      ->join("yefh_res", "yefh_res.mid = yefh_mes.mid")
      ->where('yefh_res.rbin > 0 AND yefh_section.sid = ' . input('sid'))
      ->select();
    empty($resLs) ? $response = ['success' => 0] : $response = ['success' => 1, 'resLs' => $resLs];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // 回复还原
  public function backRes()
  {
    $this->check();
    // 将帖子下面的所有回复放入回收站
    $rRes = db('res')->where('rid', input('rid'))->setField(array('rbin' => 0, 'rdelat' => 0));
    $rRes == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // 彻底删除回复
  public function delRes()
  {
    $this->check();
    // 将帖子下面的所有回复放入回收站
    $rRes = db('res')->where('rid', input('rid'))->delete();
    $rRes >= 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
}
