/**
 * INPUT HELPER FUNCTIONS
 * 
 * Written by Rei Taylor of Velvet Clover
 * This makes multi input binding easier to use
 * Essentially not giving devs headaches.
 * I'll also reduce O(n) iterations here if not needed
 * 
 * (Refer to scrInputInit.gml for the default bind)
 */

// // // //
//
//	KEYS
//
// // // //

#macro 		KEY_UP 			"up"
#macro		KEY_DOWN 		"down"
#macro		KEY_LEFT		"left"
#macro		KEY_RIGHT		"right"

#macro		KEY_FSCREEN		"f11"		// Fullscreen

#macro		KEY_CONFIRM		"conf"
#macro 		KEY_MENU		"escape"	// I'm running out of creative names
#macro		KEY_CANCEL		"sans"		// get it? because sans... sans undertale... sans input-

// // // //
//
//	FUNCTIONS
//
// // // //

function INPUT_GET_LIB()
{
	static lib = {};
	return lib;
}

function inputBind(key, scancodes)
{
	INPUT_GET_LIB()[$ key] = is_array(scancodes) ? scancodes : [scancodes];
}

function INPUT_LOGIC(key, checkFunc)
{
	var inps = INPUT_GET_LIB()[$ key];
	if (is_undefined(inps))
	{
		throw($"INPUT_LOGIC : UNDEFINED KEY {key}");
	}
	
	var len = array_length(inps);
	if (checkFunc(vk_anykey)) for (var i = 0; i < len; ++i)
	{
		if (checkFunc(inps[i])) return true;
	}
	return false;
}

// Awesome hack
function inputHeld(key)			{ return INPUT_LOGIC(key, keyboard_check); }
function inputPressed(key)		{ return INPUT_LOGIC(key, keyboard_check_pressed); }
function inputReleased(key)	{ return INPUT_LOGIC(key, keyboard_check_released); }