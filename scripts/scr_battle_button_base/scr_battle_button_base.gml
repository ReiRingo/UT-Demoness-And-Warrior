// states (bitmasking)
//#macro BTN_NONE    0x00
//#macro BTN_HOVERED 0x01
//#macro BTN_PRESSED 0x02 // do we reall need this?

function button_base_t(index_, x_, y_, sprite_) constructor {
	
	// data
	index        = index_;
	pos          = vec2_t(x_, y_);
	sprite       = sprite_;
	hovered      = false;
	disabled     = false;
	scale        = 2.0;
	
	// methods
	static draw = function() {
		var _subimg = (hovered ? 1 : 0);
		if (disabled) _subimg = 2;
		
		var _pos    = pos;
		draw_sprite_ext(sprite, _subimg, _pos.x, _pos.y, scale, scale, 0, c_white, draw_get_alpha());
	}
	
	// on click is handled by the obj_battle itself (hardcoded, mayhaps?)
	// or use the index as an id?
}