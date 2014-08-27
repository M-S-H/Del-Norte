$(document).ready(function() {
	// Resize welcome element on load
	var welcome = $('#welcome');
	height = $(window).height() - 100;
	welcome.css('height', height)
})