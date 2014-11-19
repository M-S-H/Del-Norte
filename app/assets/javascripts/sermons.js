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
}


function blurimage() {
	canvas = document.getElementById('sermon-canvas');
	context = canvas.getContext('2d');
	image = document.getElementById('s-bg-image');
	context.drawImage(image,0,0, 800, 800);
	stackBlurImage("s-bg-image", "sermon-canvas", 100, 1);
	$('#sermon-bg').css("backgroundImage", "url(" + canvas.toDataURL() + ")");
}


function draw() {
	canvas = document.getElementById('sermon-canvas');
	context = canvas.getContext('2d');
	image = document.getElementById('0');
	context.drawImage(image,0,0, 2000, 300);
}


$(document).ready(function() {
	// Change Sermons
	$('.sermon-listing').click(function() {
		$.ajax({
			url: '/change_sermon',
			data: { id: $(this).attr("id") },
			//contentType: 'application/json; charset=utf-8',
			success: function (response) {
				//alert(response.status);
			},
			error: function () {
				//alert("error");
			}
		}); 
	})
});