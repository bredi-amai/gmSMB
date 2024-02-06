if !instance_exists(oIsArena)
{
	if !onview() 
	{exit;}
}

event_inherited()

shader_set(shdColorswap)
	apply_palette(sPalette_gold,global.environment+1,image_alpha)
	draw_self();
shader_reset();



