function Glyph(_char, _relX, _relY, _colour, _effect, _scale) constructor
{
	char = _char;
	relX = _relX;
	relY = _relY;
	kColour = _colour;
	effect = _effect;
	scale = _scale;
	offsetX = 0;
	offsetY = 0;
	colour = c_white;
	
	switch(kColour)
	{
		case "w":
			colour = c_white;
			break;
		
		case "y":
			colour = c_yellow;
			break;
		
		case "g":
			colour = c_green;
			break;
		
		case "r":
			colour = c_red;
			break;
	}
	
	static step = function(_time)
	{
		switch (effect)
		{
			// Normal
			default:
				offsetX = 0;
				offsetY = 0;
			break;
			
			// Shake
			case 1:
				var off = 2;
				offsetX = random_range(-off, off);
				offsetY = random_range(-off, off);
			break;
			
			// Wave
			case 2:
				offsetY = sin((_time * 0.01) + (relX * 0.05)) * 2;
				offsetX = cos((_time * 0.01) + (relX * 0.05)) * 1.5;
			break;
		}
	}

	static draw = function(_baseX, _baseY)
	{
		draw_text_transformed_colour(_baseX + relX + offsetX, _baseY + relY + offsetY, char, scale, scale, 0, colour, colour, colour, colour, 1);
	}
}