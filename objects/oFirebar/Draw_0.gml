if !onview()
{exit;}

c ++;

if c > 4 && mario_freeze() = 0
{
	if dir = "ccw"
	{direction += 12;}
	if dir = "cw"
	{direction -= 12;}
	c = 0;
}




for (var i = 0; i < size; i ++;)
{
	draw_sprite(sFireball,image_index,x+lengthdir_x(8*i,direction),y+lengthdir_y(8*i,direction));
}

var m = collision_line(x+4,y+4,x+lengthdir_x(8*size -4,direction)+4,y+lengthdir_y(8*size -4,direction),oMario,true,true)
if m
{
	m.gethit = 1;
}

