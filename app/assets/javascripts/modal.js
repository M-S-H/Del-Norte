$(document).ready(function() {
	$('body').on('click', '.modal-close', function() {
		$('.modal').remove();
		$('#screen').remove();
		$('body').css('overflow', 'auto');
	});
});
