<?php

namespace app\yefh_forum_admin\controller;

use think\Controller;
use think\Db;

class Advdeal extends Controller
{
  // -------------------连接后台数据库-------------------
  public function connDb()
  {
    $db = Db::connect('db_con2');
    return $db;
  }
  // ---------------------显示广告页---------------------
  public function ad()
  {
    $ad = $this->connDb()->name('ad')->select();
    return view('', ['ad' => $ad]);
  }
  // ----------------------添加广告页---------------------
  public function addadv()
  {
    return view();
  }
  // ---------------------添加广告功能---------------------
  public function doAddAdv()
  {
    $file = request()->file('aimg');
    $path = ROOT_PATH . "public/static/upload/advimage/ad";
    if ($file) {
      // ---------------判断图片格式---------------
      // 获取上传图片格式
      $type = $file->getInfo()["type"];
      $types = ["image/x-icon", "image/png", "image/jpeg"];
      if (!in_array($type, $types)) {
        $this->error("只支持jpg,icon,png文件格式!");
      }
      // -----------限制图片上传大小，限定500k之内-----------
      // 获取图片大小
      $size = $file->getInfo()["size"];
      if ($size > 1024 * 500) {
        $this->error("上传图片的大小不能超过500k");
      }
      // 将文件移动到定义的目录下面
      $info = $file->move($path);
      // 获取移动后图片的名称
      $adImgName = $info->getSaveName();
      // 将获取到的图片名称存到数据库
      $adData = [
        'atitle' => input("atitle"),
        'aremark' => input('aremark'),
        'atime' => time(),
        'ahref' => input('ahref'),
        'acheck' => '等待审核',
        'aimg' => $adImgName,
        'mid' => input('mid')
      ];
      $re = $this->connDb()->name('ad')->insert($adData);
      if ($re == 1) {
        $this->success('上传成功！', url('yefh_forum_admin/advdeal/ad'));
      }
    } else {
      $this->error('请上传图片');
    }
  }
  // ----------------------修改广告页----------------------
  public function alteradv()
  {
    $curAdv = $this->connDb()->name('ad')->where('aid', input('aid'))->find();
    return view('', ["curAdv" => $curAdv]);
  }
  // ---------------------修改广告功能---------------------
  public function changeAdv()
  {
    $dbData = $this->connDb()->name('ad')->where('aid', input('aid'))->select()[0];
    $adData = [
      'atitle' => input("atitle"),
      'aremark' => input('aremark'),
      'ahref' => input('ahref'),
      'mid' => input('mid')
    ];
    foreach ($adData as $key => $val) {
      if (empty($val)) {
        $adData[$key] = $dbData[$key];
      }
    }
    $file = request()->file('aimg');
    $path = ROOT_PATH . "public/static/upload/advimage/ad";
    if ($file) {
      // 获取图片久路径
      $dbImg = $dbData['aimg'];
      $oldPath = ROOT_PATH . "public\static\upload\advimage\ad\\" . $dbImg;
      // 判断图片格式
      // 获取上传图片格式
      $type = $file->getInfo()["type"];
      $types = ["image/x-icon", "image/png", "image/jpeg"];
      if (!in_array($type, $types)) {
        $this->error("只支持jpg,icon,png文件格式!");
      }
      // 限制图片上传大小，限定500k之内
      // 获取图片大小
      $size = $file->getInfo()["size"];
      if ($size > 1024 * 500) {
        $this->error("上传图片的大小不能超过500k");
      }
      // 将文件移动到定义的目录下面
      $info = $file->move($path);
      // 获取移动后图片的名称
      $adImgName = $info->getSaveName();
      // 删除旧头像
      unlink($oldPath);
      $adData['aimg'] = $adImgName;
    }
    $re = $this->connDb()->name('ad')->where('aid', input('aid'))->setField($adData);
    if ($re == 1) {
      $this->success("修改成功！", "yefh_forum_admin/advdeal/ad");
    } else {
      $this->error("修改失败！");
    }
  }
  // ----------------------删除广告功能----------------------
  public function delAdv()
  {
    $re = $this->connDb()->name('ad')->where('aid', input('aid'))->delete();
    $re == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // ----------------------审核广告功能----------------------
  public function auditAD()
  {
    $re = $this->connDb()->name('ad')
      ->where('aid', input('aid'))
      ->setField('acheck', input('power'));
    $re == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // ----------------------轮播图页----------------------
  public function slidedeal(){
    return view();
  }
  // ----------------------轮播图----------------------

}
