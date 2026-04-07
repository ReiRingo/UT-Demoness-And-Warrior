depth = -room_height - 100;

rot_speed = irandom(2)+2;
x = irandom_range(20, room_width - 20);
y = -12;

{
	var _scale   = random(1)+0.2;
	image_xscale = _scale;
	image_yscale = _scale;
	gravity      = _scale-1.2;
}

//colour = c_yellow;
image_alpha       = random_range(0.2, 1);
gravity_direction = edir.DOWN;
gravity           = 0.028;