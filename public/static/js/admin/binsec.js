layui.use('form', function () {
});
let $backBtn = $('.backBtn');
let $delBtn = $(".delBtn")
let toast = new Toast()
// 还原功能
$backBtn.on('click', function () {
  let $sid = $(this).parents('tr').find('.sid').html();
  $tr = $(this).parents('tr')
  $.ajax({
    type: "post",
    url: "binsecback",
    data: { 'sid': $sid },
    dataType: "JSON",
    success: function (res) {
      if (res.success == 1) {
        toast.success('还原成功！')
        $tr.remove()
      } else {
        toast.danger('还原失败！')
      }
    }
  });
})
// 彻底删除功能
$delBtn.on('click', function () {
  let $sid = $(this).parents('tr').find('.sid').html();
  $tr = $(this).parents('tr')
  $.ajax({
    type: "post",
    url: "delsec",
    data: { 'sid': $sid },
    dataType: "JSON",
    success: function (res) {
      console.log(res);
      if (res.success == 1) {
        toast.success('彻底删除成功！')
        $tr.remove()
      } else {
        toast.danger('彻底删除失败！')
      }
    }
  });
})