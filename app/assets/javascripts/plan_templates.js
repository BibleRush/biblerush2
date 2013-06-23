$(document).ready(function(){
  $('.plan-schedule').hide();

  $('.view-schedule').click(function(){
    $(this).parent().next().next().slideToggle();

    if($(this).text() == "Show Schedule") {
      $(this).text("Hide Schedule");
    } else {
      $(this).text("Show Schedule");
    };
  });
});
