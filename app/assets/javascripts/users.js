$(document).ready(function(){

  $(".follow_button").click(function() {
  	if ($(this).hasClass("btn btn-success")) {
  		$(this).removeClass("btn btn-success");
      $(this).addClass("btn btn-info");
      $(this).text("Seguir");
  	} else {
     $(this).removeClass("btn btn-info");
  	 $(this).addClass("btn btn-success");
     $(this).text("Siguiendo");
    }
  });


});