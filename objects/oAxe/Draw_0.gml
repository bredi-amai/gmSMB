
if !onview()
{exit;}

shader_set(shdColorswap);
	apply_palette(sPalette_gold,global.environment+1,image_alpha)
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
shader_reset();



if instance_place(x,y,oMario)
{
	bgm(-1,0);
	
	if instance_place(x+1,y,oCol)
	{instance_destroy(instance_place(x+1,y,oCol));}
	
	instance_place(x,y,oMario).state = ps.castleending
	if instance_exists(oBridgemask)
	{instance_nearest(x,y,oBridgemask).active = 1; instance_nearest(x,y,oBridgemask).alarm[0] = 10;}
	instance_destroy();
}