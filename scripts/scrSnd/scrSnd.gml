/**
 * Sound effect functions and helper utilities
 * 
 * All of these are just helper functions,
 * nothing too fancy.
 */
#macro snd_once sndOnce
function sndOnce(snd, doLoop = false)
{
	if (audio_is_playing(snd)) audio_stop_sound(snd);
	return audio_play_sound(snd, 1, doLoop);
}