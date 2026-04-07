/**********************************
 * MODULE: scr_bgm_system.gml
 * AUTHOR: Rei Taylor
 * Product of Velvet Clover 2026
 **********************************/

/// @returns {Struct.Id.Sound}
function __bgms__()
{
	static bgms = {};
	return bgms;
}

function bgm_play(_id, _snd, _gain = 1.0, _pitch = 1.0, _offset = undefined)
{
	var _b = __bgms__();
	var _current_sound = _b[$ _id] ?? -1;
	
	if (audio_exists(_current_sound)) audio_stop_sound(_current_sound);
	
	_b[$ _id] = audio_play_sound(_snd, 5, true, _gain, _offset, _pitch);
}

function bgm_stop(index)
{
	var _bgms = __bgms__();
	var _s    = _bgms[$ index];
	
	if (audio_exists(_s))
	{
		audio_stop_sound(_s);
		_bgms[$ index] = -1;
	}
}

function bgm_pause(index)
{
	audio_pause_sound(bgm_get(index));
}

function bgm_resume(index)
{
	audio_resume_sound(bgm_get(index));
}

function bgm_get(index)
{
	return __bgms__()[$ index];
}