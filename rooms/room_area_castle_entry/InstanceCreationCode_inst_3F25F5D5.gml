event = function()
{
	bgm_stop(0);
	audio_play_sound(snd_slam, 1, false);
	
	var _c = cutscene_create();
	
	cutscene_player_moveable(_c, false);
	cutscene_command(_c, function() { with(obj_vara) { reset_spr(); sprite_index = spr_vara_back} });
	cutscene_command(_c, function() { layer_set_visible("Castle", true); });
	cutscene_wait(_c, 100);
	cutscene_command(_c, function() { bgm_play(0, mus_intruder); });
	cutscene_wait(_c, 20);
	
	// guards say this
	cutscene_dialogue(_c, "* /E1INTRUDER!");
	
	cutscene_command(_c, function()
	{
		// so she moves backwards instead
		obj_vara.dir_lock = true;
//		show_debug_message("??? Hello?");
	});
	
	cutscene_move_char(_c, obj_vara, 270, 30, false); // half a second.. and since her move speed
	// is 1.5...
	// idk
	
	// cutscene_move_char(_c, obj_guard, 270, 30, true);
	// todo: make guard
	
	cutscene_wait(_c, 60);
	// ...
	
	// return to state
	cutscene_command(_c, function()
	{
		obj_vara.dir_lock = false;
	});
	cutscene_player_moveable(_c, true);
	cutscene_start(_c);
};