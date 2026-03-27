// Room Start
call_later(1, time_source_units_frames, function()
{
	room_goto(roomIntro);
});

// Instances
instCam = instance_create_depth(0, 0, 0, objCamera);
instFader = instance_create_depth(0, 0, 0, objFader);

// Inits
inputInit();