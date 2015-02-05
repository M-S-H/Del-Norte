function kblur() {
	canvas = document.getElementById('koinonia-canvas');
	context = canvas.getContext('2d');
	image = document.getElementById('k-bg-image');
	context.drawImage(image,0,0, 800, 800);
	stackBlurImage("k-bg-image", "koinonia-canvas", 100, 1);
	$('#koinonia-header').css("backgroundImage", "url(" + canvas.toDataURL() + ")");
}


$(document).ready(function() {
	$('body').on('click', '#select-koinonia', function() {
		$('#koinonium_pdf').click();
	});

	$('body').on('click', '#select-cover', function() {
		$('#koinonium_image').click();
	});

	$('body').on('click', '#k-create', function() {
		if (filelist == 0) {
			alert("hello");
			$('.new_koinonium').submit();
		}
		else {
			$('#progress').slideDown('fast');
			$('.new_koinonium').fileupload('send', {files: filelist});
		}
	});

	$('body').on('click', '#k-edit', function() {
		if (filelist == 0) {
			$('.edit_koinonium').submit();
		}
		else {
			$('#progress').slideDown('fast');
			$('.edit_koinonium').fileupload('send', {files: filelist});
		}
	});
});