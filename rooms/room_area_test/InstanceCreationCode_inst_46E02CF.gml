/*
var _c = new cutscene_t();
cutscene_player_moveable(_c, false);
_c.push_back({
	frames: 120,
	init: function() {},
	event: function()
	{
		frames--;
		if (frames <= 0) return true;
		return false;
	}
});
cutscene_dialogue(_c, "* example one be like")
cutscene_player_moveable(_c, true);
_c.start();
*/