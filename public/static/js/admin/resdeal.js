let toast = new Toast()
$(function () {
  layui.use('element', function () {
    var $ = layui.jquery
      , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    $('.site-demo-active').on('click', function () {
      var othis = $(this), type = othis.data('type');
    });
    let $tbody = $('.tbody')
    $('.delBtn').on('click', (e) => {
      let rid = e.target.dataset.rid
      let $tr = $(e.target).parents('tr')
      delRes($tr, rid)
    })
  });
})

// 删除回复
function delRes(tr, rid) {
  $.ajax({
    type: "get",
    url: "delres",
    data: { "rid": rid },
    dataType: "json",
    success: function (response) {
      if (response.success == 1) {
        toast.success('删除成功！')
        tr.remove();
      } else {
        toast.danger('删除失败！')
      }
    },
    error: function () {
      toast.danger('服务器翻车了！')
    }
  });
}