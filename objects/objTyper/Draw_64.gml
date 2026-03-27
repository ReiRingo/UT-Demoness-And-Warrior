var portraitOffset = 0;
if (textFace > 0)
{
	portraitOffset = 114;
	
	var scale = text_fscale;
	if (!face_blink) draw_sprite_ext(faces[textFace], floor(face_index), x, y, scale, scale, image_angle, image_blend, image_alpha);
}

var len = array_length(glyphs);
for (var i = 0; i < len; ++i)
{
	glyphs[i].draw(x + portraitOffset, y);
}