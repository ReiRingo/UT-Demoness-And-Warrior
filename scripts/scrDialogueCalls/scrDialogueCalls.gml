/**
 * SCR_DIALOGUE_CALLS
 * 
 * These are the dialoge functions
 * Used as a helper for the dialogue panel
 * and the typer
 */

// // //
// Macro definitions
// // //

#macro DIALOGUE_AUTO_TOP -1

// // //
// Functions
// // //

function dialogueStartRaw(x, y, textOrArray, inBetween = "/P/B", suffix = "/P/%", defaultSpeed = 3, defaultVoice = 1)
{
	var str = textOrArray; // reference
	if (is_array(str))
	{
		var len = array_length(str);
		
		str = "";
		
		for (var i=0; i<len; ++i)
		{
			str += textOrArray[i];
			if (i < len - 1) str += inBetween;
		}
	}
	
	str += suffix;
	
	var typer = instance_create_depth(x, y, 0, objTyper);
	typer.text = str;
	typer.textSpeed = defaultSpeed;
	typer.textVoice = defaultVoice;
	return typer;
}

// sorry for the sudden camelCase -> snake_case change
// future me.
// i just wanted to stay consistent with gamemaker's
gml_pragma("forceinline"); 
function dialogue_start(content, is_top = DIALOGUE_AUTO_TOP, target = obj_vara, stop_who = obj_vara)
{
	if (is_top == DIALOGUE_AUTO_TOP)
	{
		if (instance_exists(target))
		{
			if (target.y > objCamera.y + (objCamera.size.y * 0.5))
			{
				is_top = true;
			}
			else
				is_top = false;
		}
		else
			is_top = false;
	}
	
	var inst      = instance_create_depth(0, 0, 0, obj_dialogue_panels);
	inst.is_top   = is_top;
	
	var xx        = 50;
	var yy        = is_top ? 50 : display_get_gui_height() - 90;
	var padding   = 20;
	
	with(inst)
	{
		self.inst = dialogueStartRaw(margin + padding, is_top ? margin + padding : bottom_y + padding, content);
		is_ready  = true;
	}
	
	with(stop_who)
	{
		// do not allow dialogue movement
		moveable_dia = false;
	}
	
	return inst;
}