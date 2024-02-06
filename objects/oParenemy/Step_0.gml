event_inherited()

//nes_flicker()

if instance_place(x,y,oMario) && instance_place(x,y,oMario).starman > 0 && state != es.die && state != es.stomp
{vspd = -2; state = es.die; dieface = (instance_place(x,y,oMario).x < x? 1 : -1); sfx(sndKick,0);}

if instance_place(x,y,oMario) && instance_place(x,y,oMario).shoulderbash > 0 && state != es.die && state != es.stomp
{vspd = -2; state = es.die; dieface = (instance_place(x,y,oMario).x < x? 1 : -1); sfx(sndKick,0); oMario.shoulderbash = room_speed*0.5}



if state = es.patrol
{
	var m = instance_place(x,y,oMario)
	if m && m.y >= bbox_bottom-2 && (m.vspd <= 0 or m.grounded)
	{
		m.gethit = 1;
	}
	if m && m.y < bbox_bottom-2 && m.grounded = false && stomptype <= 1 && m.vspd > 0
	{
		points(100,true);
		sfx(sndStomp,0)
		if stomptype = 0
		{state = es.stomp; m.vspd = -3; m.holdjump = 0; BLAST()}
		else if stomptype = 1
		{
			state = es.shell;
			m.vspd = -3; m.holdjump = 0; BLAST(); vspd = 0; hspd = 0;
			shellcooldown = 10
		}
	}
}

if state = es.patrolwinged
{
	var m = instance_place(x,y,oMario)
	if m && m.y >= bbox_bottom-2 && (m.vspd <= 0 or m.grounded)
	{
		m.gethit = 1;
	}
	if m && m.y < bbox_bottom-2 && m.grounded = false && stomptype <= 1 && m.vspd > 0
	{
		points(100,true);
		sfx(sndStomp,0)
		if stomptype = 1
		{
			state = es.patrol;
			m.vspd = -3; m.holdjump = 0; BLAST(); vspd = 0; hspd = 0;
			shellcooldown = 10
		}
	}
}


if instance_place(x+facingdir,y,oParenemy) && instance_place(x+facingdir,y,oParenemy).state = es.shellhit
	&& state != es.die && state != es.stomp
{
	points(200,true)
	sfx(sndKick,0);
	vspd = -2;
	state = es.die;
	dieface = sign(instance_place(x+facingdir,y,oParenemy).hspd);
}
	

if shellcooldown > 0
{shellcooldown --;}

if state = es.stomp
{
	stomptimer --;
	if stomptimer < 0
	{instance_destroy();}
}


if state = es.die
{
	hspd = dieface*1.5;
	vspd += 0.15;
	image_yscale = -abs(image_yscale);
	
	x += hspd;
	y += vspd;
}


if !instance_exists(oIsArena)
{
	var cx = camera_get_view_x(view_camera[0])
	if x-16 < cx + SCREENW && state = es.frozen
	{state = es.patrol;}
}








