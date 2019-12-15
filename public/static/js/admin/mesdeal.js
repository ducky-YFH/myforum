let toast = new Toast()
$(function () {
  layui.use('element', function () {
    var $ = layui.jquery
      , element = layui.element; //Tab的切换功能，切换事件监听等，需要依赖element模块
    $('.site-demo-active').on('click', function () {
      var othis = $(this), type = othis.data('type');
    });
  });
  // 获取表格元素
  window.$tbody = $(".table tbody");
  // 获取板块选择元素
  let $seleLi = $(".layui-tab-title li");
  // 首次获取第一个板块数据
  getData();
  $seleLi.on('click', (e) => {
    let $target = $(e.target)
    let $sid = $target.data('sid')
    $('.mes-current').html($target.html()).data('cursid', $sid)
    getData($sid)
  })
  // 跳转到编辑页
  $('body').on('click', '.edit', function (e) {
    let mid = $(e.target).parents('td').siblings('td').html();
    $(location).attr('href', `resdeal?mid=${mid}`)
  })
  // 删除帖子
  $('body').on('click', '.del', function (e) {
    let $mid = $(e.target).parents('td').siblings('td').html();
    let $tr = $(this).parents('tr')
    deles($mid, $tr)
  })
})

// 已进入页面先加载第一个板块的数据
function getData(sid = 1) {
  $tbody.children().remove()
  $.ajax({
    type: "get",
    url: "showmes",
    data: { 'sid': sid },
    dataType: "json",
    success: function (res) {
      page(5, res);
    }
  });
}

// 删除功能
function deles(mid, tr) {
  $.ajax({
    type: "get",
    url: "delmes",
    data: { "mid": mid },
    dataType: "json",
    success: function (response) {
      if (response.success == 1) {
        let cursid = $('.mes-current').data('cursid')
        toast.success('删除成功！')
        tr.remove()
      } else {
        toast.danger('删除失败！')
      }
    },
    error: function () {
      toast.danger('服务器翻车了！')
    }
  });
}

// 分页
function page(limit, data) {
  let count = data.length;
  let dataPage = [];
  layui.use(['laypage', 'layer'], function () {
    var laypage = layui.laypage
      , layer = layui.layer;
    //总页数低于页码总数
    laypage.render({
      elem: 'pager',
      count: count,
      limit: limit,
      curr: 1,
      theme: '#4e66f1',
      jump: function (obj, first) {
        // 第一次进入
        if (first) {
          dataPage = data.slice(0, limit)
          showData(dataPage)
        }
        // 第二次进入
        if (!first) {
          dataPage = data.slice(limit * (obj.curr - 1), limit * obj.curr)
          showData(dataPage)
        }
      }
    });
  })
}

// 分页显示数据
function showData(dataList) {
  $tbody.empty()
  dataList.forEach((item, index) => {
    $tbody.append(`
      <tr>
        <td data-mid="${item.id}">${item.mid}</td>
        <td>${item.mtitle}</td>
        <td>${new Date(item.mcreateat * 1000).toLocaleString()}</td>
        <td>${item.unick}</td>
        <td>
          <button type="button" class="edit layui-btn layui-btn-normal layui-btn-sm">编辑</button>
          <button type="button" class="del layui-btn layui-btn-danger layui-btn-sm">删除</button>
        </td>
      </tr>
    `)
  });
}
