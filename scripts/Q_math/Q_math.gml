/**
 * Q_math header script
 * 
 * THIS SNIPPET OF LOGIC BELONGS TO ID SOFTWARE!
 * 
 * 
 * None of these logic are mine.
 * 
 * (Also a bit of a comedy gag... If you don't understand this joke, are you okay?)
 */
#macro F /**/
#macro float var
#macro const /**/
#macro long var 
#macro Float function
#macro deref(x) x
#macro static_cast(x) /**/
#macro long_ptr 0
#macro float_ptr 1
#macro to_ptr(x) x
Float Q_sqrt( number )
{
	long i;
	float x2, _y;										// y is already used
	
	const float threehalfs = 1.5F;
	
	x2 = number * 0.5F;
	_y = number;
	i  = deref( static_cast( long_ptr ) ) to_ptr(_y);	// evil floating point bit level hacking
	i  = 0x5f3759df - ( i >> 1 );						// what the fuck?
	_y = deref( static_cast( float_ptr ) ) to_ptr(i);
	
	_y  = _y * ( threehalfs - ( x2 * _y * _y ) );  		// 1st iteration
//	_y  = _y * ( threehalfs - ( x2 * _y * _y ) );  		// 2nd iteration, this can be removed
	
	return _y;
}

Float Q_rsqrt2( number )
{
	return 1 / sqrt( number );							// Joyous
}