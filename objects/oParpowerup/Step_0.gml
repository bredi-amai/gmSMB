if mario_freeze() != 1
{
	if emerge = true
	{
		if instance_exists(placecol) && place_meeting(x,y,placecol)
		{y -= 0.3;}
		else
		{emerge = false;}
		depth = 399;
	}
	else
	{
		depth = 0;
	
		if instance_place(x,y,oMario)
		{
			pufunc();
		}
	}
}


