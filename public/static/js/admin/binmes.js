$(function () {
  layui.use('form', function () {
  });
  let $tbody = $('.tbody')
  let $sid = 0
  let $delBtn = $('.delBtn')
  let toast = new Toast()
  // 筛选帖子
  $('.section-box').on('change', function (e) {
    $sid = $(this).val();
    getMesdata($sid);
  })
  // 还原帖子
  $('body').on('click', '.backBtn', function (e) {
    $mid = $(this).parents('tr').find('.mid').html()
    let $tr = $(e.target).parents("tr")
    backMes($tr, $mid);
  })
  // 彻底删除功能
  $('body').on('click', '.delBtn', function (e) {
    $mid = $(this).parents('tr').find('.mid').html()
    let $tr = $(this).parents('tr')
    $.ajax({
      type: "post",
      url: "delmes",
      data: { 'mid': $mid },
      dataType: "JSON",
      success: function (res) {
        console.log(res);
        if (res.success == 1) {
          toast.success('彻底删除成功！')
          $tr.remove()
        }
      }
    });
  })
  // 筛选帖子
  function getMesdata(sid) {
    $.ajax({
      type: "post",
      url: "secmes",
      data: { 'sid': sid },
      dataType: "JSON",
      success: function (res) {
        $tbody.children().remove()
        if (res.success == 1) {
          res.mesLs.forEach(item => {
            $tbody.append(`<tr>
              <td class="mid">${item.mid}</td>
              <td>${item.mtitle}</td>
              <td>${new Date(item.mcreateat * 1000).toLocaleString()}</td>
              <td>${item.unick}</td>
              <td>${new Date(item.mdelat * 1000).toLocaleString()}</td>
              <td>
                <button class="delBtn layui-btn layui-btn-danger layui-btn-sm" data-sid="" href="">彻底删除</button>
                ${item.mbin > 1 ? '<button class="backBtn layui-btn layui-btn-primary layui-btn-sm" data-sid="" href="">还原</button>' : ''}
              </td>
              <td>${filterMbin(item.mbin)}</td>
            </tr>`)
          });
        }
      }
    });
  }
  function filterMbin(mbin) {
    if (mbin == 1) {
      return '删除板块'
    } else {
      return '删除帖子'
    }
  }
  // 还原帖子
  function backMes(tr, mid) {
    $.ajax({
      type: "post",
      url: "backMes",
      data: { 'mid': mid },
      dataType: "JSON",
      success: function (res) {
        if (res.success == 1) {
          toast.success("还原成功！")
          tr.remove()
        }
      }
    });
  }
})