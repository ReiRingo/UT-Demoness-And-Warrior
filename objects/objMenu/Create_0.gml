state = 0;
draw = true;

// // // //
//	STATE 0
//	(Main menu)
// // // //

menuMus         = audio_play_sound(mus_menu, 1, true);
menuHover       = 0;										// New Game
menuActions     = ["New Game", "Continue", "Settings"]; 	// 0, 1, 2
menuActLen      = 3;

// // // //
//	STATE 1
//	(Settings)
// // // //

settingsHover   = 0;
settingsActions = [];									// TODO: Implement settings options
settingsActLen  = 0;