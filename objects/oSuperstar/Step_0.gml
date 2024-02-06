/// @description Insert description here
// You can write your code in this editor



collide();

if grounded = true
{vspd = -6;}
else
{vspd -= 0.2;}
if place_meeting(x+hspd+sign(facing),y,oCol)
{facing = -facing; hspd = facing*spd;}



if y > room_height+64
{
	instance_destroy();
}


move_out(32,oSuperstar);
move_out(32,oCol);


