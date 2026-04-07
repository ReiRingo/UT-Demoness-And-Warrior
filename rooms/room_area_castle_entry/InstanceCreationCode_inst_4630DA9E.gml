var _sprites = [spr_vara_dark_side, spr_vara_dark_back, spr_vara_dark_side, spr_vara_dark_front];

temp_sprite = sprites;

for (var i=0; i<4; ++i)
{
	var _ind = i*90;
	sprites[$ _ind] = _sprites[i];
}
sprite_index = _sprites[3];