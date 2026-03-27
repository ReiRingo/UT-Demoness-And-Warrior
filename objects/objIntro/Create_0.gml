// The holy squad of 6-letter names
fading = false;
anmFPS = 2;
ending = sprite_get_number(sprite_index);

// Helper function for fading
dontMangleMeFade = function()
{
	faderFade(0, 1, 119);
	faderSetColour(c_white);
	
	// Wait for 120 frames (2 seconds) before proceeding
	call_later(120, time_source_units_frames,
	function()
	{
		room_goto(roomLogo);
		faderFade(1, 0, 1);
	});
	
	// Turn off fading check
	fading = true;
}