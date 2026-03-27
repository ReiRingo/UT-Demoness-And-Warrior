if (ready && surface_exists(shatter)) 
{
	show_debug_message("YES");
	draw_surface_part_ext(shatter, left, top, width, height, x, y, 1, 1, c_white, image_alpha);
}
else if (ready)
{
	draw_set_color(c_white);
	draw_set_alpha(image_alpha);
	draw_rectangle(x, y, x + width, y + height, false);
}

drawReset();