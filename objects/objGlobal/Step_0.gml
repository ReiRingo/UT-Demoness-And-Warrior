if (inputPressed(KEY_FSCREEN)) window_set_fullscreen(!window_get_fullscreen());

// DEBUG
if (DEBUG)
{
	if (keyboard_check_pressed(vk_f2)) game_restart();
}