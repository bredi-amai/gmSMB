var cx = camera_get_view_x(view_camera[0])
var cy = camera_get_view_y(view_camera[0])

var xx = 88-cx;
var yy = 136-cy;
var tsep = 16;


if section = 0
{
	shader_set(shdColorswap);
		apply_palette(sPalette_tilebrown,global.environment,1);
		draw_sprite(sTitle2,image_index,x-cx,y-cy+8);
	shader_reset();
	
	global.time = -1;
}
else
{
	draw_set_alpha(0.9);
	draw_set_color(c_black);
	draw_rectangle(0,0,SCREENW,SCREENH,false);
	draw_set_color(-1);
	draw_set_alpha(1);
	
	xx = SCREENW/3.5;
	yy = 64;
	tsep = 16;
}



if section = 3
{
	var p = sMario_s_idle
	if sprite_exists(ms("sMario_s_idle"))
	{p = ms("sMario_s_idle");}
	
	var scale = 4;
	if p = sPeterGriffin {scale = 0.5;}
	
	shader_set(shdColorswap)
		apply_palette(global.palettesprite,global.paletteindex,1)
		draw_sprite_ext(p,0,SCREENW/2+64,160+32+sin(current_time/800)*5,scale+(marioxs*(scale/4)),scale+(marioys*(scale/4)),0,-1,1)
	
	shader_reset();
	
	draw_set_font(fntComicsmall)
	draw_set_halign(fa_center);
	draw_text(SCREENW/2+64,160+32+10,"creator: "+creatorlist[| curplayersel])
	draw_set_halign(fa_left);
}

marioxs = lerp(marioxs,0,.2);
marioys = lerp(marioys,0,.2);


draw_set_font(FNT);

for (var i = 0; i < optionsnum[section]; i ++;)
{
	if i = sel	{draw_sprite(sMushsel,0,xx-16,yy+(i*tsep));}
	
	#region different buttons to draw
	
	if menu[# section, i] = "SFX"
	{draw_text(xx,yy+(i*tsep),menu[# section, i]+" * "+string(round(global.volsfx*100)))}
	else if menu[# section, i] = "BGM"
	{draw_text(xx,yy+(i*tsep),menu[# section, i]+" * "+string(round(global.volbgm*100)))}
	else if menu[# section, i] = "BACK"
	{draw_sprite(sBacksel,0,xx,yy+(i*tsep)); draw_text(xx+16,yy+(i*tsep),menu[# section, i]);}
	else if menu[# section, i] = "USERNAME - "
	{
		draw_text(xx,yy+(i*tsep),menu[# section, i])
		draw_set_font(fntComic)
		draw_text(xx+(8*11),yy+(i*tsep)-4,global.username)
		draw_set_font(FNT)
	}
	else if menu[# section, i] = "SET IP - "
	{
		draw_text(xx,yy+(i*tsep),menu[# section, i])
		draw_set_font(fntComic)
		draw_text(xx+(8*10),yy+(i*tsep)-4,global.ip)
		draw_set_font(FNT)
	}
	else if menu[# section, i] = "SET PORT - "
	{
		draw_text(xx,yy+(i*tsep),menu[# section, i])
		draw_set_font(fntComic)
		draw_text(xx+(8*11),yy+(i*tsep)-4,global.port)
		draw_set_font(FNT)
	}
	else if menu[# section, i] = "SOUND MODE - "
	{
		var ex = "CLASSIC"
		if global.musicchannels = false {ex = "MODERN";}
		draw_text(xx,yy+(i*tsep),menu[# section, i]+ex)
	}
	else if menu[# section, i] = "PLAYER - "
	{draw_text(xx,yy+(i*tsep),menu[# section, i]+string_upper(global.player));}
	else if menu[# section, i] = "PALETTE - "
	{draw_text(xx,yy+(i*tsep),menu[# section, i]+string_upper(global.paletteindex));}
	else if menu[# section, i] = "MAX PLAYERS - "
	{draw_text(xx,yy+(i*tsep),menu[# section, i]+string_upper(global.maxplayers));}
	else if section = 8 && menu[# section, i] != "BACK"
	{
		var gobal  = global.keyu
		
		switch(menu[# section, i])
		{
			case "DOWN":	gobal=global.keyd		break;
			case "LEFT":    gobal=global.keyl		break;
			case "RIGHT":   gobal=global.keyr		break;
			case "ACTION":  gobal=global.keya		break;
			case "JUMP":    gobal=global.keyj		break;
		}
		
		draw_text(xx,yy+(i*tsep),menu[# section, i]);
		draw_set_font(fntComic)
		draw_text(xx+(8*11),yy+(i*tsep)-4,"( "+keycode_to_string(gobal,false)+" )")
		draw_set_font(FNT)
	
	}
	
	else
	{draw_text(xx,yy+(i*tsep),menu[# section, i]);}
	
	
	#endregion
}



bgm(-1,0)



if waitforcontrol < 0
{waitforcontrol = 0;}

if waitforcontrol > 0
{
	waitforcontrol --;
	
	if keyboard_check_pressed(vk_escape)
	{waitforcontrol = 0;}
	
	draw_set_alpha(0.9)
	draw_rectangle_color(-1,-1,SCREENW+1,SCREENH+1,c_black,c_black,c_black,c_black,false)
	draw_set_alpha(1);

	draw_set_halign(fa_middle)
	draw_text(SCREENW/2,SCREENH/2,"WAITING FOR KEY:  "+string(menu[# section, sel]))
	draw_text(SCREENW/2,SCREENH/2 + 16,waitforcontrol)
	
	if keyboard_check_pressed(vk_anykey) && (keyboard_lastkey != vk_enter && keyboard_lastkey != vk_escape)
	{
		variable_global_set(settingkey,keyboard_lastkey)
		waitforcontrol = -1
		savesettings()
	}
	
	draw_text(SCREENW/2,SCREENH-16,"PRESS ESCAPE TO CANCEL")
	draw_set_halign(fa_left)
	
}

draw_set_font(-1)

if waitforcontrol != 0
{draw_set_halign(fa_left); exit;}


#region selection

if keyboard_check_pressed(global.keyu) && sel > 0
{sel -= 1;}
if keyboard_check_pressed(global.keyd) && sel < optionsnum[section]-1
{sel += 1;}

//if keyboard_check_pressed(global.keya)
//{section = 0;	sfx(sndBump,0);}



var p = (keyboard_check_pressed(global.keyr)-keyboard_check_pressed(global.keyl)); 
if menu[# section, sel] = "SFX"
{global.volsfx += 0.1*p; if p != 0 {global.volsfx = clamp(global.volsfx,0,1); sfx(sndStomp,0); savesettings()}}
if menu[# section, sel] = "BGM"
{global.volbgm += 0.1*p; if p != 0 { global.volbgm = clamp(global.volbgm,0,1); audio_play_sound(sndStomp,1,0,global.volbgm); savesettings()}}

global.volbgm = clamp(global.volbgm,0,1);
global.volsfx = clamp(global.volsfx,0,1);


if menu[# section, sel] = "PLAYER - "
{
	if p != 0 && !(!(p = -1 && curplayersel > 0) && !(p = 1 && curplayersel < ds_list_size(playerlist)-1))
	{marioxs = -1; marioys = 1;}
	curplayersel += p;
	if p != 0
	{
		global.paletteindex = 0;
		updtplayerpalette()
		savesettings()
	}
	curplayersel = clamp(curplayersel,0,ds_list_size(playerlist)-1);
	global.player = playerlist[| curplayersel]
}

if menu[# section, sel] = "PALETTE - "
{
	if p != 0 && !(!(p = -1 && global.paletteindex > 1) && !(p = 1 && global.paletteindex < sprite_get_height(global.palettesprite)-1))
	{marioxs = -1; marioys = 1;}
	
	global.paletteindex += p;
	savesettings()
	
}

// palette
updtplayerpalette()
global.paletteindex = clamp(global.paletteindex,1,sprite_get_height(global.palettesprite)-1);



if menu[# section, sel] = "SOUND MODE - "
{
	if p = -1
	{global.musicchannels = true; savesettings()}
	else if p = 1
	{global.musicchannels = false; savesettings()}
}



#endregion

if keyboard_check_pressed(global.keyj)
{
	switch(menu[# section, sel])
	{
		case "1 PLAYER GAME":
			room_goto(playwillsendmetothisroom);
			global.time = timeunits(400)
			sfx(sndStomp,0);
		break;
		case "NETWORK GAME":
			section = 1;
			sel = 0;
			sfx(sndStomp,0);
		break
		case "OPTION":
			section = 2;
			sel = 0;
			sfx(sndStomp,0);
		break;
		case "BACK":
			if section = 4			{section = 1; sel = 0;}
			else if section = 5		{section = 1; sel = 1;}
			else if section = 3		{section = 2; sel = 0;}
			else if section = 6		{section = 2; sel = 2;}
			else if section = 2		{section = 0; sel = 2;}
			else if section = 1		{section = 0; sel = 1;}
			else if section = 7		{section = 2; sel = 1;}
			else if section = 8		{section = 2; sel = 3;}
			else					{section = 0; sel = 0;}
		
			sfx(sndBump,0);
		break;
		case "USERNAME - ":
			global.username = get_string("Insert a username",global.username)
			sfx(sndStomp,0);
			savesettings()
		break;
		case "SET IP - ":
			global.ip = get_string("Insert IP (of server)",global.ip)
			sfx(sndStomp,0);
			savesettings()
		break;
		case "SET PORT - ":
			global.port = get_integer("Insert port (of server)",global.port)
			sfx(sndStomp,0);
			savesettings()
		break;
		case "JOIN":
			section = 4
			sel = 0;
			sfx(sndStomp,0);
		break;
		case "HOST":
			section = 5
			sel = 0;
			sfx(sndStomp,0);
		break;
		case "JOIN GAME":
			room_goto(rmLobby);
			global.insertclient = true
			sfx(sndStomp,0);
		break;
		case "HOST GAME":
			room_goto(rmServer);
			sfx(sndStomp,0);
		break;
		case "MAX PLAYERS":
			global.maxplayers = get_integer("How many max players?",global.maxplayers)
			global.maxplayers = clamp(global.maxplayers,0,50);
			sfx(sndStomp,0);
		break;
		case "CUSTOMIZE":
			section = 3;
			sel = 0;
			sfx(sndStomp,0);
		break;
		case "AUDIO":
			section = 6;
			sel = 0;
			sfx(sndStomp,0);
		break;
		case "VIDEO":
			section = 7;
			sel = 0;
			sfx(sndStomp,0);
		break;
		case "TOGGLE FULLSCREEN":
			window_set_fullscreen(!window_get_fullscreen())
		break;
		case "RESET WINDOW":
			window_set_fullscreen(false)
		
			var scrsizemult = 3;
			var displayw = display_get_width();
			var displayh = display_get_height();
			var xpos = (displayw / 2) - (SCREENW*scrsizemult)/2;
			var ypos = (displayh / 2) - (SCREENH*scrsizemult)/2;
			window_set_rectangle(xpos,ypos,SCREENW*scrsizemult,SCREENH*scrsizemult);
		break;
		case "HIDE - SHOW DISCORD PFP":
		
			global.hidepfp = !global.hidepfp;
			savesettings()
		break;
		
		case "CONTROLS":
			section = 8;
			sel = 0;
			sfx(sndStomp,0);
		break;
		case "UP":
			setcontrol("keyu")
		break
		case "DOWN":
			setcontrol("keyd")
		break
		case "LEFT":
			setcontrol("keyl")
		break
		case "RIGHT":
			setcontrol("keyr")
		break
		case "ACTION":
			setcontrol("keya")
		break
		case "JUMP":
			setcontrol("keyj")
		break
	}
}

