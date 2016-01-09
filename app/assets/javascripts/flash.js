$(document).ready(function() {
  var flash = $('.flash-notice');
  if (flash.length) {
    flash.css('display', 'inline-block');
    flash.addClass('animated fadeInDown');
    setTimeout(function() {
      flash.addClass('animated fadeOutUp');
    }, 2000);
  }
});
