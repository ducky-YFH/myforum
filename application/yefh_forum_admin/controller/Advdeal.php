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
  // --------------------检查登录状态---------------------
  public function check()
  {
    if (!session('?user')) {
      $this->error('你尚未登录', 'yefh_forum_admin/admin/alogin');
    }
  }
  // ---------------------显示广告页---------------------
  public function ad()
  {
    $this->check();
    $ad = $this->connDb()->name('ad')->select();
    return view('', ['ad' => $ad]);
  }
  // ----------------------添加广告页---------------------
  public function addadv()
  {
    $this->check();
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
      $types = ["image/x-icon", "image/png", "image/jpeg", "image/gif"];
      if (!in_array($type, $types)) {
        $this->error("只支持jpg,icon,png,gif文件格式!");
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
    $this->check();
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
      $oldPath = ROOT_PATH . "public/static/upload/advimage/ad/" . $dbImg;
      // 判断图片格式
      // 获取上传图片格式
      $type = $file->getInfo()["type"];
      $types = ["image/x-icon", "image/png", "image/jpeg", "image/gif"];
      if (!in_array($type, $types)) {
        $this->error("只支持jpg,icon,png,gif文件格式!");
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
      // 删除旧图片
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
  public function slidedeal()
  {
    $this->check();
    $cData = $this->connDb()->name('carousel')->select();
    // dump($carouselData);
    return view('', ['cData' => $cData]);
  }
  // --------------------轮播图添加页-------------------
  public function addSlide()
  {
    $this->check();
    return view();
  }
  // -------------------轮播图添加功能------------------
  public function doAddSlide()
  {
    $file = request()->file('cimg');
    $path = ROOT_PATH . "public/static/upload/advimage/slide";
    if ($file) {
      // ---------------判断图片格式---------------
      // 获取上传图片格式
      $type = $file->getInfo()["type"];
      $types = ["image/x-icon", "image/png", "image/jpeg"];
      if (!in_array($type, $types)) {
        $this->error("只支持jpg,icon,png文件格式!");
      }
      // -----------限制图片上传大小，限定1000k之内-----------
      // 获取图片大小
      $size = $file->getInfo()["size"];
      if ($size > 1024 * 1000) {
        $this->error("上传图片的大小不能超过500k");
      }
      // 将文件移动到定义的目录下面
      $info = $file->move($path);
      // 获取移动后图片的名称
      $cImgName = $info->getSaveName();
      // 将获取到的图片名称存到数据库
      $adData = [
        'ctitle' => input("ctitle"),
        'cremark' => input('cremark'),
        'ctime' => time(),
        'ccheck' => '等待审核',
        'cimg' => $cImgName,
        'mid' => input('mid')
      ];
      $re = $this->connDb()->name('carousel')->insert($adData);
      if ($re == 1) {
        $this->success('上传成功！', url('yefh_forum_admin/advdeal/slidedeal'));
      }
    } else {
      $this->error('请上传图片');
    }
  }
  // --------------------轮播图修改页-------------------
  public function alterSlide()
  {
    $this->check();
    $curC = $this->connDb()->name('carousel')->where('cid', input('cid'))->find();
    return view('', ["curC" => $curC]);
  }
  // -------------------轮播图修改功能------------------
  public function changeSlide()
  {
    $dbData = $this->connDb()->name('carousel')->where('cid', input('cid'))->select()[0];
    $slideData = [
      'ctitle' => input("ctitle"),
      'cremark' => input('cremark'),
      'mid' => input('mid')
    ];
    foreach ($slideData as $key => $val) {
      if (empty($val)) {
        $slideData[$key] = $dbData[$key];
      }
    }
    $file = request()->file('cimg');
    $path = ROOT_PATH . "public/static/upload/advimage/slide";
    if ($file) {
      // 获取图片久路径
      $dbImg = $dbData['cimg'];
      $oldPath = ROOT_PATH . "public/static/upload/advimage/slide/" . $dbImg;
      // 判断图片格式
      // 获取上传图片格式
      $type = $file->getInfo()["type"];
      $types = ["image/x-icon", "image/png", "image/jpeg"];
      if (!in_array($type, $types)) {
        $this->error("只支持jpg,icon,png文件格式!");
      }
      // 限制图片上传大小，限定1000k之内
      // 获取图片大小
      $size = $file->getInfo()["size"];
      if ($size > 1024 * 1000) {
        $this->error("上传图片的大小不能超过500k");
      }
      // 将文件移动到定义的目录下面
      $info = $file->move($path);
      // 获取移动后图片的名称
      $CImgName = $info->getSaveName();
      // 删除就图片
      unlink($oldPath);
      $slideData['cimg'] = $CImgName;
    }
    $re = $this->connDb()->name('carousel')->where('cid', input('cid'))->setField($slideData);
    if ($re == 1) {
      $this->success("修改成功！", "yefh_forum_admin/advdeal/slidedeal");
    } else {
      $this->error("修改失败！");
    }
  }
  // -------------------轮播图删除功能------------------
  public function delCarousel()
  {
    $re = $this->connDb()->name('carousel')->where('cid', input('cid'))->delete();
    $re == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
  // -------------------轮播图删除功能------------------
  public function auditSlide()
  {
    $re = $this->connDb()->name('carousel')
      ->where('cid', input('cid'))
      ->setField('ccheck', input('power'));
    $re == 1 ? $response = ['success' => 1] : $response = ['success' => 0];
    header('Content-Type:application/json; charset=utf-8');
    exit(json_encode($response, JSON_UNESCAPED_UNICODE));
  }
}
