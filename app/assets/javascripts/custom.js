// Tooltip

$("[data-tt=tooltip]").tooltip();

$("[data-toggle=popover]")
    .popover()
    .click(function (e) {
      e.preventDefault();
});



$('.chosen').chosen({
    width: '100%'
});
$('.chosen-select').chosen({
    disable_search_threshold: 10,
    width: '100%'
});

//daterangepicker
$('.drp').daterangepicker({
});

//alert
$('.swal-warning-confirm').on('click', function() {
  swal({
      title: 'Are you sure?',
      text: 'You will not be able to recover this file?',
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#DD6B55',
      confirmButtonText: 'Yes, delete it!',
      closeOnConfirm: false,
  }, function() {
      swal('Deleted', 'File has been deleted', 'success');
  });
});

//nestable
$('#nestable').nestable({
   group: 1
});

// nestable reinitiate
(function($) {
    var $plugin = $('<div>').nestable().data('nestable');

    var extensionMethods = {
        reinit: function() {
            // alias
            var list = this;

            // remove expand/collapse controls
            $.each(this.el.find(this.options.itemNodeName), function(k, el) {
                // if has <ol> child - remove previously prepended buttons
                if ($(el).children(list.options.listNodeName).length) {
                    $(el).children('button').remove();
                }
            });

            // remove delegated event handlers
            list.el.off('click', 'button');

            var hasTouch = 'ontouchstart' in document;
            if (hasTouch) {
                list.el.off('touchstart');
                list.w.off('touchmove');
                list.w.off('touchend');
                list.w.off('touchcancel');
            }

            list.el.off('mousedown');
            list.w.off('mousemove');
            list.w.off('mouseup');

            // call init again
            list.init();
        } // reinit
    };

    $.extend(true, $plugin.__proto__, extensionMethods);
})(jQuery);


//multiple select
