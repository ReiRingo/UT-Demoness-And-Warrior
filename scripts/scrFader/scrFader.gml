/**
 * Helper functions for objFader object
 * 
 * - faderFade()
 * Used to fade the entire screen.
 * In or out depending on the initial and final release
 * 
 * Okay, I am not writing anymore of the functions here, just read them
 * the fuck here
 */

// GUI DEPTH
// #macro	DEPTH_FADER		-1000
// Refer to .\\Script\\Draw\\scrDepths instead for the DEPTH

// The fader is initilised by the objGlobal object
// Hence forth we grab the instance from it
#macro	CURRENT_FADER	objGlobal.instFader

/**
 * FaderFade
 * This animates the fader's alpha to a set range.
 * (0 - 1) NOT 0 - 100 or 0 - 255
 * @param {real} Initial_Value
 * @param {real} Final_Value
 * @param {real} Frames (When it finishes)
 * @param {constant} Lerp_Type
 * @returns {bool}
 */
function faderFade(initial, final, frames, ltype = TWEEN_LINEAR)
{
	if (!instance_exists(CURRENT_FADER))
	{
		show_debug_message("faderFade : Fader Instance does NOT exist");
		return false;
	}
	
	// Clamp for safety
	final = clamp(final, 0, 1);
	initial = clamp(initial, 0, 1);
	
	// Apply
	with(CURRENT_FADER)
	{
		// Tween animation for the fader
		doAnime(initial, final, frames, ltype, function(a)
		{
			alpha = a;
		});
	}
	
	return true;
}

/**
 * FaderSetDepth
 * This sets the depth of the fader
 * (With the original depth being -1000, GUI-wise)
 * @param {real} New_Depth
 * @returns {undefined}
 */
function faderSetDepth(newDepth)
{
	with(CURRENT_FADER)
	{
		depth = newDepth;
	}
}

/**
 * FaderSetColour
 * This sets the colour property of the
 * fader instance to any specified
 * RGB selections (or the built in c_colour constants)
 * @param {Constant.Colour} Colour
 * @returns {undefined}
 */
function faderSetColour(col)
{
	with(CURRENT_FADER)
	{
		colour = col;
	}
}