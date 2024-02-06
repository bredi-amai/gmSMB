if !instance_exists(oClient)
{instance_destroy();}

if room != myroom
{exit;}

shader_set(shdColorswap)
	apply_palette(palspr,palette,1)
	draw_self();
shader_reset();

draw_set_alpha(0.6);
draw_set_font(fntComic)
draw_set_halign(fa_center);
draw_text(x,bbox_top-16,username)
draw_set_halign(fa_left);
draw_set_font(-1);
draw_set_alpha(1);

image_yscale = abs(image_xscale)


if instance_exists(oIsArena)
{
	draw_set_color(c_orange);
	draw_set_font(FNT)
	draw_sprite_ext(sSuperstaricon,0,x-16,bbox_bottom,1,1,0,c_yellow,1);
	draw_text(x+8,bbox_bottom+6,mystars);
	draw_set_font(-1);
	draw_set_color(-1);
	

}