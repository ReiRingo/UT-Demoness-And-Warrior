if (!surface_exists(shatter))
{
	show_message("ERROR");
	instance_destroy();
	exit;
}

var func = function()
{
	surface_copy(shatter, 0, 0, application_surface);
	
	var gridSize = 13;			// < Goldilocks! (Only +1 mb of memory!)
	for (var yy = 0; yy < room_height; yy += gridSize)
	{
		for (var xx = 0; xx < room_width; xx += gridSize) // n^2 iteration (mandatory)
		{
			var inst			= instance_create_depth(xx, yy, 0, objLogoFragment);
			inst.width			= gridSize;
			inst.height			= gridSize;
			inst.left			= xx;
			inst.top			= yy;
			inst.shatter		= shatter;		// < Surface
			inst.image_alpha	= alpha;
			inst.ready			= true;
		}
	}
	
	done = true;
}

call_later(2, time_source_units_frames, func);