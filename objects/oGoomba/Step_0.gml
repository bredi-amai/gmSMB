
if mario_freeze()	{exit;}

event_inherited();


switch(state)
{
	case es.patrol:
	
	if place_meeting(x+facingdir,y,oCol)
	{facingdir = -facingdir}
	
	if instance_place(x+facingdir,y,oParenemy) && instance_place(x+facingdir,y,oParenemy).state = es.patrol && instance_place(x+facingdir,y,oParenemy).y = y
	{instance_place(x+facingdir,y,oParenemy).facingdir = -instance_place(x+facingdir,y,oParenemy).facingdir; facingdir = -1;}
	
	hspd = maxhspd*facingdir
	
	if sign(sin(current_time/100)) != 0
	{xs = round(sign(sin(current_time/100)));}

	collide();
	
	break;
	case es.stomp:
	
		ind = 1
	
	break;
}





