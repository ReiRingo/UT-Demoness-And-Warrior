var intern_me = content; // this used to be hardcoded.
// and i was worried dear C++ might not intern this

draw_set_colour(c_white);
draw_set_font(fntDTM); // determination mono font (undertale, thank u haley)
draw_text(20, (room_height / 2) - 60, intern_me);
draw_text_transformed(20, 20, ":^", 2, 2, 0);