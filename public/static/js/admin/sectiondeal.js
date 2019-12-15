$(function () {
  let toast = new Toast()
  let $showBox = $('.show-box')
  let $showBoxTitle = $showBox.find('h1')
  let $cover = $('.cover')
  let $sid = '';
  let $input = $showBox.children().find('input')
  let $sureBtn = $showBox.find('.show-box-btn')
  // 修改、添加按钮事件
  $('.editBtn, .addSection').on("click", function (e) {
    $showBox.show(300);
    $cover.show(300);
    if (e.target.innerHTML === '修改') {
      let $curSection = $(e.target).parent().siblings('.sname').html()
      let $curRemark = $(e.target).parent().siblings('.sremark').html()
      $sid = parseInt($(e.target).parent().siblings('.sid').html())
      $($input[0]).val($curSection)
      $($input[1]).val($curRemark)
      $showBoxTitle.html('修改板块')
    } else {
      $showBoxTitle.html('添加板块')
    }
  })
  // 叉叉、确定按钮事件
  $('.show-box .show-box-close').on('click', function (e) {
    showHide()
    $input.val('')
  })
  // 确定按钮事件
  $sureBtn.on('click', (e) => {
    let $nowInput = $showBox.find('input')
    let $sname = $($nowInput[0]).val()
    let $sremark = $($nowInput[1]).val()
    if ($sname == '' || $sremark == '') {
      alert('请完善输入信息')
      return false;
    } else if ($showBoxTitle.html() == '添加板块') {
      addSection({ sname: $sname, sremark: $sremark })
    } else {
      alterSection({ sid: $sid, sname: $sname, sremark: $sremark })
    }
    showHide()
    $input.val('')
  })
  // 删除按钮事件
  $('.delBtn').on('click', function (e) {
    // 用不了全局的$sid, 哪个只能用于修改按钮事件
    let $sid = parseInt($(e.target).parent().siblings('.sid').html())
    let $tr = $(e.target).parents('tr')
    delSection($tr, $sid)
  })
  // 显示隐藏
  function showHide() {
    $showBox.hide(300)
    $cover.hide(300)
  }
  // 添加板块
  function addSection(data) {
    $.ajax({
      type: "post",
      url: "addSection",
      data: data,
      dataType: "JSON",
      success: function (res) {
        if (res.success == 1) {
          // alert('插入板块成功')
          toast.success('添加成功！')
          setTimeout(() => {
            window.location.reload()
          }, 500)
        }
      }
    });
  }
  // 修改板块
  function alterSection(data) {
    $.ajax({
      type: "post",
      url: "alterSection",
      data: data,
      dataType: "JSON",
      success: function (res) {
        console.log(res)
        if (res.success == 1) {
          toast.success('修改成功！')
          setTimeout(() => {
            window.location.reload()
          }, 500)
        }
      },
      error: function () {
        toast.success('服务器翻车了')
      }
    });
  }
  function delSection(tr, sid) {
    $.ajax({
      type: "post",
      url: "delsection",
      data: { sid: sid },
      dataType: "JSON",
      success: function (res) {
        console.log(res);
        if (res.success == 1) {
          toast.success('删除成功！')
          tr.remove()
        }
      },
      error: function () {
        toast.success('服务器翻车了')
      }
    });
  }
})