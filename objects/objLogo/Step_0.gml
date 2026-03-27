if (canProc && inputPressed(KEY_CONFIRM))
{
	canProc = false;
	audio_stop_all();
	sndOnce(sndMenuSwitch);
	
	// Slight pause
	call_later(23, time_source_units_frames, function()
	{
		room_goto(roomMenu);
	});
	
	with(objLogoFragment)
	{
		vspeed = 0;
		speed = 0;
		gravity = 0;
	}
	
	if (time_source_exists(textState)) call_cancel(textState);
	if (time_source_exists(textState2)) call_cancel(textState2);
}