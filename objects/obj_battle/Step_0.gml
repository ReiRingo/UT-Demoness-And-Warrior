var _enemies = enemies;
var _len     = array_length(_enemies);

for (var i = 0; i < _len; ++i) {
	if (_enemies[i] != -1) _enemies[i].step();
}

if (state == 0) {
	var _old_c = btn_cursor;
	var _right = inputPressed(KEY_RIGHT);
	var _left  = inputPressed(KEY_LEFT);
	
	if (btn_cursor < 0) btn_cursor = 0;
	
	var _b_len = 2;
	
	if (_right) btn_cursor = (btn_cursor + 1) % _b_len;
	if (_left)  btn_cursor = (btn_cursor-1 < 0) ? _b_len-1 : btn_cursor-1;
		
	var _btns = buttons;
	for (var i=0; i<_b_len; ++i) {
		_btns[i].hovered = (btn_cursor == i);
	}
	
	if (_old_c != btn_cursor) {
		soul_pos.x = _btns[btn_cursor].pos.x + 8;
		sndOnce(sndMenuSwitch);
	}
}