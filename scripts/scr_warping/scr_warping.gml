/*******************
 * MODULE: scr_warping.gml
 * AUTHOR: Rei Taylor
 * Product of Velvet Clover Team 2026
 *******************/

///INSTRUCTION DESCRIPTOR DEFINITION
enum e_warp
{
	GET_ROOM,
	SET_ROOM,
	GET_LANDMARK, // ID
	SET_LANDMARK, // ID
	GET_TIMEOUT,
	SET_TIMEOUT,
	GET_FADE_T,
	SET_FADE_T
};

///GETTER
function __warp_ins__(INSTRUCTION_DESCRIPTOR, SET_VALUE = undefined)
{
	var _i = INSTRUCTION_DESCRIPTOR;
	var _v = SET_VALUE
	
	// data
	static room_target = -1;
	static landmark_id = -1;
//	static old_fader   = -1;
	static timeout     = -1;
	static fade_out_t  = TWEEN_LINEAR;
	
	switch(_i)
	{
		case e_warp.GET_ROOM:
			return room_target;
		
		case e_warp.SET_ROOM:
			room_target = _v;
			break;
	
		case e_warp.GET_LANDMARK:
			return landmark_id;
		
		case e_warp.SET_LANDMARK:
			landmark_id = _v;
			break;
		
		case e_warp.GET_TIMEOUT:
			return timeout;
		
		case e_warp.SET_TIMEOUT:
			timeout = _v;
			break;
		
		case e_warp.GET_FADE_T:
			return fade_out_t;
		
		case e_warp.SET_FADE_T:
			fade_out_t = _v;
			break;
	}
	
	return 0; // success return code
}

/// WARP
function warp_to(_room, _landmark_id, _time = 60, _time_out_fade = 60, _tween = TWEEN_LINEAR, _tween_out = TWEEN_LINEAR)
{
	// set
	__warp_ins__(e_warp.SET_ROOM, _room);
	__warp_ins__(e_warp.SET_LANDMARK, _landmark_id);
	__warp_ins__(e_warp.SET_TIMEOUT, _time_out_fade);
	__warp_ins__(e_warp.SET_FADE_T, _tween_out);
	
	obj_vara.moveable_warp = false;
	doAnime(objFader.alpha, 1.0, _time, _tween, function(a)
	{
		objFader.alpha = a;
	});
	
	call_later(_time, time_source_units_frames, function()
	{
		room_goto(__warp_ins__(e_warp.GET_ROOM));
		
		doAnime(objFader.alpha, 0.0, __warp_ins__(e_warp.GET_TIMEOUT), __warp_ins__(e_warp.GET_FADE_T), function(a)
		{
			objFader.alpha = a;
		});
		
		call_later(1, time_source_units_frames, function()
		{
			var _id = __warp_ins__(e_warp.GET_LANDMARK);
			with(obj_landmark)
			{
				if (landmark_id == _id)
				{
					with(obj_vara)
					{
						self.x = other.x;
						self.y = other.y;
					}
					
					break;
				}
			}
		});
	});
}