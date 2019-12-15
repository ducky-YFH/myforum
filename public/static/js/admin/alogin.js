$(function () {
  $('.formInput').on('click', function () {
    $(this).css({ 'box-shadow': '0 0 6px 1px #3679b0' })
  })
  $('.loginBtn').on('click', function () {
    let ele1 = $('.formInput:first')
    let ele2 = $('.formInput:last')
    let flag1 = false
    let flag2 = false
    messageShow(ele1, '请输入账号', function (flag) {
      if (flag) {
        flag1 = flag
      }
    })
    messageShow(ele2, '请输入密码', function (flag) {
      if (flag) {
        flag2 = flag
      }
    })
    if (!flag1 || !flag2) {
      return false
    }
  })
  $('.formInput:first').on('blur', function () {
    let ele1 = $('.formInput:first')
    messageShow(ele1, '请输入账号')
  })
  $('.formInput:last').on('blur', function () {
    let ele2 = $('.formInput:last')
    messageShow(ele2, '请输入密码')
  })
  function messageShow(ele, text, callback) {
    let value = ele.val()
    if (!value) {
      $('.message').stop().animate({ 'opacity': '1' }).children('p').html(text)
      $(ele).css({ 'box-shadow': '0 0 6px 1px rgba(241, 50, 50, 0.7)' })
      callback && callback(false)
    } else {
      $('.message').stop().animate({ 'opacity': '0' })
      callback && callback(true)
    }
  }
})