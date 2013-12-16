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
  $('#comment-form').hide();

  // toggle display of comment form
  $('.add-comment').click(function(){
    var form = $('#comment-form');
    form.hide();
    // width needed to prevent weird display issue with slideDown()
    form.width(form.parent().width());
    $(this).parent().parent().find('.comment-form-location').append(form);
    form.slideDown();

    // set plan_detail_id
    var plan_detail_id = $(this).parent().parent().data('plan-detail-id');
    $('#plan_detail_id').val(plan_detail_id);

    return false;
  });

  // ajax success
  $("form").bind('ajax:success', function(data, status, xhr){
    // fade in newly added comment
    var comment = $(status).hide();
    $(this).parent().parent().next().prepend(comment)
    $(comment).slideDown('slow');

    // reset textarea
    $(this).find('textarea').val('');
  })
});
