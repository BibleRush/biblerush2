$(function(){
  $('#datepicker').datepicker({
    onSelect: function(date) {
      $('#start_date').text('Start Date: ' + date);
      $('input[id="start_date"]').attr('value', date);
    },
    dateFormat: 'yy/mm/dd'
  });

  // set start date in div and hidden form field
  $('#start_date').text('Start Date: ' + $('#datepicker').datepicker({ dateFormat: 'yy/mm/dd'}).val());
  $('input[id="start_date"]').attr('value', $('#datepicker').datepicker({ dateFormat: 'yy/mm/dd'}).val());
});
