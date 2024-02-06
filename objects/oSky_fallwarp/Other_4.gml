

if instance_exists(oMario) && instance_exists(oSkyexit) && room = troom
{
	oMario.x = oSkyexit.x;
	oMario.y = oSkyexit.y;
	oMario.image_xscale = 1;
	oMario.vspd = -0.5
}


if room != bornroom
{
	instance_destroy();
}