$(function(){
  /*****************************************************************
   create plan page
   *****************************************************************/
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

  /*****************************************************************
   plans show page
   *****************************************************************/
  // initially hide comment form
  $('.comment-form').hide();

  // toggle display of comment form
  $('.add-comment').click(function(){
    $(this).parent().next().next().fadeToggle();
    return false;
  });

  // ajax success
  $("form").bind('ajax:success', function(data, status, xhr){
    // fade in newly added comment
    var comment = $(status).hide();
    $(this).parent().next().prepend(comment)
    $(comment).slideDown('slow');

    // reset textarea
    $(this).find('textarea').val('');
  })
});
