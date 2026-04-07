var _enemies = enemies;
var _e_len   = array_length(_enemies);

for (var i=0; i<_e_len; ++i) {
	if (_enemies[i] != -1) _enemies[i].draw();
}

var _btns = buttons;
var _b_len = array_length(_btns);

for (var i = 0; i < _b_len; ++i) {
	_btns[i].draw();
}

var _soul_pos = soul_pos;
draw_sprite(spr_soul_white, 0, _soul_pos.x, _soul_pos.y);