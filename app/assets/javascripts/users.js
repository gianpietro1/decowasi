$(document).ready(function(){

  $(".follow_button").click(function() {

    id = $(".follow_button").attr('id');
    user_id = parseInt(id.substring(id.indexOf("-")+1));

    if ($(".follow_button").hasClass("not-following")) {
      $.ajax({data: { user_id: user_id }, type: 'post', url: "/follow", success: function(r) { 
        $('#'+id).removeClass( "not-following"); 
        $('#'+id).addClass( "following").addClass("follow_button").text('Siguiendo');; 
        $('.followers').html(r);
      } });
    } else {
      $.ajax({data: { user_id: user_id }, type: 'post', url: "/unfollow", success: function(r) { 
        $('#'+id).removeClass( "following"); 
        $('#'+id).addClass( "not-following").addClass("follow_button").text('Seguir');
        $('.followers').html(r);
      } });
    }

  });

});