/*if keyboard_check_pressed(ord("Z")) {
	gifRecord = !gifRecord;
	
	if (gifRecord) {
		gif = gif_open(view_width*window_scale,view_height*window_scale)	
	}
	else {
		gif_save(gif, "capture.gif")	
	}
}


if (gifRecord) {
	gif_add_surface(gif, application_surface, 2,0,0,2);	
}