
image_xscale += 1;

sfx(sndBreak,1);
sfx(sndBump,0);


if bridgecol > -1 && instance_place(x,y,bridgecol) &&
	collision_point(bbox_right-sprite_width+1,bbox_bottom-1,bridgecol,true,true)
{
	alarm[0] = 5
}
else
{active = 2;}






