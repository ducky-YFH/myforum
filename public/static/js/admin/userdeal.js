// --------------选择框操作--------------
$(function () {
  let toast = new Toast()
  let $unick, $curpower = '';
  let $editBtn = $(".editBtn")
  let $selectList = ['能正常登录，正常发言', '能正常登录，禁止发言', '禁止登录，禁止发言']
  // 根据不同权限添加颜色
  updateColor()
  // 修改
  $($editBtn).on('click', (e) => {
    $unick = $(e.target).parent('td').siblings('.unick').html();
    $curpower = $(e.target).parent('td').siblings('.cur-power');
    $('.select-box, .cover').show(300);
    $('.select-box .select-title > span:eq(1)').html($unick)
  })
  // 取消
  $('.select-quit').on('click', () => {
    $('.select-box, .cover').hide(300);
  })
  // 确定
  $('.select-btn').on('click', () => {
    let $power = $(".select-content input:checked").val();
    $.ajax({
      type: "post",
      url: "userpower",
      data: { power: $power, unick: $unick },
      dataType: "JSON",
      success: function (response) {
        if (response.success == 1) {
          $('.select-box, .cover').hide(300);
          toast.success('修改成功')
        } else {
          alert('选择为当前的，请选择其他的')
        }
        $curpower.html($power)
        updateColor()
      }
    });
  })
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