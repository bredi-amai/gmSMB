if instance_exists(oMario)
{
	gpu_set_fog(true,col,1,1);
	draw_sprite_ext(sprite_index,image_index,x,y+oMario.yoff,round(image_xscale)*oMario.scale,image_yscale*oMario.scale,image_angle,image_blend,image_alpha*2)
	gpu_set_fog(false,-1,1,1);


}

image_alpha -= 0.02
if image_alpha < 0 
{instance_destroy();}
