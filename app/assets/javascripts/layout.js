$(document).ready(function() {
	welcome();

	$('#learn-more').click(function() {
		$("#welcome-msg").ScrollTo();
	})
});


$(window).on("orientationchange", function() {

});


function welcome() {
	// Resize welcome element on load
	var welcome = $('#welcome');
	height = $(window).height();
	if (height > 560)
		welcome.css('height', height);
	else
		welcome.css('height', 560);
	
	$('#contact .container').equalize('innerHeight');
}


