if global.rtxmode = true && instance_exists(oMario)
{
	image_alpha = lerp(image_alpha,maxalp,.1)
	if instance_exists(oGame)
	{oGame.dep = depth-1;}
}
else
{
	image_alpha = lerp(image_alpha,0,.1)
}



if image_alpha > 0
{
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);

	if !surface_exists(surf)
	{surf = surface_create(SCREENW,SCREENH);}
	if surface_exists(surf)
	{
		var rect = surface_create(SCREENW,SCREENH)
		surface_set_target(rect)
			
			draw_set_color(c_black)
			draw_rectangle(0,0,x-100-cx,SCREENH,false);
			draw_rectangle(0,0,SCREENW,y-100-1-cy,false);
			draw_rectangle(SCREENW,SCREENH,x+100-1-cx,0,false);
			draw_rectangle(SCREENW,SCREENH,0,y+100-1-cy,false);
		
			draw_sprite(sLightcircle,0,x-cx,y-cy)
			draw_set_color(-1)
		
		surface_reset_target()

	
	
		surface_set_target(surf)
		
			draw_set_color(c_black)
			draw_rectangle(0,0,SCREENW,SCREENH,false)
			draw_set_color(-1)
		
			draw_clear_alpha(c_black,1)
			
			if instance_exists(oCol)
			{
				with(oCol)
				{
					draw_set_color(c_black);
					draw_rectangle(x-cx,y-cy,x+sprite_width-cx,y+sprite_height-cy,false);
					draw_set_color(-1);
					
					if object_index = oQuestionblock && blockstate = 0
					{
						gpu_set_blendmode(bm_src_alpha_sat)
						draw_sprite_stretched_ext(sGlow,1,x-cx-8,y-cy-8,32,32,c_white,0.6)
						gpu_set_blendmode(bm_normal)
					}
				}
			}
			
			#region glowing objs
				if instance_exists(oCoin)
				{
					with(oCoin)
					{
						gpu_set_blendmode(bm_src_alpha_sat)
						draw_sprite_stretched_ext(sGlow,1,x-cx-4,y-cy-4,24,24,c_white,0.6)
						gpu_set_blendmode(bm_normal)
					}
				}
				if instance_exists(oCoinjump)
				{
					with(oCoinjump)
					{
						gpu_set_blendmode(bm_src_alpha_sat)
						draw_sprite_stretched_ext(sGlow,1,x-cx-4,y-cy-4,24,24,c_white,0.6)
						gpu_set_blendmode(bm_normal)
					}
				}
			#endregion
		
			gpu_set_blendmode(bm_normal)
		
			gpu_set_blendmode(bm_subtract);
			
			var mdir = point_direction(x,y,mouse_x,mouse_y);
			image_angle = mdir
			

			for (var i = -32; i < 32; i ++;)
			{
				var len = SCREENW/2
				var lenx = lengthdir_x(len,mdir+i)
				var leny = lengthdir_y(len,mdir+i)
				if collision_line(x,y,x+lenx,y+leny,oCol,false,true)
				{
					while collision_line(x,y,x+lenx,y+leny,oCol,false,true) && len > 0
					{
						len -= 4;
						lenx = lengthdir_x(len,mdir+i)
						leny = lengthdir_y(len,mdir+i)
					}
					lenx = lengthdir_x(len+2,mdir+i)
					leny = lengthdir_y(len+2,mdir+i)
				}
			
				draw_line_width(x-cx,y-cy,x-cx+lenx,y-cy+leny,4)
			}
			
		
			gpu_set_blendmode(bm_normal);
			

		surface_reset_target();
	
		
		draw_set_alpha(image_alpha)
	
		shader_set(shdBlur)
		var uts = shader_get_uniform(shdBlur,"texel_size"); var ubv = shader_get_uniform(shdBlur,"blur_vector");
		shader_set_uniform_f(uts,0.003,0.003)
		shader_set_uniform_f(ubv,0.5,0.5)
	
		draw_surface(surf,cx,cy);
		surface_free(surf)
		

		if global.rtxmode = true
		{draw_surface_ext(rect,cx,cy,1,1,0,-1,image_alpha+(1-maxalp));}
		else
		{draw_surface_ext(rect,cx,cy,1,1,0,-1,image_alpha);}
		surface_free(rect)
	

		shader_reset()
	
		draw_set_alpha(1)
	}



	if instance_exists(oMario)
	{
		x = oMario.x;
		y = oMario.bbox_top+4;
		face  = sign(oMario.image_xscale)
	}
	

	draw_sprite_ext(sprite_index,image_index,x+face*4,y+3,1,1,image_angle,-1,image_alpha)
	draw_set_alpha(choose(0.8,0.6)*image_alpha)
	draw_sprite(sFlare,0,x+face*4+lengthdir_x(4,image_angle),y+3+lengthdir_y(4,image_angle))
	
	draw_set_alpha(1);
}

if surf != -1 && surface_exists(surf)
{surface_free(surf);}