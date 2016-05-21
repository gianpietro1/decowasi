$(document).ready(function(){

$('#slide').slideme({
	arrows: false,
	labels : {
		next: '',
		prev: ''
	},
	resizable: {
	width: 1266,
	height: 650,
	},
	autoslide : true,
	autoslideHoverStop : false,
	interval : 5000,
	transition : 'fade',
	speed: 1500,
	loop : true,
});

$('.slider_text').fadeIn(2000);

}
);

