switch(SPRINGST)
{
	case 0:
	
	wait = 0;
	if place_meeting(x,y-4,oMario) && round(ind) = 0
	{
		oMario.grounded = false;
		ind = 1;
	}
	else if place_meeting(x,y-4,oMario) && round(ind) = 1
	{
		oMario.grounded = false;
		ind = 2;
	}
	else if place_meeting(x,y-4,oMario) && round(ind) = 2
	{
		SPRINGST = 1;
		ind = 2;
	}
	
	if !place_meeting(x,y-4,oMario) && ind > 0
	{ind -= 0.2;}
	break;
	case 1:
	
	ind = 2;
	wait ++;
	
	if wait >= 5 && instance_exists(oMario) && place_meeting(x,y-4,oMario) 
	{
		if oMario.kj
		{oMario.vspd = -12;}
		else
		{oMario.vspd = -5;}
		
		SPRINGST = 2;
	}
	if instance_exists(oMario) && place_meeting(x,y-4,oMario) 
	{oMario.grounded = false;}
	
	if !place_meeting(x,y-4,oMario) or wait >= 6
	{SPRINGST = 0; ind = 0;}
	
	break
	case 2:
	
	ind -= 0.2;
	
	if ind = 0
	{SPRINGST = 0; ind = 0;}
	if place_meeting(x,y,oMario)
	{SPRINGST = 0; oMario.grounded = false; ind = 0;}
	else 
	{wait --;}
	
	
	break;
	
	
}

image_index = round(ind);

