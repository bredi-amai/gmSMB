var aaah = imat;
if instance_place(x,y,oParenemy)
{
	with(instance_place(x,y,oParenemy))
	{if aaah = 1 {x = 1;} else if aaah = -1 {x = room_width-1;}}
}
if place_meeting(x,y,oMario)
{
	with(oMario)
	{if aaah = 1 {x = 1;} else if aaah = -1 {x = room_width-1;}}
}

if place_meeting(x,y,oSuperstar)
{
	with(instance_place(x,y,oSuperstar))
	{if aaah = 1 {x = 1;} else if aaah = -1 {x = room_width-1;}}
}




