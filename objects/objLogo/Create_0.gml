draw = true;
text = 0;
canProc = true;

var imageScale = 1.15;
image_xscale = imageScale;
image_yscale = imageScale;

x = room_width / 2;
y = room_height / 2;

// Increment text state
textState2 = -1;
textState = call_later(220, time_source_units_frames, function()
{
	// First increment
	++text;
	
	textState2 = call_later(1000, time_source_units_frames, function()
	{
		// Second increment
		++text;
	});
});

thud = sndOnce(sndIntroThud);