// Inherit the parent event
event_inherited();

target_room     = room;
target_landmark = 0;
time_in         = 30;
time_out        = 30;
colour          = c_black;

event = function()
{
	// warp logic here
	faderSetColour(colour);
	obj_vara.moveable_warp = false;
	warp_to(target_room, target_landmark, time_in, time_out);
};