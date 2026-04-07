/**
 * The not so difinitive
 * but ok
 * Toby Fox-styled
 * parser.
 * I also made it less more insufferable than Toby's
 * HELL of a typer system.
 */

/*
Toby's:
global.msg[0]= "/W* This is a white text./"
global.msg[1]= "/Y* This is a yellow text./%%"
global.msg[2]= "* (I won't run because msg1 forced&  an ending./%%)"

Mine:
dialogue_start([ "* It just works.", "* it just will." ]);
*/

text = "/Cr/E1/F1* THIS IS A PLACEHOLDER TEXT!/P/%";
textRawCount = 0;
textDelay    = 0;
textColour   = "w"; // c_white
textSpeed    = 2;
textEffect   = 0;
textFace     = 0;
text_fscale  = 1.5; // text face scale
textScale    = 1;
textVoice    = 1;
textX        = 0;
textY        = 0;
textH        = 2;
textV        = 2;

// Glyhs
glyphs       = [];

// Some stuff
internalCounter = 0;
isPaused     = false;
isSkipping   = false;
isFinished   = false;

// some even more other stuff
can_skip     = true;
can_unpause  = true;

voices = [];              // voices init
event_user(0);            // voices reg

faces = [];               // faces init
event_user(1);            // faces reg

face_index   = 0.0;         // ...
face_num     = 2;           // lets hardcode 2 for now
face_speed   = 0.25;
face_blink   = false;
face_bl      = 0;

createGlyph = function(char)
{
	var g = new Glyph(char, textX, textY, textColour, textEffect, textScale);
	array_push(glyphs, g);
	textX += (string_width(char) * textScale) + textH;
//	textRawCount++;
};

clear_glyphs = function()
{
	var len = array_length(glyphs);
	for (var i=0; i<len; ++i)
	{
		delete glyphs[i];
	}
};

depth = DEPTH_GUI_DIALOGUE;