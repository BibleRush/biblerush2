$(document).ready(function() {
  $('#emoji_list img').click(function(){
    insertAtCaret('comment_comment', ':' + this.alt + ':');
  });
});
