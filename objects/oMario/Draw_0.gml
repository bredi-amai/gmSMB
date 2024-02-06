if global.player = "Goldron"
{
	if hspd != 0 && grounded
	{yoff = -abs(sin(x/10))*5}
	else
	{yoff = 0;}
	if powerup = "s"	{ind = 0;}
	if powerup = "b"	{ind = 1;}
	if powerup = "f"	{ind = 2;}
}

scale = 1;

if global.player = "Peter Griffin"	{scale = 0.2;}
if global.player = "Anton" && powerup = "s"	{scale = 0.6}


if powerup = "f"
{palindex = 2;}
else
{palindex = global.paletteindex;}



shader_set(shdColorswap);
	apply_palette(global.palettesprite,palindex,image_alpha)

	if firetimer > 0 && global.player != "Peter Griffin"
	{
		var fs = ms("sMario_{}_fire")
		var fsw = sprite_get_width(fs); var fsh = sprite_get_height(fs);
		draw_sprite_part_ext(fs,ind,0,0,fsw,fsh-8,x-(image_xscale*fsw/2),y-fsh+yoff,
		(image_xscale*scale),(image_yscale*scale),image_blend,image_alpha);
		
		var cs = spr
		if spr = ms("sMario_{}_idle")
		{cs = ms("sMario_{}_fire");}
		var csw = sprite_get_width(cs); var csh = sprite_get_height(cs);
		draw_sprite_part_ext(cs,ind,0,csh-9,csw,9,x-(image_xscale*fsw/2),y-8+yoff,
		(image_xscale*scale),(image_yscale*scale),image_blend,image_alpha);
	}
	else
	{
		draw_sprite_ext(spr,ind,x,y+yoff,round(image_xscale)*scale,image_yscale*scale,image_angle,image_blend,image_alpha)
	}
	
shader_reset();

if starman != 0
{
	gpu_set_fog(true,make_color_hsv((starman) mod 255,255,255),1,1);
	draw_sprite_ext(spr,ind,x,y+yoff,round(image_xscale)*scale,image_yscale*scale,image_angle,image_blend,0.5)
	gpu_set_fog(false,-1,1,1);
	
	if starman mod 3 = 0
	{var smsfx = instance_create_depth(x,y,depth+2,oStarmanFX); smsfx.image_xscale = image_xscale; smsfx.col = make_color_hsv((starman) mod 255,255,255); smsfx.image_index = ind; smsfx.sprite_index = spr;}
}


if shoulderbash > 0 && (current_time/1000) mod 5 = 0
{
	var smsfx = instance_create_depth(x,y,depth+2,oStarmanFX); 
	smsfx.image_xscale = image_xscale; 
	smsfx.col = choose(c_red,c_purple);
	smsfx.image_index = ind; 
	smsfx.sprite_index = spr;
}



nes_flicker()



if powerup != "s" && crouch = false
{sprite_index = sMariomask1;}
else
{sprite_index = sMariomask0;}

if instance_exists(oClient)
{
	draw_set_alpha(0.6);
	draw_set_font(fntComic)
	draw_set_halign(fa_center);
	draw_text(x,bbox_top-16,global.username)
	draw_set_halign(fa_left);
	draw_set_font(-1);
	draw_set_alpha(1);
}

if instance_exists(oIsArena)
{
	draw_set_color(c_yellow);
	draw_set_font(FNT)
	draw_sprite_ext(sSuperstaricon,0,x-16,bbox_bottom,1,1,0,c_yellow,1);
	draw_text(x+8,bbox_bottom+6,global.stars);
	draw_set_font(-1);
	draw_set_color(-1);
	
	
	if instance_place(x,y,oSuperstar)
	{global.stars ++; instance_destroy(instance_place(x,y,oSuperstar))}
}