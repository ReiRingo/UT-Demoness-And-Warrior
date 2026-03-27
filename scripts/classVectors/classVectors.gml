/**
 * BURN_BABY_BURN--VECTOR_CLASSES_FOR_GAMEMAKER
 * 
 * Written by Rei Taylor of Velvet Clover
 * This aims to bring Vector structs in GameMaker.
 * With helper methods.
 */
function Vector2(x, y) constructor
{
	// DATA
	self.x = x;
	self.y = y;
	
	// METHODS
	static copy = function()
	{
		return new Vector2(x, y);
	}
	
	static multiply = function(otherVec)
	{
		x *= otherVec.x;
		y *= otherVec.y;
		return self;
	};
	
	static add = function(otherVec) {
		x += otherVec.x;
		y += otherVec.y;
		return self;
	};
}

/*
function Vector3() constructor {
	// Do we really need this?
}
*/