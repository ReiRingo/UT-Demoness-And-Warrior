/*******************************************
 * MODULE: scrTweenClass
 * AUTHOR: Lasers / Futuregamer
 * Product of Lasers?
 *******************************************/

/**
 * Creates a new instance of AnimeClass.
 * @param {Real} startVal The initial value to start the animation from.
 * @return {Struct.AnimeClass}
 */

#macro anime_create createAnime
function createAnime(startVal)
{
	return new AnimeClass(startVal);
}

/**
 * Quick-start a single-step animation.
 * @param {Real} val1 Starting value.
 * @param {Real} val2 Target value.
 * @param {Real} frames Duration in frames.
 * @param {Any} easeType The easing (String, Method, or Animation Curve).
 * @param {Function} callMethod The callback function for each frame.
 * @return {Struct.AnimeClass}
 */

#macro do_anime doAnime
function doAnime(val1, val2, frames, easeType, callMethod)
{
	return createAnime(val1).add(val2, frames, easeType).start(callMethod);
}

/**
 * A class for managing sequenced animations with multiple easing types.
 * @param {Real} defVal Initial starting value.
 * @param {Bool} [defLoop]=false Whether the animation should loop.
 * @param {Function} [defFunc]=undefined Default callback function.
 * @param {Array} [defData]=[] Initial animation data.
 */
function AnimeClass(defVal, defLoop = false, defFunc = undefined, defData = []) constructor
{
	static add = function(val, frames, easeType = "linear")
	{
		if (frames < 1) 
		{
			return self;
		}
		
		var mode = 0;
		if (is_string(easeType))
		{
			mode = 0;
		}
		else if (is_callable(easeType))
		{
			mode = 1;
			if (!is_method(easeType)) 
			{
				easeType = method(other, easeType);
			}
		}
		else if (is_handle(easeType) || is_struct(easeType))
		{
			mode = 2;
			var channel = getChannel(easeType);
			if (channel != undefined) 
			{
				easeType = channel;
			}
		}
		
		array_push(data, { val: val, frames: frames, ease: easeType, mode: mode });
		return self;
	}
	
	static loop = function(doLoop = true)
	{
		self.doLoop = doLoop;
		return self;
	}
	
	static setMethod = function(callMethod)
	{
		func = callMethod;
		return self;
	}
	
	static start = function(callMethod = func)
	{
		func = callMethod;
		if (!is_method(func)) 
		{
			return self;
		}
		
		if (array_length(data) == 0) 
		{
			return self;
		}
		
		if (index == -1)
		{
			x2 = xStart;
			nextData();
		}

		if (timeSource == -1)
		{
			timeSource = call_later(1, time_source_units_frames, callback, true);
		}
		return self;
	}

	static clone = function()
	{
		var newData = variable_clone(data);
		return new AnimeClass(xStart, doLoop, func, newData);
	}
	
	callback = function()
	{
		++frame;
		var val = frame / maxFrames;
		var amount;

		if (mode == 0)
		{
			amount = lerpType(x1, x2, val, ease);
		}
		else if (mode == 1)
		{
			amount = (x2 - x1) * ease(val) + x1;
		}
		else
		{
			amount = (x2 - x1) * animcurve_channel_evaluate(ease, val) + x1;
		}
		
		if (is_method(func)) 
		{
			func(amount);
		}

		if (val >= 1 && !nextData()) 
		{
			stop();
		}
	}

	static nextData = function()
	{
		++index;
		if (index >= array_length(data))
		{
			if (doLoop)
			{
				index = 0;
				x2 = xStart;
			}
			else
			{
				return false;
			}
		}

		var dat = data[index];
		x1 = x2; 
		x2 = dat.val;
		frame = 0;
		maxFrames = dat.frames;
		ease = dat.ease;
		mode = dat.mode;
		return true;
	}

	static stop = function()
	{
		if (timeSource != -1) 
		{ 
			call_cancel(timeSource); 
			timeSource = -1; 
		}
		index = -1;
		return self;
	}

	static getChannel = function(curve)
	{
		var struct = is_handle(curve) ? animcurve_get(curve) : curve;
		if (struct == undefined || array_length(struct.channels) <= 0) 
		{
			return undefined;
		}
		return animcurve_get_channel(struct, 0);
	}

	xStart = defVal;
	doLoop = defLoop;
	func = defFunc;
	data = defData;
	timeSource = -1;
	index = -1;
	x1 = defVal;
	x2 = defVal;
	frame = 0;
	maxFrames = 1;
	ease = undefined;
	mode = undefined;
}