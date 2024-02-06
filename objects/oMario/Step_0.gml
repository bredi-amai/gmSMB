kr = keyboard_check(global.keyr)
kl = keyboard_check(global.keyl)
kd = keyboard_check(global.keyd)
ku = keyboard_check(global.keyu)

kj = keyboard_check(global.keyj)
ka = keyboard_check(global.keya)

kjp = keyboard_check_pressed(global.keyj)
kap = keyboard_check_pressed(global.keya)

kar = keyboard_check_released(global.keya)

kup = keyboard_check_pressed(global.keyu)
kdp = keyboard_check_pressed(global.keyd)


if global.chatfocus = true
{kr=0;kl=0;kd=0;kj=0;ka=0;kjp=0;kar=0;kdp=0;}

if instance_exists(oClient)
{
	if global.username = ""
	{global.username = string(my_id);}
	
	var user = string(global.username)
	
	//Send Our Data
	var buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.move);	
	buffer_write(buff, buffer_u16, my_id);
	buffer_write(buff, buffer_s16, round(x));
	buffer_write(buff, buffer_s16, round(y));
	buffer_write(buff, buffer_f16, image_xscale*scale);					
	buffer_write(buff, buffer_u16, spr);					
	buffer_write(buff, buffer_u16, ind);					
	buffer_write(buff, buffer_string, user);	
	buffer_write(buff, buffer_u8, palindex);	
	buffer_write(buff, buffer_u16, global.palettesprite);		
	buffer_write(buff, buffer_s8, room);
	
	buffer_write(buff, buffer_s8, global.stars);
	network_send_packet(oClient.client, buff, buffer_tell(buff));
	buffer_delete(buff);
}



collidecode = false;



if instance_place(x+hspd,bbox_bottom-1+vspd,oParblock) && shoulderbash > 0
{
	if instance_exists(oParblock)
	{
		var block = instance_place(x+hspd,bbox_bottom-1+vspd,oParblock)
				
		if block && block.blockstate = 0
		{block.blockstate = 1; if powerup != "s" {block.triggerbreak = true;}}
		if block && !place_meeting(x,y,block)
		{sfx(sndBump,1);}
	}
}



if y > room_height+32 && !place_meeting(x,y,oSky_fallwarp)
{state = ps.die;}
if y > room_height+32 && instance_place(x,y,oSky_fallwarp)
{room_goto(instance_place(x,y,oSky_fallwarp).troom)}


if gethit = true
{
	if invincible = 0
	{
		invincible = room_speed*3
		if powerup = "s"
		{state = ps.die;}
		else
		{state = ps.shrink; invincible = room_speed*4;}
	}
	gethit = false;
}

if shoulderbash > 0 && grounded
{shoulderbash --;}
if shoulderbash < 0
{shoulderbash = 0}

if invincible > 0
{invincible --; image_alpha = sign(invincible mod 2);}
if  invincible < 0
{invincible ++;}

if starman > 0
{starman --; invincible = -2}


if jumpbuffer > 0 {jumpbuffer --;}
if kjp {jumpbuffer = 7;}

if firetimer > 0 
{firetimer --;}

if starman > 0
{starman --;}

if round(invincible) = 0
{image_alpha = 1;}


if state = ps.title
{spr = ms("sMario_s_idle"); exit;}

if instance_exists(oRacemanager) && !(oRacemanager.start = 0)
{exit;}

switch(state)
{
	case ps.normal:
		ps_normal();
	break;
	case ps.jump:
		ps_jump();
	break;
	case ps.pivot:
		ps_pivot();
	break;
	case ps.die:
		ps_die();
	break;
	case ps.enterpipedown:
		ps_enterpipedown();
	break;
	case ps.enterpiperight:
		ps_enterpiperight();
	break;
	case ps.exitpipeup:
		ps_exitpipeup();
	break;
	case ps.crouch:
		ps_crouch();
	break;
	case ps.grow:
		ps_grow();
	break;
	case ps.shrink:
		ps_shrink();
	break;
	case ps.flagpoledescend:
		ps_flagpoledescend();
	break;
	case ps.flagpolefinish:
		ps_flagpolefinish();
	break;
	case ps.firetransform:
		ps_firetransform();
	break;
	case ps.castleending:
		ps_castleending();
	break;
	case ps.swim:
		ps_swim();
	break;
	case ps.swimidle:
		ps_swimidle();
	break;
	case ps.shoulderbash:
		ps_shoulderbash();
	break;
	case ps.shoulderbashend:
		ps_shoulderbashend();
	break;
	case ps.climb:
		ps_climb();
	break;
	case ps.emerge:
		ps_emerge();
	break;
	case ps.dance0:
		ps_dance0();
	break;
}


if global.rtxmode = true or global.schutmode = true
{
	if mouse_x > x
	{image_xscale = 1;}
	else
	{image_xscale = -1;}
}





