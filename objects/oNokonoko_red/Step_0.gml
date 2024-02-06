
if mario_freeze()	{image_speed = 0; exit;}

event_inherited();


switch(state)
{
	case es.patrol:
	
	if place_meeting(x+facingdir,y,oCol) && !place_meeting(x+facingdir,y,oSlope)
	{facingdir = -facingdir}
	
	if !place_meeting(x+facingdir*4,y+5,oCol) && grounded
	{facingdir = -facingdir}
	
	if instance_place(x+facingdir,y,oParenemy)
	{instance_place(x+facingdir,y,oParenemy).facingdir = -instance_place(x+facingdir,y,oParenemy).facingdir; facingdir = -facingdir;}
	
	hspd = maxhspd*facingdir
	
	image_speed = imgspd
	sprite_index = sNokonoko_red

	collide();
	
	break;
	case es.shell:
	
		if grounded
		{hspd = 0;}
		
		if shellcooldown <= 0
		{shellcooldown --;}
		
		if shellcooldown < -room_speed*5
		{image_index = sin(current_time/30);}
		else
		{image_index = 0;}
		
		if shellcooldown < -room_speed*6
		{state = es.patrol; shellcooldown = 0;}
		
		
		if instance_place(x,y,oMario) && shellcooldown < 0
		{
			if instance_place(x,y,oMario).x > x		{facingdir = -1;}
			else {facingdir = 1;}
			
			state = es.shellhit;
			sfx(sndKick,0)
			shellcooldown = 5;
		}
		
	
		sprite_index = sNokonoko_red_shell
		
		collide();
	
	break;
	case es.shellhit:
		
		if place_meeting(x+facingdir,y,oCol) && !place_meeting(x+facingdir,y,oSlope)
		{facingdir = -facingdir;}
		
		hspd = 3*facingdir
		
		image_index = 0;
		sprite_index = sNokonoko_red_shell
		
		var m = instance_place(x,y,oMario)
		if m && m.grounded = false && stomptype <= 1 && m.vspd >= 0 && shellcooldown <= 0
		{
			m.vspd = -3;
			points(100,true);
			state = es.shell;
			shellcooldown = 10
		}
		else if m && ((m.vspd <= 0 && m.y >= bbox_bottom-2) or m.grounded) && shellcooldown <= 0
		{
			if (hspd > 0 && m.x > x) or (hspd < 0 && m.x < x)
			{m.gethit = 1;}
		}
	
		collide();
		
	break;
	case es.patrolwinged:
	
		if place_meeting(x,y,oPlatformtriggerlu)
		{g = 1}
		if place_meeting(x,y,oPlatformtriggerrd)
		{g = -1}
	
		image_speed = imgspd
		sprite_index = sNokonoko_winged_red
	
		if instance_exists(oMario) && oMario.x > x
		{facingdir = 1;}
		else
		{facingdir = -1;}
		
		gspd = lerp(gspd,g*1.3,.02);
		y += gspd
	
	break;
	
}


if state = es.die
{sprite_index = sNokonoko_red_shell; image_index = 0;}