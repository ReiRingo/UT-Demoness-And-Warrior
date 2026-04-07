/*************************************
 * MODULE: scr_cutscene_system.gml
 * AUTHOR: Rei Taylor
 * Product of Velvet Clover 2026
 ************************************/

// immediate mode kind of
function cutscene_create()
{
	gml_pragma("forceinline");
	return new cutscene_t();
}

/// (DANGEROUS)
function cutscene_custom(cut, cmd)
{
	gml_pragma("forceinline");
	cut.push_back(cmd);
}

function cutscene_player_moveable(cut, can_move = true)
{
	cut.push_back({
		arg0: can_move,
		init: function() { obj_vara.moveable_cut = self.arg0 },
		event: function() { return true; }
	});
}

function cutscene_command(cut, func)
{
	gml_pragma("forceinline");
	cut.push_back({
		init: func,
		event: function(){ return true; }
	});
}

function cutscene_wait(cut, frames)
{
	frames = abs(frames);
	cut.push_back({
		frame: frames,
		init: function(){},
		event: function()
		{
			--frame;
			if (frame <= 0)
			{
				return true;
			}
			return false;
		}
	});
}

function cutscene_move_char(_cut, _char, _dir, _move_time, _wait = true)
{
	_cut.push_back({
		_dir_i: _dir,
		_w: _wait,
		_char_o: _char,
		_time: _move_time,
		init: function()
		{
			var _t = _time;
			var _d = _dir_i;
			with(_char_o)
			{
				move[$ _d] = _t;
			}
		},
		event: function()
		{
			if (!_w) return true;
			
			var _ok = false;
			
			with(_char_o)
			{
				_ok = ( move[$ _dir_i] == 0 );
			}
			return _ok;
		}
	});
}

// raw version
function cutscene_dialogue(cut, msg, is_top = DIALOGUE_AUTO_TOP, target = obj_vara, wait = true)
{
	cut.push_back({
		inst: noone,
		message: msg,
		top: is_top,
		targ: target,
		w: wait,
		init: function()
		{
			self.inst = dialogue_start(self.message, self.top, self.targ)
		},
		event: function()
		{
			if (!w) return true;
			return !instance_exists(inst);
		}
	});
}

/// (QUEUE INDEPENDENT)
/// naturally
function cutscene_start(cut)
{
	cut.start();
}

/// (ON QUEUE)
function cutscene_stop(cut)
{
	cut.push_back({
		c: cut,
		init: function()
		{
			c.stop();
		},
		event: function() { return true; }
	});
}

/// (Unecessary)
function delete_cutscene(cut)
{
	delete cut;
}

/// The heart of the cutscene system
function cutscene_t() constructor
{
	queue = [];
//	queue_init = [];
	init_done = false;
	index = 0;
	tsource_id = -1;
	queue_length = 0;
	started = false;
	
	// note:
	// don't static this
	// it'll lose context when called from a timesource
	process = function()
	{
		var _queue      = queue;
//		var _queue_init = queue_init;
		
		if (!init_done)
		{
			init_done = true;
			_queue[index].init();
		}
		
		var _res = _queue[index].event() ?? true;
		if (_res)
		{
			++index;
			init_done = false;
		}
		
		//show_debug_message($"index: {index}, len: {queue_length}");
		
		if (index >= queue_length)
		{
			stop();
			return;
		}
	};
	
	static start = function()
	{
		queue_length = array_length(queue)
//		queue_init   = array_create(queue_length, false);
		init_done    = false;
		
		// frame dependent (like step event)
		tsource_id   = call_later(1, time_source_units_frames, process, true);
		started = true;
	};
	
	static stop = function()
	{
		show_debug_message("ENDED");
		call_cancel(tsource_id);
		tsource_id = -1;
		init_done = false;
	};
	
	static push_back = function(struct)
	{
		if (!started) array_push(queue, struct);
	};
	
	static clear = function()
	{
		if (!started)
		{
			queue = [];
			index = 0;
		}
	};
}