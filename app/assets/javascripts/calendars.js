// Jqery File Upload

/*
$(function() {
	$('.edit_calendar').fileupload({
		dataType: 'script',

		progressall: function (e, data) {
			var progress = parseInt(data.loaded / data.total * 100, 10);
			$('#progress .bar').css(
				'width',
				progress + '%'
			);
		}
	});
});
*/

$(document).ready(function() {
	$("body").on('click', '#select-calendar', function() {
		$('#calendar_pdf').click();
	});
});