if mario_freeze() = 4
{instance_destroy();}

if !onview() or mario_freeze() != 0
{exit;}


var m = instance_place(x,y,oMario)
if m
{
	m.gethit = 1;
}

if scream = false
{
	scream = true;
	sfx(sndBowserfire,3);
}


x -= 1;



if readjust = true && round(y) != round(y/16)*16
{y++;}