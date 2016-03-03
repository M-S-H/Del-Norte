// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var canvas;
var context;
var image;


function initblur() {
	$("header").css("backgroundColor", "white");
	canvas = document.getElementById('sermon-canvas');
	context = canvas.getContext('2d');
	image = document.getElementById('s-bg-image');
	context.drawImage(image,0,0, 800, 800);
	stackBlurImage("s-bg-image", "sermon-canvas", 100, 1);
	$('#sermon-bg').css("backgroundImage", "url(" + canvas.toDataURL() + ")");
	$('#sermon-player').css("backgroundImage", "url(" + canvas.toDataURL() + ")");
}


// function blurimage() {
// 	canvas = document.getElementById('sermon-canvas');
// 	context = canvas.getContext('2d');
// 	image = document.getElementById('s-bg-image');
// 	context.drawImage(image,0,0, 800, 800);
// 	stackBlurImage("s-bg-image", "sermon-canvas", 100, 1);
// 	$('#sermon-bg').css("backgroundImage", "url(" + canvas.toDataURL() + ")");
// }


// function draw() {
// 	canvas = document.getElementById('sermon-canvas');
// 	context = canvas.getContext('2d');
// 	image = document.getElementById('0');
// 	context.drawImage(image,0,0, 2000, 300);
// }


$(document).ready(function() {
		// Change Sermons
	$('.audio-listing').click(function() {
		$("html, body").animate({ scrollTop: 0 }, "slow");
		
		$("#sermon-player h3").html($(this).attr('name'));
		$("#audiosource source").attr("src", $(this).attr("audio"));
		$("#s-bg-image").attr("src", $(this).attr("image"));

		if (!player.paused) {
			toggleplayer();
		}

		initblur();
		player.load();
		reset();
	});


	// Change Sermons
	$('.sermon-listing').click(function() {
		$("html, body").animate({ scrollTop: 0 }, "slow");
		$.ajax({
			url: '/change_sermon',
			data: { id: $(this).attr("id") },
			success: function (response) {
				//alert("success");
			},
			error: function () {
				//alert("error");
			}
		}); 
	});
});




$(document).ready(function() {
	$('body').on('click', '#select-sermon', function() {
		$('#sermon_audio').click();
	});

	$('body').on('click', '#select-cover', function() {
		$('#sermon_image').click();
	});

	$('body').on('click', '#s-create', function() {
		if (filelist == 0) {
			alert("hello");
			$('.new_sermon').submit();
		}
		else {
			$('#progress').slideDown('fast');
			$('.new_sermon').fileupload('send', {files: filelist});
		}
	});

	$('body').on('click', '#s-edit', function() {
		if (filelist == 0) {
			$('.edit_sermon').submit();
		}
		else {
			$('#progress').slideDown('fast');
			$('.edit_sermon').fileupload('send', {files: filelist});
		}
	});
});
