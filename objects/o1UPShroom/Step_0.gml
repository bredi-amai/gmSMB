event_inherited()

if mario_freeze() != 1
{
	if emerge = false
	{
		hspd = 0.8*face;
	
		if place_meeting(x+face,y,oCol)
		{face = -face;}
	
		collide();
	
		if !grounded
		{vspd -= 0.2;}
	}
}

