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
//= require highcharts/highcharts
//= require flash
//= require react
//= require react_ujs
//= require components
//= require Chart.bundle
//= require chartkick
//= require bootstrap-datepicker
//= require module
//= require chosen.jquery.min.js
//= require react-select.js
//= require moment.js
//= require moment-with-locales.js

function getParameterByName(name) {
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
    var regex = new RegExp("[\\?&]" + name + "=([^&#]*)"),
        results = regex.exec(location.search);
    return results === null ? "" : decodeURIComponent(results[1].replace(/\+/g, " "));
}

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

$(document).ajaxError(function(event,xhr,options,exc) {

    $('form input').each(function(){
      if($(this).parent().parent().is('.has-error')){
        $(this).parent().unwrap();
        $(this).parent().find('.error-msgs').remove();
      }
    });

    $.each( xhr.responseJSON, function( key, value ){
      var field_name = ".validate_"+key;
      var field = $(field_name);

      // if(field.parent().parent().is('.has-error')){
      //   field.parent().unwrap();
      //   field.parent().find('.error-msgs').remove();
      //   // $(this).find('.error-msgs').remove();
      //   // field.parent().unwrap();
      // }
      field.before("<label class='control-label pull-right error-msgs'>"+value.join(', ')+"</label>");
      field.parent().wrap("<div class='has-error'></div>");
    });

});

$(document).on("ajax:error", function(event,xhr,options,exc){
  console.log(event);
  if( xhr.status == 401 ){
    window.location.reload();
  }
});


