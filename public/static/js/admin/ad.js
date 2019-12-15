$(function () {
  // 删除按钮
  $('.delBtn').on('click', function (e) {
    let $aid = $(e.target).parent('td').siblings('.aid').html();
    $tr = $(this).parents('tr')
    delAdv($tr,$aid);
  })
  let toast = new Toast()
  // 广告审核功能
  let $unick, $curpower = '';
  let $audit = $(".audit")
  let $selectList = ['审核通过', '等待审核', '暂停使用']
  // 根据不同权限添加颜色
  updateColor()
  // 审核按钮
  $($audit).on('click', (e) => {
    $aid = $(e.target).parent('td').siblings('.aid').html();
    $curpower = $(e.target).parent('td').siblings('.cur-power');
    $('.select-box, .cover').show(300);
    $('.select-box .select-title > span:eq(1)').html($unick)
  })
  // 取消按钮
  $('.select-quit').on('click', () => {
    $('.select-box, .cover').hide(300);
  })
  // 确定按钮
  $('.select-btn').on('click', () => {
    let $power = $(".select-content input:checked").val();
    $('.select-box, .cover').hide(300);
    $.ajax({
      type: "post",
      url: "auditad",
      data: { 'aid': $aid, 'power': $power },
      dataType: "JSON",
      success: function (res) {
        if (res.success == 1) {
          toast.success('更换成功')
          $curpower.html($power)
          updateColor()
        }
      }
    });
  })
  // 删除功能
  function delAdv(tr, aid) {
    $.ajax({
      type: "post",
      url: "delAdv",
      data: { 'aid': aid },
      dataType: "JSON",
      success: function (res) {
        if (res.success == 1) {
          toast.success('删除成功！')
          tr.remove()
        }else{
          toast.danger('删除失败！')
        }
      }
    });
  }
  // 根据不同权限设置颜色
  function updateColor() {
    $('tbody .cur-power').each((index, item) => {
      let $item = $(item)
      if ($item.html() === $selectList[1]) {
        $(item).css('color', '#ffd777')
      } else if ($item.html() === $selectList[2]) {
        $(item).css('color', 'red')
      } else {
        $(item).css('color', '#63b173')
      }
    })
  }
})