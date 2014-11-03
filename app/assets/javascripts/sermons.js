// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

var canvas;
var context;
var image;


function testblur() {
	$("header").css("backgroundColor", "white");

	//stackBlurImage('0', 'sermon-canvas', 100, 1);
	canvas = document.getElementById('sermon-canvas');
	context = canvas.getContext('2d');
	image = document.getElementById('s-bg-image');
	context.drawImage(image,0,0, 2000, 300);
	//stackBlurCanvasRGBA("sermon-canvas", 0, 0, 2000, 300, 100, 0.4);
	stackBlurImage("s-bg-image", "sermon-canvas", 100, 1);
	$('#main-sermon-bg').css("backgroundImage", "url(" + canvas.toDataURL() + ")");

	//background: url(/assets/welcome-bg.jpg) no-repeat center center;
}


function draw() {
	canvas = document.getElementById('sermon-canvas');
	context = canvas.getContext('2d');
	image = document.getElementById('0');
	context.drawImage(image,0,0, 2000, 300);
}


$(document).ready(function() {

	//testblur();
	/*
	canvas = document.getElementById('sermon-bg');
	context = canvas.getContext('2d');
	image = document.getElementById('0');
	context.drawImage(image,0,0, 2000, 300);
	*/

	//stackBlurImage('0', 'sermon-bg', 100, 1);
});