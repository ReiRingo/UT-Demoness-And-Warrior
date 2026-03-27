// Fade out start is
// Frames - seconds * animationFPS
// I could pre-calculate this.. but it's neglible
if (!fading && floor(image_index) == ending - (2 * 2))
{
	dontMangleMeFade();
}

if (!fading && inputPressed(KEY_CONFIRM))
{
	dontMangleMeFade();
}