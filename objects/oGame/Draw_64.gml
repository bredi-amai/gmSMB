if room = rmServer
{exit;}



/// handle gui
draw_set_font(FNT)


#region DEBUG gui

var cx = 0; cy = 0;//camera_get_view_x(view_camera[0]); var cy = camera_get_view_y(view_camera[0]);
var tile = 8

draw_set_font(FNT);

if room != rmTitle && global.debug = true
{
	if keyboard_check(vk_escape) && global.chatfocus = false
	{resetcheck++}
	else
	{resetcheck = 0;}
	
	if resetcheck > room_speed*1
	{room_goto(rmTitle);}
	
	
	if !instance_exists(oClient)
	{
		if keyboard_check_pressed(vk_tab)
		{debug = !debug;}
		
		if debug
		{
			var boolbox = function(b,to)
			{
				if b = -1
				{exit;}
				draw_sprite(sCheckbox,b,(SCREENW-(256/2))+6+0,(8*3)+(8*to)+8+0)
			}
			
			draw_rectangle_color((SCREENW-(256/2))+(tile*-1)+cx,(tile*3)+cy,(SCREENW-(256/2))+(tile*1)+cx+64,(tile*3)+cy+112,c_black,c_black,c_black,c_black,false);
			draw_sprite(sMushsel,0,(SCREENW-(256/2))+4+(tile*-1)+cx,(tile*3)+(tile*debugsel)+tile+cy)
			
			
			debugsel += keyboard_check_pressed(global.keyd) - keyboard_check_pressed(global.keyu)
			debugsel = clamp(debugsel,0,6);
			
			
			
			draw_set_font(fntComicsmall)
			
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*1+cy,"RTXMODE"); boolbox(global.rtxmode,0);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*2+cy,"SCHUTMODE"); boolbox(global.schutmode,1);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*3+cy,"FREECAM"); boolbox(global.freecam,2);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*4+cy,"TRIPPYMODE"); boolbox(global.trippymode,3);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*5+cy,"ENVIRONMENT"); boolbox(-1,4);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*6+cy,"WARP"); boolbox(-1,5);
			draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*7+cy,"PLAYER"); boolbox(-1,6);
			
			draw_set_font(FNT);
			
			if keyboard_check_pressed(vk_enter)
			{
				switch(debugsel)
				{
					case 0: global.rtxmode = !global.rtxmode; break;
					case 1: global.schutmode = !global.schutmode; break;
					case 2: global.freecam = !global.freecam; break;
					case 3: global.trippymode = !global.trippymode; break;
					case 4: if global.environment != e.snow {global.environment += 1;} else {global.environment = -1;} break;
					case 5: 
						var _gr = get_string("ROOM NAME","rm1_1");
						if room_exists(asset_get_index(_gr))	{room_goto(asset_get_index(_gr));}
					break;
					case 6: global.player = get_string("PLAYER NAME","Mario") break;
				}
			}
		}
	}
	else
	{global.freecam = true; debug = false;}


	if global.schutmode = true && !instance_exists(oGun) && instance_exists(oMario) {instance_create_depth(0,0,depth,oGun);}

	/*
	if global.rtxmode = true	{draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*1+cy,"RTXMODE");}
	if global.schutmode = true	{draw_text((SCREENW-(256/2))+(tile*2)+cx,(tile*3)+tile*2+cy,"SCHUTMODE");}
	*/
	
	draw_text(cx+(tile*3),cy+tile*2+tile,"FPS - "+string(fps));
	
	draw_text_color(cx+(tile*3),cy+tile*4+tile,"HOLD ESC RETURN TO TITLE",c_red,c_red,c_red,c_red,(resetcheck/100)+(0.5*sign(resetcheck)));
	
	/*
	draw_text(cx+(tile*2),cy+tile*3+tile*2,"SQ1 - "+string(audio_sound_get_gain(global.ch[0])));
	draw_text(cx+(tile*2),cy+tile*3+tile*3,"SQ2 - "+string(audio_sound_get_gain(global.ch[1])));
	draw_text(cx+(tile*2),cy+tile*3+tile*4,"TRI - "+string(audio_sound_get_gain(global.ch[2])));
	draw_text(cx+(tile*2),cy+tile*3+tile*5,"NOI - "+string(audio_sound_get_gain(global.ch[3])));
	
	draw_text(cx+(tile*2),cy+tile*3+tile*6,"MOD - "+string(audio_sound_get_gain(global.ch[4])));
	*/

}

#endregion


#region fake load screen

if loadscreen > -1
{
	loadscreen --;
	
	var pal = lastenv
	if loadscreen < 10
	{pal = global.environment;}
	
	shader_set(shdColorswap);
	apply_palette(sPalette_background,pal,image_alpha);
		draw_sprite_stretched(sBG_0,0,0,0,SCREENW+1,SCREENH+1);
	shader_reset();
	
	instance_deactivate_all(true)
	
	if loadscreen = -1
	{instance_activate_all();}
}

#endregion


#region respawn

if instance_exists(oMario) && oMario.state = ps.die
{
	diec ++;
	
	draw_set_alpha(0.4);
	draw_set_color(c_black)
	draw_rectangle(0,0,SCREENW,SCREENH,false)
	draw_set_color(-1);
	draw_set_alpha(1)
	
	draw_set_halign(fa_center)
	draw_text(SCREENW/2,SCREENH/2,"YOU DIED!1!! RESPAWNING...")
	draw_set_halign(fa_left)
	
	if diec > room_speed*4
	{diec = 0; room_restart(); if global.time != -1 {global.time = timeunits(400)}}
	oMario.powerup = "s"
}


#endregion




draw_set_font(-1);