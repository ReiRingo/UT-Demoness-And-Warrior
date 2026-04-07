function enemy_t(x_, y_, spr_=-1, max_hp_=20, current_hp_ = max_hp_) constructor
{
	
	// methods
	static copy = function()
	{
		var _pos = pos;
		var _inst = new enemy_t(_pos.x, _pos.y, sprite, hp_max, hp);
		return _inst;
	}
	
	static kill = function()
	{
		//todo: dust particle
		return self;
	}
	
	static create = function() {
		// change me
	}
	
	static step = function()
	{
		//todo: step event here
		//ie. make the head bob with sin
	}
	
	static draw = function()
	{
		battle_enemy_draw();
	}
	
	static on_act = function(act_index)
	{
		if (act_index == 0)
		{
			dialogue_start($"* {name} - {hp} HP\n  I'm a dummy enemy.")
		}
	}
	
	static turn_step = function() {
		// change me
	}
	
	static turn_start = function() {
		// change me 
	}
	
	// variables
	name   = "Dummy Enemy";
	sprite = spr_;
	frame  = 0.0;
	hp_max = max_hp_;
	hp     = current_hp_;
//	reg    = array_create(80); // I forgot what this was for
	pos    = vec2_t(x_, y_);
	acts   = ["Check"];
	
	//todo: frames here
}

function battle_enemy_draw(p = self) {
	gml_pragma( "forceinline" );
	var _ref_pos = p.pos;
	var _spr     = p.sprite;
	var _frame   = p.sprite;
	draw_sprite(_spr, _frame, _ref_pos.x, _ref_pos.y);
}