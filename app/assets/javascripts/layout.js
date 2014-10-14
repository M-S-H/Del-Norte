$(document).ready(function() {
	welcome();
});

$(window).on("orientationchange", function() {
	welcome();
});


function welcome() {
	// Resize welcome element on load
	var welcome = $('#welcome');
	height = $(window).height();
	welcome.css('height', height)


	// Center Welcome content
	var content = $('#welcome-content');
	content_height = content.height();
	diff = height - content_height;
	content.css("padding-top", diff/2 - content_height/2);
}