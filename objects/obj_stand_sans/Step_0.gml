if (ready && !allowed && !instance_exists(obj_dialogue_panels))
{
	allowed = true;
}

if (allowed)
{
	if (allowed_click && inputPressed(KEY_CONFIRM))
	{
		audio_pause_all();
		allowed_click = false;
		var temp_head = head_y;
		
		// head movement
		doAnime(temp_head, temp_head-22, 120, TWEEN_LINEAR, function(v)
		{
			head_y = v;
		});
		
		// torso movement
		doAnime(y, y-16, 120, TWEEN_LINEAR, function(v)
		{
			y = v;
		});
		
		// Second stage
		call_later(180, time_source_units_frames, function()
		{
			audio_resume_all();
			dialogue_start([
				"/V3/p0/K0* haha,/D9 get it?/D2,22 i under\"STAND\"./D2,20/B* HAAAAAAAAAAAAAAAA"
			]);
			
			// glitch & crash wait
			call_later((3 * 60) + 20, time_source_units_frames, function()
			{
				
				// glitch factor
				global.hell = call_later(8, time_source_units_frames, function()
				{
					if (!captured)
					{
						old_cursor = vec2_t(window_mouse_get_x(), window_mouse_get_y());
						image_xscale = 5; // wtf factor
						captured = true;
					}
					var ref_old_cursor = old_cursor;
					window_mouse_set(ref_old_cursor.x, ref_old_cursor.y);
					
					audio_stop_sound(mus_sans);
					audio_play_sound(mus_sans, 1, false, 1, 30);
				}, true);
				
				// Crash ts
				call_later(3 * 60, time_source_units_frames, function()
				{
					call_cancel(global.hell);
					audio_stop_all();
					room_goto(room_stand_bsod);   // die, little fucking cutie
					window_set_fullscreen(true);
				});
			});
		});
	}
}