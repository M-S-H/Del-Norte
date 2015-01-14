function kblur() {
	canvas = document.getElementById('koinonia-canvas');
	context = canvas.getContext('2d');
	image = document.getElementById('k-bg-image');
	context.drawImage(image,0,0, 800, 800);
	stackBlurImage("k-bg-image", "koinonia-canvas", 100, 1);
	$('#koinonia-header').css("backgroundImage", "url(" + canvas.toDataURL() + ")");
}