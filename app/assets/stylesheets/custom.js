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

//multiple select
