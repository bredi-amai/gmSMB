if die = 2 && !onview()
{instance_destroy();}

draw_self()
draw_sprite_ext(sBowser_head,sign(firetimer),x,y-sprite_height,image_xscale,image_yscale,0,image_blend,image_alpha)


if !onview() or !(mario_freeze() = 0 or mario_freeze() = 4)
{exit;}


var mspd = 0.3


if instance_exists(oMario) && die = false
{
	if oMario.x > x && firetimer = 0
	{
		image_xscale = -abs(image_xscale);
		
		hspd = 0;
		if instance_exists(oAxe)
		{
			if x < oAxe.bbox_left-6 && !place_meeting(x+1,y,oCol)
			{x += 0.7;}
			
			c ++;
		}
	}
	else
	{
		image_xscale = abs(image_xscale);

		c ++;
	
		if c mod 100 = 0 && grounded
		{hspd = choose(-abs(mspd),abs(mspd));}
	
		if c mod 150 = 0 && grounded
		{vspd = -2.9;}
		
		if c mod 120 = 0
		{
			if choose(0,1,1) = 1
			{
				firetimer = 30;
			}
		}
	}
}

if die != false
{firetimer = 0;}


if firetimer > 0 
{firetimer --;}
if firetimer = 1
{instance_create_depth(bbox_left-8,bbox_top,depth,oBowserfire).readjust = true;}




if x <= xstart-(16*6) && hspd < 0
{hspd = abs(mspd);}
if instance_exists(oAxe) && x >= oAxe.bbox_left-8 && hspd > 0
{hspd = -abs(mspd);}


if !instance_exists(oAxe) && die = false
{
	image_speed = imgspd*3;
	hspd = 0; vspd = 0;
}

if die = true && round(y) > ystart+2
{
	sfx(sndBowserdie,1);
	die = 2;
	image_speed = 0;
	hspd = 0;
}



collide();


if !grounded
{vspd -= 0.3;}
vspd = clamp(vspd,-4,3);


var m1 = collision_rectangle(x-(sign(image_xscale)*5),y-sprite_height,x+(sign(image_xscale)*8),y-sprite_height*2+4,oMario,true,true);
var m2 = instance_place(x,y,oMario);
if m1		{m1.gethit = 1;}
else if m2	{m2.gethit = 1;}

//draw_sprite_ext(sBowser_head,sign(firetimer),x,y-sprite_height,image_xscale,image_yscale,0,image_blend,image_alpha)