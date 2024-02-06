if !onview()
{exit;}

shader_set(shdColorswap);
	apply_palette(sPalette_goomba,global.environment,image_alpha)

	if image_yscale > 0
	{draw_sprite_ext(sprite_index,ind,x,y,image_xscale*xs,image_yscale,image_angle,image_blend,image_alpha)}
	else
	{draw_sprite_ext(sprite_index,ind,x,y+(16*image_yscale),image_xscale*xs,image_yscale,image_angle,image_blend,image_alpha)}
	

shader_reset();

