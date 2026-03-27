/**
 * [ Helper functions for immediate drawing ]
 * 
 * probably written in camelCase
 * So suck it
 * Bleh
 */
#macro DEFAULT_FONT fntDTM // Mars Needs Cunninglus < Correction: Cunnilingus

function drawReset(defaultFont = DEFAULT_FONT)
{
	gml_pragma("forceinline");
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_set_colour(c_white);
	draw_set_alpha(1);
	draw_set_font(defaultFont);
}

// Profound drawText()
// This handles font size independency
function drawText(x, y, str, target = 18.0, angle = 0)
{
	var fsize = font_get_size(draw_get_font()), finalSize = target > 0 ? target : fsize;
	if (target > 0) finalSize = target / fsize;
	draw_text_transformed(x, y, str, finalSize, finalSize, angle);
}