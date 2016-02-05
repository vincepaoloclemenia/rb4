$(document).ready(function() {
  var flash = $('.flash-notice');
  var timeout;
  if (flash.length) {
    flash.css('display', 'inline-block');
    flash.addClass('animated fadeInDown');

    timeout = setTimeout(function() {
      flash.addClass('animated fadeOutUp');
    }, 3100);

    flash.mouseover(function() {
      clearTimeout(timeout);
    });

    flash.mouseout(function() {
      timeout = setTimeout(function() {
        flash.addClass('animated fadeOutUp');
      }, 1000);
    });
  }

});