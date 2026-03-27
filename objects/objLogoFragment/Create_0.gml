shatter = -1;

depth = -200;
var centerX = room_width / 2;
var centerY = room_height / 2;
direction 	= point_direction(centerX, centerY, x, y) + random(3);

speed 		= random_range(2, 12);

vspeed 		-= random_range(2, 6);

gravity 	= 0.2;
gravity_direction = 270;
rotateSpeed = random_range(-5, 5);