var xx = x, yy = y;

with(target)
{
	xx = x - (other.size.x * 0.5);
	yy = y - (other.size.y * 0.5);
}

if (room_bound)
{
	xx = clamp(xx, 0, room_width  - size.x);
	yy = clamp(yy, 0, room_height - size.y);
}

x = xx;
y = yy;

if (shake > 0)
{
	shake--;
	xx += random_range(-shake_int, shake_int);
	yy += random_range(-shake_int, shake_int);
}

camera_set_view_pos(view_camera[target_cam], xx, yy);