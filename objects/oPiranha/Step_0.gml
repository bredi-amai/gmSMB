depth = 299

if instance_exists(oMario) && !(oMario.x > bbox_left - 20 && oMario.x < bbox_right + 20)
	&& st = 1
{
	st = 2;
}

if st >= 2
{
	st ++;
	
	if y > ystart - sprite_height-8
	{y -= 0.5;}
	
	if st > room_speed * 2
	{st = -1;}
}
if st <= -1
{
	if y < ystart
	{y += 0.5;}
	else
	{st = 0;}
}

if st >= 0 && st < 1
{
	st += 0.01;
}

if instance_place(x,y,oMario) && instance_place(x,y,oMario).starman > 0
{sfx(sndKick,0); instance_destroy();}

if instance_place(x,y,oMario) && instance_place(x,y,oMario).shoulderbash > 0
{sfx(sndKick,0); oMario.shoulderbash = room_speed*0.5; instance_destroy();}



var m = instance_place(x,y,oMario)
if m && oMario.invincible = 0
{
	m.gethit = 1;
}






