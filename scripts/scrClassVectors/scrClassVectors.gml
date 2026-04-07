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
	
	static multiply_real = function(n)
	{
		x *= n;
		y *= n;
		return self;
	};
	
	static add = function(otherVec) {
		x += otherVec.x;
		y += otherVec.y;
		return self;
	};
}

function vec2_t(_x = 0, _y = _x)
{
	gml_pragma("forceinline");
	return new Vector2(_x, _y);
}