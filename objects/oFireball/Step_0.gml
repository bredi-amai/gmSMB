if place_meeting(x,y+1,oCol)
{vspd = -2.5;}

hspd = facing*4

collide();

if place_meeting(x+facing,y,oCol)
{instance_destroy(); instance_create_depth(x-8,y-8,depth-1,oFireworks).image_speed *= 1.5; sfx(sndBump,1);}

if instance_place(x,y,oParenemy) && instance_place(x,y,oParenemy).state != es.die && instance_place(x,y,oParenemy).state != es.stomp
{
	sfx(sndKick,1);
	instance_create_depth(x-8,y-8,depth-1,oFireworks).image_speed *= 1.5;
	points(200,true)
	instance_place(x,y,oParenemy).vspd = -2;
	instance_place(x,y,oParenemy).state = es.die;
	instance_place(x,y,oParenemy).dieface = facing
	instance_destroy();
}
if instance_place(x,y,oPiranha)
{
	sfx(sndKick,1);
	instance_create_depth(x-8,y-8,depth-1,oFireworks).image_speed *= 1.5;
	points(200,true)
	instance_destroy(instance_place(x,y,oPiranha));
	instance_destroy();
}

if !onview()
{instance_destroy();}