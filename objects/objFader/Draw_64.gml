if (alpha > 0.1)
{
	draw_set_colour(colour);
	draw_set_alpha(alpha);
	draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
	drawReset();
}