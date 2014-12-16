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
	welcome.css('height', height);

	//alert(height);

	/*
	// Center Welcome content
	var content = $('#welcome-content');
	content_height = content.height();
	//alert(content_height);
	diff = height - content_height;
	//alert(diff);
	content.css("padding-top", diff/2);
	*/
	//$('#contact .container').equalize({children: 'p'});
	$('#contact .container').equalize('innerHeight');
}