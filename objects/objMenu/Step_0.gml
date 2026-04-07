// Init controls
var up, down, left, right;
var confirm, cancel;

// Arrow Keys
up 		= inputPressed(KEY_UP);
down 	= inputPressed(KEY_DOWN);
left 	= inputPressed(KEY_LEFT);
right 	= inputPressed(KEY_RIGHT);

// Z & X keys
confirm = inputPressed(KEY_CONFIRM);
cancel 	= inputPressed(KEY_CANCEL);

// // // //
//
// CONFIRM & CANCEL
//
// // // //

if (confirm)
{
	if (state == 0)
	{
		switch(menuHover)
		{
			// New Game
			case 0:
				// TODO: IMPLEMENT NEW GAME
				room_goto(room_area_test);
				audio_stop_sound(menuMus);
				break;
			
			// Continue Game
			case 1:
				// TODO: IMPLEMENT CONTINUE GAME
				break;
			
			// Settings
			case 2:
				// TODO: IMPLEMENT SETTINGS
				sndOnce(sndMenuSwitch);
				state = 1;
				break;
		}
	}
	else if (state == 1)
	{
		// TODO: IMPLEMENT SETTINGS
	}
}
else if (cancel)
{
	if (state == 1)
	{
		state = 0;
		sndOnce(sndMenuSwitch);
		// TODO: Save settings
	}
}

// // // //
//
// HOVER MOVE
//
// // // //

if (state == 0) // Main Menu
{
	var oldHover = menuHover;		// < Store old menu state
	if (down || right)	menuHover = (menuHover + 1) % menuActLen;
	if (up || left)		menuHover = (menuHover <= 0) ? menuActLen - 1 : --menuHover;
	if (menuHover != oldHover) sndOnce(sndMenuSwitch);
}
else if (state == 1)
{
	// Settings ahh
}