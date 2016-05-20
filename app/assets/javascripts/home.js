$(document).ready(function(){

$('#slide').slideme({
	arrows: true,
	labels : {
		next: '',
		prev: ''
	},
	resizable: {
	width: 800,
	height: 250,
	},
	autoslide : true,
	autoslideHoverStop : true,
	interval : 2000,
	transition : 'fade',
	loop : true,
});

}
);

