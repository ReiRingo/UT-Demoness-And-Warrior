//----------------------------------------------
// basic infos
//----------------------------------------------
enemies = array_create(3, -1);
turn    = 0; // 0-indexed
acts    = array_create(3, -1);
state   = 0;

//----------------------------------------------
// soul
//----------------------------------------------
soul_spr = -1;
soul_pos = vec2_t(0, 60);

//----------------------------------------------
// atk mechanics
//----------------------------------------------
weapon_id = WEAPON_ID;

__reset_weapon_id = function()
{
	weapon_id = WEAPON_ID(); // shortcut for battle_get_weapon_id
};

//----------------------------------------------
// board
//----------------------------------------------
board_width    = display_get_gui_width() - 40;
board_height   = 140;
board_margin   = 20;
board_bottom_y = display_get_gui_height() - board_height - board_margin;

__reset_board  = function() {
	board_width    = display_get_gui_width() - 40;
	board_height   = 140;
	board_margin   = 20;
	board_bottom_y = display_get_gui_height() - board_height - board_margin;
};

//----------------------------------------------
// buttons
//----------------------------------------------
buttons = [
	// attack
	new button_base_t(0, 0, 50, spr_button_atk),
	
	// act
	new button_base_t(1, 0, 50, spr_button_ref)
];

__reset_btn_pos = function() {
	var screen_w = room_width;
	var button_w = 80.0;
	var padding  = 10.0;
	var butt     = buttons;
	var total_b  = array_length(butt);
	
	var total_block_w = (total_b * button_w) + (total_b - 1) * padding;
	
	var start_x  = (screen_w - total_block_w) * 0.5;
	
	for (var i=0; i<total_b; ++i) {
		butt[i].pos.x = start_x + (i * (button_w + padding));
		butt[i].pos.y = 48;
	}
};

__reset_btn_pos();

btn_cursor = -1;