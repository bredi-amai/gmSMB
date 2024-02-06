
if blockstate = 0
{
	image_index = 1
	if instance_exists(oMario) && instance_place(x,y,oMario) && oMario.vspd < 0 && oMario.bbox_top >= bbox_bottom-8
	{
		blockstate = 1;
		instance_create_depth(x,y,depth,oCol);
		with(oMario)
		{if place_meeting(x,y,oCol) {while place_meeting(x,y,oCol) {y ++;}} vspd = 1;}
	}
}
if blockstate = 1
{
	instance_create_depth(x,y,depth-1,oBlockhit).image_index = hitblockimage;
	image_alpha = 0;
	alarm[0] = 12;
	blockstate = 2;
	
	if contents = conts.coin
	{instance_create_depth(x,y,depth,oCoinjump);}
	if contents = conts.powerup
	{
		sfx(sndItem,0);
		if instance_exists(oMario) && instance_nearest(x,y,oMario).powerup = "s"
		{instance_create_depth(x+8,y+16,depth,oMush);}
		else
		{instance_create_depth(x+8,y+16,depth,oFireflower);}
	}
	if contents = conts.life
	{
		sfx(sndItem,0);
		instance_create_depth(x+8,y+16,depth,o1UPShroom);
	}
	
	BLAST()
}

if blockstate = -1
{
	image_index = emptyblockimage
	
	sprite_index = sEmptyblock; 
	
	image_alpha = 1;
}

if blockstate = 2
{image_alpha = 0;}




shader_set(shdColorswap)
	apply_palette(sPalette_gold,global.environment+1,image_alpha)
	draw_self();
shader_reset();




