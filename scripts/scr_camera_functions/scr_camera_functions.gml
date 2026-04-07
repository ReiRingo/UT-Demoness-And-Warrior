/********************************
 * MODULE: scr_camera_functions.gml
 * AUTHOR: Rei Taylor
 * Product of Velvet Clover
 ********************************/

// macro definitions here
#macro WIDTH 640
#macro HEIGHT 480

// function definitions here
function cam_half()
{
	with(objGlobal.instCam)
	{
		size.multiply_real(0.5);
		resetCam();
	}
}

function cam_set_target(_target)
{
	if (!instance_exists(_target))
	{ throw("cam_set_target :: _target does not exist!"); }
	
	with(objGlobal.instCam)
	{
		target = _target;
	}
}