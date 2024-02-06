
shader_set(shdColorswap)

	if round(image_index) = 0
	{apply_palette(sPalette_goomba,global.environment,1);}
	if round(image_index) = 1
	{apply_palette(sPalette_nokonoko,global.environment,1);}
	
	draw_self()
shader_reset()

draw_sprite(sFireflower_stem,0,x,y);









