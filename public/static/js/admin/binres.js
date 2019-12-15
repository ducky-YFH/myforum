$(function () {
  layui.use('form', function () {
  });
  let toast = new Toast()
  let $tbody = $('.tbody');
  let $sid = 0;
  // 筛选回复
  $('.section-box').on('change', function (e) {
    $sid = $(this).val();
    getResdata($sid);
  })
  // 还原回复
  $('body').on('click', '.backBtn', function (e) {
    $rid = $(this).parents('tr').find('.rid').html()
    let $tr = $(this).parents('tr');
    backRes($tr, $rid);
  })
  // 彻底删除回复
  $('body').on('click', '.delBtn', function (e) {
    $rid = $(this).parents('tr').find('.rid').html()
    let $tr = $(this).parents('tr')
    $.ajax({
      type: "post",
      url: "removeres",
      data: { 'rid': $rid },
      dataType: "JSON",
      success: function (res) {
        if (res.success == 1) {
          toast.success('彻底删除成功！')
          $tr.remove()
        }
      }
    });
  })
  // 筛选回复
  function getResdata(sid) {
    $.ajax({
      type: "post",
      url: "secres",
      data: { 'sid': sid },
      dataType: "JSON",
      success: function (res) {
        $tbody.children().remove()
        if (res.success == 1) {
          res.resLs.forEach(item => {
            $tbody.append(`<tr>
              <td class="rid">${item.rid}</td>
              <td>${item.mtitle}</td>
              <td>${item.rcontent}</td>
              <td>${new Date(item.rcreateat * 1000).toLocaleString()}</td>
              <td>${item.unick}</td>
              <td>${new Date(item.rdelat * 1000).toLocaleString()}</td>
              <td>
                <button class="delBtn layui-btn layui-btn-danger layui-btn-sm" data-sid="" href="">彻底删除</button>
                ${item.rbin > 1 ? '<button class="backBtn layui-btn layui-btn-primary layui-btn-sm" data-sid="" href="">还原</button>' : ''}
              </td>
              <td>${filterRbin(item.rbin)}</td>
            </tr>`)
          });
        }
      }
    });
  }
  // 格式化rbin
  function filterRbin(rbin) {
    if (rbin == 1) {
      return '删除板块'
    } else {
      return '删除帖子'
    }
  }
  // 还原回复
  function backRes(tr, rid) {
    $.ajax({
      type: "post",
      url: "backRes",
      data: { 'rid': rid },
      dataType: "JSON",
      success: function (res) {
        console.log(res);
        if (res.success == 1) {
          toast.success('还原成功！')
          tr.remove()
        }
      }
    });
  }
})