/*********************************
 * MODULE: scr_anime_scoped
 * AUTHOR: Rei Taylor, Lasers (Anime System)
 * Product of Velvet Clover
 *********************************/

function __anime_tracker(_op, _val = undefined)
{
	static current_anime = undefined;
	
	switch(_op)
	{
		case "set":
			if (!is_undefined(current_anime)) show_debug_message("Warning: Overwriting anime scope without starting previous instance");
			
			current_anime = _val;
			break;
		
		case "get": 
			return current_anime;
		
		case "clear": 
			current_anime = undefined;
			break;
	}
}

function anime_begin(_initial_val, _callback, _def_loop = false, _def_data = [])
{
	var _inst = new AnimeClass(_initial_val, _def_loop, _callback, _def_data);
	__anime_tracker("set", _inst);
}

function anime_add(_new_val, _duration, _ease = TWEEN_LINEAR)
{
	var _active = __anime_tracker("get"); // ref
	if (!is_undefined(_active))
	{
		_active.add(_new_val, _duration, _ease);
	}
	else
	{
		show_debug_message("-- Anime Error -- :: Failed to add a new target val (anime_add()). [ Call anime_begin() first! ]");
	}
	return _active;
}

function anime_start()
{
	var _active = __anime_tracker("get");
	if (!is_undefined(_active))
	{
		_active.start();
		__anime_tracker("clear");
	}
}