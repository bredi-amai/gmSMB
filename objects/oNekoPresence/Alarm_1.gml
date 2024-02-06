
if room != rmServer
{
	if instance_exists(oClient)
	{
		np_setpresence(where, "playing online as "+global.player, envspr, "");
	}
	else
	{
		np_setpresence(where, "playing as "+global.player, envspr, "");
	}

	
	alarm[1] = room_speed * 10
}