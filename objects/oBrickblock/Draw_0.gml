if !instance_exists(oIsArena)
{
	if !onview()
	{exit;}
}

event_inherited()


shader_set(shdColorswap)
	apply_palette(sPalette_tilebrown,global.environment,image_alpha)
	draw_self();
shader_reset();


if !onview()
{instance_deactivate_object(id);}

