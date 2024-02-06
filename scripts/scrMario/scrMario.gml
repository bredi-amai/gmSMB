function ms(spritestring)
{
	var pu = "s"
	
	if object_index = oMario
	{
		var pu = powerup;
		if pu = "f"
		{pu = "b";}
	
		spritestring = string_replace(spritestring,"{}",pu)
	}
	spritestring = string_replace(spritestring,"Mario",global.player);
	
	if global.player = "Anton"
	{return sAnton;}
	if global.player = "Goldron"
	{return sGoldron;}
	if global.player = "Peter Griffin"
	{return sPeterGriffin;}
	
	if sprite_exists(asset_get_index(spritestring))
	{return asset_get_index(spritestring);}
	else
	{return spr;}
}

function do_jump()
{
	if global.environment = e.underwater 
	{
		if kjp && y > 64
		{
			sfx(sndStomp,0);
			vspd = -3; 
			state = ps.swim;
			ind = 0;
			grounded = false;
		}
		if !grounded && (state != ps.swim && state != ps.swimidle)
		{state = ps.swim;}
	}
	else if grounded && (kjp or jumpbuffer > 0)
	{
		jumpbuffer = 0;
		
		if powerup = "s"
		{sfx(sndJump,1);}
		else
		{sfx(sndJumpbig,1);}
		
		spr = ms("sMario_{}_jump");
		ind = 0;
		
		if state = ps.shoulderbash
		{spr = ms("sMario_{}_shoulderbash"); ind = 1;}
		
		vspd = -3 -(abs(hspd)/6);
		state = ps.jump;
		
		grounded = false;
		holdjump = 30;
	}
}

function do_fire()
{
	if firetimer = 0 && kap && powerup = "f" && instance_number(oFireball) <= 2
	{
		instance_create_depth(x,bbox_top+6,depth,oFireball).facing = sign(image_xscale);
		firetimer = 10;
		sfx(sndFireballthrown,1);
	}
}

function ps_normal()
{
	holdjump = -1;
	
	var moveh = kr-kl
	
	if moveh != 0
	{
		var accel = 0.08
		var maxhspd = 1.5
		
		if ka
		{maxhspd = 2.5;}
		
		if global.environment = e.underwater
		{maxhspd = 0.8;}
		
		if abs(hspd) < maxhspd && moveh = 1
		{hspd += accel;}
		else if abs(hspd) < maxhspd && moveh = -1
		{hspd -= accel;}
		if !ka && abs(hspd) > maxhspd
		{hspd -= accel*moveh;}
		
		if sign(hspd) != 0
		{image_xscale = sign(hspd);}
		
		if moveh != image_xscale && abs(hspd) > 0.6 && moveh != 0 && grounded
		{state = ps.pivot; image_xscale = -image_xscale; spr = ms("sMario_{}_pivot");}
		if moveh != sign(hspd) && abs(hspd) <= 0.6 && moveh != 0 && grounded
		{hspd-= accel*sign(hspd);}
	}
	else
	{
		var deccel = 0.2
		if abs(hspd) - deccel <= 0
		{hspd = 0;}
		if abs(hspd) > 0
		{hspd -= deccel*sign(hspd);}
	}

	if hspd != 0 or !grounded
	{spr = ms("sMario_{}_walk"); ind += abs(hspd)/7; if place_meeting(x+sign(hspd),y,oCol) {ind += 0.15;}}
	else
	{spr = ms("sMario_{}_idle"); ind = 0;}
	
	do_fire();
	do_jump();
	
	
	if !grounded
	{state = ps.jump;}
	
	releasedrunmidjump = false
	crouch = false;
	
	collide()
	
	
	if kd && powerup != "s" && firetimer = 0
	{state = ps.crouch;}
	if kup
	{state = ps.dance0;}
	if kdp && instance_place(x,y,oPipeentrance) && grounded && moveh = 0
	{
		state = ps.enterpipedown; pipeinforoom = instance_place(x,y,oPipeentrance).troom; sfx(sndWarp,1);
		if powerup != "s"
		{spr = ms("sMario_{}_crouch");}
	}
	if kr && instance_place(x,y,oPipeentranceright) && instance_place(x+1,y,oCol) && grounded
	{state = ps.enterpiperight; pipeinforoom = instance_place(x,y,oPipeentranceright).troom; instance_place(x,y,oPipeentranceright).activated = true; sfx(sndWarp,1);}
	
	if keyboard_check_pressed(global.keya) && shoulderbash = 0 && global.player = "Wario" && powerup != "f"
	{
		state = ps.shoulderbash;
		vspd = 0; hspd = 0;
		shoulderbash = room_speed*0.5;
		sfx(sndBoom,0);
	}
	if powerup = "f" && firetimer = 5 && global.player = "Wario"
	{
		state = ps.shoulderbash;
		vspd = 0; hspd = 0;
		shoulderbash = room_speed*0.5;
		sfx(sndBoom,0);
	}
}

function ps_jump()
{
	if global.environment = e.underwater 
	{state = ps.swim;}
	
	var moveh = kr-kl

		var accel = 0.05
		var maxhspd = 1.5
		
		if ka && releasedrunmidjump = false
		{maxhspd = 3;}
		
		if moveh = 1 && hspd < maxhspd
		{
			hspd += accel;
			if !ka && hspd > maxhspd
			{hspd -= accel}
		}
		if moveh = -1 && hspd > -maxhspd
		{
			hspd -= accel;
			if !ka && hspd < -maxhspd
			{hspd += accel}
		}
	
	
	if kar && releasedrunmidjump = false
	{releasedrunmidjump = true;}
	
	if grounded
	{
		shoulderbash = -10;
		if kd
		{state = ps.crouch;}
		else
		{state = ps.normal;}
	}
	
	if holdjump >= 0
	{
		holdjump --
		
		vspd -= (holdjump/58)
		
		if !kj
		{holdjump = -1;}
		if vspd > 0
		{holdjump = -1;}
	}
	
	do_fire();
	
	if global.player = "Luigi" {ind += 0.4;}
	if global.player = "Martin" {ind += 0.3;}
	
	collide();
	
	
	if instance_place(x,y,oBeanstalk)
	{x = instance_place(x,y,oBeanstalk).x+8; y -= 1; state = ps.climb;}
}

function ps_pivot()
{
	holdjump = -1;
	
	spr = ms("sMario_{}_pivot");
	
	if global.player = "Martin" {ind += 0.4;}
	
	
	var deccel = 0.12
	if abs(hspd) > 0
	{
		var deccel = 0.15
		if abs(hspd) - deccel <= 0
		{hspd = 0;}
		if abs(hspd) > 0
		{hspd -= deccel*sign(hspd);}
	}
	
	if hspd != 0
	{image_xscale = -sign(hspd);}
	
	if !grounded && vspd > 1
	{state = ps.jump; spr = ms("sMario_{}_walk");}
	if grounded && hspd = 0
	{state = ps.normal;}
		
	do_jump()
	
	collide()
}

function ps_die()
{
	dietimer ++;
	var maxtime = 40;
	
	invincible = -2;
	
	depth = -1000
	
	if dietimer = 1
	{
		bgm("GO",false);
		if global.stars != 0 
		{repeat(global.stars) {instance_create_depth(x,y,depth,oSuperstar).vspd = -10;}}
	}
	
	if dietimer < maxtime
	{hspd = 0; vspd = 0;}
	if dietimer = maxtime
	{vspd = -4.5;}
	if dietimer > maxtime
	{vspd += 0.2;}
	
	spr = ms("sMario_s_die")
	
	if y < room_height+8
	y += vspd
}

function ps_enterpipedown()
{
	depth = 399;
	y += 1;
	
	invincible = -2;
	
	if !place_meeting(x,y,oPipeentrance)
	{room_goto(pipeinforoom);}
}

function ps_enterpiperight()
{
	depth = 399;
	x += 1;
	ind += 0.2;
	
	invincible = -2;
	
	if !place_meeting(x,y,oPipeentranceright)
	{room_goto(pipeinforoom);}
	
	if instance_place(bbox_left,y,oPipeentranceright) && bbox_left >= instance_place(bbox_left,y,oPipeentranceright).bbox_left+16
	{image_alpha = 0;}
}

function ps_exitpipeup()
{
	depth = 399;
	y--;
	
	invincible = -2;
	
	if !place_meeting(x,y,oCol) && !place_meeting(x,y,oPipeexit)
	{state = ps.normal; depth = 0}
}

function ps_crouch()
{
	sprite_index = sMariomask0
	
	do_jump()
	
	if !grounded 
	{state = ps.jump;}
	
	spr = ms("sMario_{}_crouch");
	
	var deccel = 0.05
	if abs(hspd) - deccel <= 0
	{hspd = 0;}
	if abs(hspd) > 0
	{hspd -= deccel*sign(hspd);}
	
	crouch = true
	
	collide();
	
	if !kd or powerup = "s"
	{state = ps.normal;}
}

function ps_grow()
{
	if spr != ms("sMario_s_grow")
	{
		ind = 0;
		sfx(sndPowerup,1);
	}
	invincible = -2;
	
	ind += 0.3;
	
	spr = ms("sMario_s_grow")
	
	if ind >= sprite_get_number(spr)-1
	{state = ps.normal; powerup = "b";}
	
	if global.player = "Goldron" or global.player = "Anton" or global.player = "Peter Griffin"
	{sfx(sndPowerup,1); state = ps.normal; powerup = "b";}
	
}
function ps_firetransform()
{
	if spr != ms("sMario_s_grow")
	{
		ind = 0;
		sfx(sndPowerup,1);
	}
	
	powerup = "f"
	
	invincible = -2;
	
	ind += 0.3;
	
	spr = ms("sMario_s_grow")
	
	if ind >= sprite_get_number(spr)-1
	{
		state = ps.normal; powerup = "f";
		
		if kjp or jumpbuffer > 0
		{
			jumpbuffer = 0;
		
			if powerup = "s"
			{sfx(sndJump,1);}
			else
			{sfx(sndJumpbig,1);}
		
			vspd = -3 -(abs(hspd)/6);
			state = ps.jump;
			spr = ms("sMario_{}_jump");
		
			ind = 0;
		
			holdjump = 30;
		}
	}
	
	if global.player = "Goldron" or global.player = "Anton" or global.player = "Peter Griffin"
	{sfx(sndPowerup,1); state = ps.normal;}
	
}

function ps_shrink()
{
	if spr != ms("sMario_b_shrink")
	{
		ind = 0;
		sfx(sndWarp,1);
	}
	
	ind += 0.3;
	
	spr = ms("sMario_b_shrink");
	
	if ind >= sprite_get_number(spr)-1
	{state = ps.normal; powerup = "s";}
	
	if global.player = "Goldron" or global.player = "Anton" or global.player = "Peter Griffin"
	{sfx(sndWarp,1); state = ps.normal; powerup = "s";}
}

function ps_flagpoledescend()
{
	flagpoletimer ++;
	
	hspd = 0;
	vspd = 0;
	
	spr = ms("sMario_{}_climb");
	
	invincible = -2;
	
	if !place_meeting(x,y+2,oCol)
	{
		if spr = sMario_b_polydance or spr = sMartin_b_climb or spr = sLuigi_b_polydance
		{y -= 1.5; flagpoletimer -= 0.7}
		y += 2;
		ind += 0.25;
	}
	else
	{ind = 0;}

	if flagpoletimer > room_speed * 2 - 20 && flagpoletimer <= room_speed * 2
	{image_xscale = -abs(image_xscale);}
	else
	{image_xscale = abs(image_xscale);}
	
	if flagpoletimer > room_speed * 2
	{
		bgm("Levelend",false)
		
		if global.race = false
		{x += 8; state = ps.flagpolefinish;}
		else
		{state = ps.normal;}
		flagpoletimer = 0;
	}
	
}

function ps_flagpolefinish()
{
	if instance_exists(oFlagpole)
	{
		if hspd < 1.5
		{hspd += 0.05;}
	}
	else
	{
		if hspd < 0.8
		{hspd += 0.05;}
	}
	
	spr = ms("sMario_{}_walk");
	if grounded {ind += 0.25;}
	
	invincible = -2;
	
	if place_meeting(x,y,oCastlemask)
	{image_alpha = 0;}
	
	
	if instance_place(x,y,oPipeentranceright) && instance_place(x+1,y,oCol) && grounded
	{state = ps.enterpiperight; pipeinforoom = instance_place(x,y,oPipeentranceright).troom; instance_place(x,y,oPipeentranceright).activated = true; sfx(sndWarp,1);}
	
	collide();
}

function ps_castleending()
{
	invincible = -2; 
	
	if castleendingtrigger = true
	{
		image_xscale = abs(image_xscale);
		if hspd != 0 && grounded
		{spr = ms("sMario_{}_walk"); ind += abs(hspd)/7; if place_meeting(x+sign(hspd),y,oCol) {ind += 0.15;}}
		else if hspd = 0 && grounded
		{spr = ms("sMario_{}_idle"); ind = 0;}
		
		if !place_meeting(x,y,oToad)
		{hspd = 1.5;}
		else if abs(hspd) > 0
		{if hspd - 0.2 <= 0 {hspd = 0;} else {hspd -= 0.2;}}
		
		
		collide()
	}
	else
	{hspd = abs(hspd); vspd = 0;}
}

function ps_swim()
{
	var moveh = kr-kl
	var accel = 0.08
	var maxhspd = 1.8
		
	if moveh = 1 && hspd < maxhspd
	{
		hspd += accel;
		if !ka && hspd > maxhspd
		{hspd -= accel}
	}
	if moveh = -1 && hspd > -maxhspd
	{
		hspd -= accel;
		if !ka && hspd < -maxhspd
		{hspd += accel}
	}
	
	spr = ms("sMario_{}_swim");
	ind += 0.3;
	
	if ind + 0.2 > sprite_get_number(spr)
	{ind = 0; state = ps.swimidle;}
	
	if moveh != 0
	{image_xscale = moveh;}

	vspd = clamp(vspd,-4,3);
	vspd -= 0.2;
	
	do_jump();
	collide();
}
function ps_swimidle()
{
	var moveh = kr-kl
	var accel = 0.08
	var maxhspd = 1.8
		
	if moveh = 1 && hspd < maxhspd
	{
		hspd += accel;
		if !ka && hspd > maxhspd
		{hspd -= accel}
	}
	if moveh = -1 && hspd > -maxhspd
	{
		hspd -= accel;
		if !ka && hspd < -maxhspd
		{hspd += accel}
	}
	
	if moveh != 0
	{image_xscale = moveh;}
	
	spr = ms("sMario_{}_swim");
	ind += 0.2;
	
	if ind + 0.2 >= 2
	{ind = 0;}
	
	vspd = clamp(vspd,-4,3);
	vspd -= 0.2;
	
	do_jump();
	collide();
	
	if grounded
	{state = ps.normal;}
}

function ps_shoulderbash()
{
	hspd = sign(image_xscale)*3;
	
	if (kl && hspd > 0) or (kr && hspd < 0)
	{if !grounded {hspd = 0;} state = ps.normal; shoulderbash = -10;}
	
	if shoulderbash <= 0
	{shoulderbash = -10; state = ps.normal; if kr-kl = 0 {hspd = 0;}}
	
	if place_meeting(x+hspd,y,oCol)
	{state = ps.shoulderbashend; vspd = -3; hspd = -hspd/2;}
	
	spr = ms("sMario_{}_shoulderbash");
	ind += 0.3;
	
	collide();
	do_jump()
}
function ps_shoulderbashend()
{
	if grounded
	{state = ps.normal; shoulderbash = -10; hspd = 0;}
	
	invincible = -1;
	ind = 1;
		
	collide();
}
function ps_climb()
{
	spr = ms("sMario_{}_climb");
	
	if kjp 
	{state = ps.normal; x -= image_xscale * 8; hspd = 0; vspd = 0;}
	
	if ku && place_meeting(x,y-16,oBeanstalk)
	{y --;}
	if kd && !place_meeting(x,y+1,oCol)
	{y ++;}
	
	if place_meeting(x,y+1,oCol)
	{state = ps.normal; x -= image_xscale * 8; hspd = 0; vspd = 0;}
	
	if ku - kd != 0
	{ind += 0.2;}
	
	if kr
	{image_xscale = -1;}
	if kl
	{image_xscale = 1;}
}

function ps_emerge()
{
	spr = ms("sMario_{}_climb");
	
	if instance_exists(oBeanstalk) && instance_nearest(x,y,oBeanstalk).emerge = true
	{exit;}
	
	if !place_meeting(x,y-1,oPlatformtriggerlu) && !place_meeting(x,y-1,oPlatformtriggerrd)
	{image_xscale = 1; y -= 0.8; ind += 0.14;}
	else
	{
		if hspd < 1
		{hspd += 0.05; ind = 0;}
		if hspd = 1
		{ind += 0.05; image_xscale = -1;}
		if ind >= 1 
		{state = ps.normal; x += 8; spr = ms("sMario_{}_walk"); hspd = 0; image_xscale = 1;}
		
	}
}

function ps_dance0()
{
	var deccel = 0.1
	if abs(hspd) - deccel <= 0
	{hspd = 0;}
	if abs(hspd) > 0
	{hspd -= deccel*sign(hspd);}
	
	
	if (keyboard_check_pressed(global.keyr) - keyboard_check_pressed(global.keyl) )!= 0 or kjp
	{state = ps.normal;}
	if kdp && powerup != "s"
	{state = ps.crouch;}
	
	spr = ms("sMario_{}_dance0");
	if sprite_get_number(spr) > 200
	{ind += 0.5;}
	ind += 0.5;

	
	collide();
}