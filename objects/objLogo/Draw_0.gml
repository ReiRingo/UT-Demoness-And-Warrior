if (draw)
{
	draw_self();
	
	// The start text
	draw_set_halign(fa_centre);
	draw_set_valign(fa_bottom);
	
	var textx, texty;
	textx = room_width / 2;
	texty = room_height - 30;
	
	draw_set_colour(c_dkgrey);
	draw_set_font(fntMNC);
	var textSize = 14;
	if (text == 1)
	{
		drawText(textx, texty, "Press [Z] to start!", textSize);
	}
	else if (text == 2)
	{
		drawText(textx, texty, "What are you waiting for?\nDummy!", textSize);
	}
	
	drawReset();
}