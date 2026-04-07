// WIDTH and HEIGHT definition in scrInit
size = vec2_t(WIDTH, HEIGHT);
view = size.copy();

target_cam = 0;

resetCam = function(tcam = target_cam)
{
	view_enabled[tcam]	= true;
	view_visible[tcam]	= true;
	view_xport[tcam]	= 0;
	view_yport[tcam] 	= 0;
	view_wport[tcam] 	= view.x;
	view_hport[tcam] 	= view.y;
	
	camera_set_view_size(view_camera[tcam], size.x, size.y);
	surface_resize(application_surface, view.x, view.y);
	window_set_size(view.x, view.y);
}

resetCam();

target       = noone;
room_bound   = true;
shake        = 0;
shake_int    = 23;