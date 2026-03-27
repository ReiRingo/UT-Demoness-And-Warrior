text = "/Cr/E1THIS IS A PLACEHOLDER TEXT!/P/%";
textRawCount = 0;
textDelay    = 0;
textColour   = "w"; // c_white
textSpeed    = 3;
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

depth = DEPTH_GUI_DIALOGUE;