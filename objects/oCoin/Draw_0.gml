if global.environment = e.underwater
{sprite_index = sCoinunderwater;}
else
{sprite_index = sCoin;}


if !onview()
{exit;}

shader_set(shdColorswap);
	apply_palette(sPalette_gold,global.environment+1,image_alpha)
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha)
shader_reset();



if place_meeting(x,y,oMario)
{
	global.coins += 1;
	global.score += 200;
	
	sfx(sndCoin,0)
	
	BLAST()
	
	instance_destroy();
}