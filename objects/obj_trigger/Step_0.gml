var _collided = place_meeting(x, y, target);

if (has_finished && can_repeat && !_collided)
{
	has_finished = false;
}

if (!has_finished && _collided)
{
	event();
	
	has_finished = true;
	if (!can_repeat)
	{
		instance_destroy();
		exit;
	}
}