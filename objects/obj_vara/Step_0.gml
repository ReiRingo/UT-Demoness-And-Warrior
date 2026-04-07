var _x = x, _y = y; // previous x & y

var _old_dir = dir;

var targ_x = 0;
var targ_y = 0;

var ref_move = move;
for (var i=0; i<360; i+=90)
{
	if (ref_move[$ i] > 0)
	{
		// debug
//		show_debug_message($"{i} :: {ref_move[$ i]}");
		
		// decrement
		ref_move[$ i]--;
		
		// movement
		if      (i == 0)   targ_x += move_speed;
		else if (i == 90)  targ_y -= move_speed;
		else if (i == 180) targ_x -= move_speed;
		else if (i == 270) targ_y += move_speed;
		
		// dir assign
		if (!dir_lock)
		{
//			show_debug_message($"Did it with {dir} and {dir_lock}");
			dir = i;
		}
	}
}

// input handling
var left  = inputHeld(KEY_LEFT);
var right = inputHeld(KEY_RIGHT);
var up    = inputHeld(KEY_UP);
var down  = inputHeld(KEY_DOWN);

var can_move =
(
	moveable      &&
	moveable_dia  &&
	moveable_menu &&
	moveable_card &&
	moveable_cut  &&
	moveable_warp
);

if (can_move)
{
	// key -> movement
	if (left)
	{
		move[$ 180]++;
	}
	else
	if (right)
	{
		move[$   0]++;
	}
	
	if (down)
	{
		move[$ 270]++;
	}
	else
	if (up)
	{
		move[$ 90]++;
	}
}

// silly moveable thing
if (!moveable_dia)
	if (!instance_exists(obj_dialogue_panels))
		moveable_dia = true;

// collision handling
var _ref_col = col_list;
var _slope_max = 4;

// if you fight back, it'll jitter.
// just like tobys lol
var _col_h = instance_place(x + targ_x, y, _ref_col);
if (_col_h != noone && _col_h.collidable)
{
	var _can_slope = false;
	
	for (var i=1; i<=_slope_max; ++i)
	{
		if (!place_meeting(x + targ_x, y - i, _ref_col))
		{
			y -= i;
			_can_slope = true;
			break;
		}
	}
	
	if (!_can_slope)
	{
		for (var i=1; i<=_slope_max; ++i)
		{
			if (!place_meeting(x + targ_x, y + i, _ref_col))
			{
				y += i;
				_can_slope = true;
				break;
			}
		}
	}

	if (!_can_slope)
	{
		while (!place_meeting(x + sign(targ_x), y, _ref_col))
		{
			x += sign(targ_x);
		}
		targ_x = 0;
	}
}
x += targ_x;

var _col_v = instance_place(x, y + targ_y, _ref_col);
if (_col_v != noone && _col_v.collidable)
{
	var _can_slide = false;
	for (var i=1; i<=_slope_max; ++i)
	{
		if (!place_meeting(x - i, y + targ_y, _ref_col))
		{
			x -= i;
			_can_slide = true;
			break;
		}
		else if (!place_meeting(x + i, y + targ_y, _ref_col))
		{
			x += i;
			_can_slide = true;
			break;
		}
	}

	if (!_can_slide)
	{
		while (!place_meeting(x, y + sign(targ_y), _ref_col))
		{
			y += sign(targ_y);
		}
		targ_y = 0;
	}
}
y += targ_y;

// interacting
if (inputPressed(KEY_CONFIRM) && can_move)
{
	var _check_dist = 20;
	var _x1, _y1, _x2, _y2;
	
	switch(dir) 
	{
 		case 0:   // right
			_x1 = bbox_right + 1;
			_y1 = bbox_top;
			_x2 = bbox_right + _check_dist;
			_y2 = bbox_bottom;
		break;
	
		case 90:  // up
			_x1 = bbox_left;
			_y1 = bbox_top - _check_dist;
			_x2 = bbox_right;
			_y2 = bbox_top - 1;
		break;
	
		case 180: // left
			_x1 = bbox_left - _check_dist;
			_y1 = bbox_top;
			_x2 = bbox_left - 1;
			_y2 = bbox_bottom;
		break;
	
		case 270: // down
			_x1 = bbox_left;
			_y1 = bbox_bottom + 1;
			_x2 = bbox_right;
			_y2 = bbox_bottom + _check_dist;
		break;
	}
	
	if (int_debug)
	{
		var _debug_pos1 = int_pos1;
		var _debug_pos2 = int_pos2;
		
		_debug_pos1.x = _x1;
		_debug_pos1.y = _y1;
		_debug_pos2.x = _x2;
		_debug_pos2.y = _y2;
	}
	
	var _inst = collision_rectangle(_x1, _y1, _x2, _y2, interact_list, false, true);
	
	if (_inst != noone)
	{
		// trigger
        with(_inst) 
        {
			i_event(); // interact event
		}
	}
}

// animation
if (_old_dir != dir)
{
	var ref_sprites = sprites;
	if (sprite_exists(ref_sprites[$ dir])) sprite_index = ref_sprites[$ dir];
}


var is_moving = (x + targ_x != _x || y + targ_y != _y);
if (is_moving)
{
	
	image_speed     = 1;
	
	if (dir == 180)
	{
		image_xscale = -abs(image_xscale);
	}
	else
	{
		image_xscale = abs(image_xscale);
	}
	
	if (!has_moved)
	{
		has_moved   = true;
		image_index = 1;
	}
}
else
{
	image_index = 0;
	image_speed = 0;
	has_moved   = false;
}