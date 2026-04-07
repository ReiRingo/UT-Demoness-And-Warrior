draw_self(); // index 0 = torso

var ref_spr = sprite_index; // cache
draw_sprite_ext(ref_spr, 2, x, legs_y, image_xscale, image_yscale, 0, c_white, 1);
draw_sprite_ext(ref_spr, 1, x, head_y, image_xscale, image_yscale, 0, c_white, 1);