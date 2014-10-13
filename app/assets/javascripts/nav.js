$(document).ready(function() {
	$('#nav-trigger').on('click touchstart', function(e) {
		$('#slideout').toggleClass('is-visible');
		$('#nav-screen').toggleClass('is-visible');
		e.preventDefault();
	});

	$('#nav-screen').on('click touchstart', function(e) {
		$('#slideout').toggleClass('is-visible');
		$('#nav-screen').toggleClass('is-visible');
		e.preventDefault();
	});
});