// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require cocoon
//= require mousetrap
//= require highcharts/highcharts
//= require turbolinks
//= require flash
//= require fss
//= require fss-settings

function retriggerFlash(){
  var flash = $('.flash-notice');
  var timeout;
  if (flash.length) {
    flash.css('display', 'inline-block');
    flash.prop('class','flash-notice animated fadeInDown');

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
};