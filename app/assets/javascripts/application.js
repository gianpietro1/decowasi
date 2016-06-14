// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require turbolinks
//= require_tree .

$(document).ready(function(){

  $(".fa-heart").click(function() {

	  var project_id = $(this).attr('id');

  	if ($('#'+project_id).hasClass("heart_clicked")) {
		  $.ajax({data: { project_id: project_id }, type: 'post', url: "/unlike", success: function(r) { 
		  	$('#'+project_id).removeClass( "heart_clicked"); 
		  	$('#likes-'+project_id).html(r);
		  } });
  	} else {
		  $.ajax({data: { project_id: project_id }, type: 'post', url: "/like", success: function(r) { 
		  	$('#'+project_id).addClass( "heart_clicked"); 
		  	$('#likes-'+project_id).html(r);
			} });
  	}

  });

  $(".fa-star").click(function() {

    var project_id = $(this).attr('id').replace('favorite-','');

    if ($('#favorite-'+project_id).hasClass("star_clicked")) {
      $.ajax({data: { project_id: project_id }, type: 'post', url: "/unfavorite", success: function(r) { 
        $('#favorite-'+project_id).removeClass( "star_clicked"); 
        $('#favorites-'+project_id).html(r);
      } });
    } else {
      $.ajax({data: { project_id: project_id }, type: 'post', url: "/favorite", success: function(r) { 
        $('#favorite-'+project_id).addClass( "star_clicked"); 
        $('#favorites-'+project_id).html(r);
      } });
    }

  });


	$('.navbar-toggle').click(function() {
    $('.mobile-menu').slideToggle();
  });

});
