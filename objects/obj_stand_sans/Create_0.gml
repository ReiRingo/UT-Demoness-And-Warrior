// sitting position
// hopefully, good ol preproc folds this
head_y = y - 38;
legs_y = y + 10;

image_speed = 0;
image_index = 0;

visible = false;

old_cursor = 0;
captured   = false;

ready = false;
allowed = false;
allowed_click = true;

call_later(2 * 60, time_source_units_frames, function()
{
	visible = true;
	
	call_later(60, time_source_units_frames, function()
	{
		// my goofy typer ToT
		dialogue_start([
			"/V3* hey kiddo, wanna see something&  cool?",
			"* just.../D2,35 click z for me."
		]);
		
		ready = true;
		audio_play_sound(mus_sans, 1, 1);
	});
	
	// ding fuckin ding
	snd_once(snd_bell);
});

// timesource holder
global.hell = -1;