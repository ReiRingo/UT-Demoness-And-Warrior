if (draw)
{
	// // // //
	//
	// MENU
	//
	// // // //
	
	if (state == 0)
	{
		var selected = false, col = c_white;
		for (var i = 0; i < menuActLen; ++i)
		{
			selected = (menuHover == i);
			col = selected ? c_yellow : c_white;
			draw_set_colour(col);
			drawText(50 + (i * 30), room_height / 2 + (i * 60), menuActions[i]);
		}
		
		// TODO: STATS
		var __tempStats = ["[Saved Game (0:12:34)]", "Vara", "The Weird Land", "LV 2"];
		
		draw_set_colour(c_grey);
		for (var i = 0; i < 4; ++i)
		{
			drawText(40, 98 + (i * 25), __tempStats[i]);
		}
	}
	
	// // // //
	//
	// SETTINGS
	//
	// // // //
	
	else if (state == 1)
	{
		// TODO: IMPLEMENT ONCE SETTINGS IS ADDED
	}
	
	drawReset();
}
