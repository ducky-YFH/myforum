$('body').append('<div class="toast"></div>')
let $toast = $('.toast')

function Toast() {
  this.success = function (text) {
    $toast.fadeIn(500)
    $toast.html(text)
    $toast.addClass('success')
    $toast.fadeOut(800)
  }
  this.danger = function (text) {
    $toast.fadeIn(500)
    $toast.html(text)
    $toast.addClass('danger')
    $toast.fadeOut(800)
  }
}
