dir         = 270; // down
move        = { "0": 0, "90": 0, "180": 0, "270": 0 };
move_speed  = 1.5;
temp_sprite = -1;
sprites     = { "0": spr_vara_side, "90": spr_vara_back, "180": spr_vara_side ,"270": spr_vara_front };
has_moved   = false;

reset_spr   = function()
{
	sprites = { "0": spr_vara_side, "90": spr_vara_back, "180": spr_vara_side ,"270": spr_vara_front };
};

dir_lock    = false;

image_speed = 0;

// moveablity
moveable      = true;
moveable_dia  = true;
moveable_menu = true;
moveable_card = true;
moveable_cut  = true;
moveable_warp = true;

// -- i fr thought these two was suppoed to be
// -- used so it checks multiple objects and instances
// -- turns out, I just needed an array
// collision list
//col_list = ds_list_create();
//ds_list_add(col_list, obj_collision, obj_char);
col_list = [obj_collision, obj_char];

// interactable list
//interact_list = ds_list_create();
//ds_list_add(interact_list, obj_interact, obj_char);
interact_list = [obj_interact, obj_char];

int_debug = false;
int_pos1  = vec2_t(0);
int_pos2  = vec2_t(0);