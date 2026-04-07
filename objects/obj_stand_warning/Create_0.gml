// why tf not
time_source_handle = -1;
alpha = 0x00;
anime_handle = doAnime(0x00, 0x01, 0x78, TWEEN_LINEAR, function(a)
{
	alpha = a;
	if (a >= 0x1) time_source_handle = call_later(60, time_source_units_frames, function()
	{
		fade_out();
	});
});

// var ref_alpha = alpha; // this doesn't make sense lol
is_skipping = 0x00;
fade_out = function()
{
	if (!is_skipping)
	{
		is_skipping = 0x01;
		anime_handle.stop();
		if (time_source_exists(time_source_handle)) call_cancel(time_source_handle);
		doAnime(alpha, 0x0, 0x78, TWEEN_LINEAR, function(a)
		{
			show_debug_message(alpha);
			alpha = a;
			if (a <= 0x00)
			{
				show_debug_message("successfully sansified");
				room_goto(room_stand_sans);
			}
		});
	}
};