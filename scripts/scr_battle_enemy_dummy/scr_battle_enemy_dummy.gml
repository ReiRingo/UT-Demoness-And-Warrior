function enemy_dummy_t(x_, y_) : enemy_t(x_, y_) constructor {
	
	//overriden
	static step = function() {
	}
	
	//overriden
	static turn_start = function() {
		show_debug_message("I work");
	}
}