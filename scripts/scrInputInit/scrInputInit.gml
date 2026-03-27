/**
 * Initialisation of the inputs so we can actually
 * start moving!
 * 
 * Call in objGlobal game start
 */
function inputInit()
{
	// // // //
	//
	// Basic ahh keys
	//
	// // // //
	
	// CONFIRM KEY
	inputBind(KEY_CONFIRM, [
		vk_enter, ord("Z")
	]);
	
	// CANCEL KEY
	inputBind(KEY_CANCEL, [
		vk_shift, ord("X")
	]);
	
	// // // //
	//
	// ARROW KEYS
	//
	// // // //
	
	// RIGHT KEY
	inputBind(KEY_RIGHT, [
		vk_right
	]);
	
	// UP KEY
	inputBind(KEY_UP, [
		vk_up
	]);
	
	// LEFT KEY
	inputBind(KEY_LEFT, [
		vk_left
	]);
	
	// DOWN KEY
	inputBind(KEY_DOWN, [
		vk_down
	]);
	
	// // // //
	//
	// MISC KEYS
	//
	// // // //
	
	inputBind(KEY_FSCREEN, [ vk_f11, vk_f4 ]);		// I just realised you can use non-array stuff, FUCK
}