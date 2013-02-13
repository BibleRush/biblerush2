$(document).ready(function(){
  $('.create_plan_link').bind('ajax:success', function(xhr, data, status) {
    $(data).hide().addClass('new_plan').prependTo('#plan_list').fadeIn(1000);
  });
});
