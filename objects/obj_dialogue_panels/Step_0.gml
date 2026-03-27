if (is_ready)
{
	var typer = inst; // cache
	if (!instance_exists(typer))
	{
		instance_destroy();
		exit;
	}
	
	depth = typer.depth + 1;
}