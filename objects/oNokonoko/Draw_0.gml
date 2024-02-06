
if !onview()
{exit;}

shader_set(shdColorswap);
	apply_palette(sPalette_nokonoko,global.environment,image_alpha)
	if image_yscale > 0
	{draw_sprite_ext(sprite_index,image_index,x,y,round(round(image_xscale)*round(facingdir)),image_yscale,image_angle,image_blend,image_alpha)}
	else
	{draw_sprite_ext(sprite_index,image_index,x,y+(16*image_yscale),round(round(image_xscale)*round(facingdir)),image_yscale,image_angle,image_blend,image_alpha)}
	
shader_reset();

