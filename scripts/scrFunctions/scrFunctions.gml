function sfx(sound,channel)
{
	if global.musicchannels = true
	{
		if audio_is_playing(sound) {audio_stop_sound(sound);}
		global.sfx[0] = audio_play_sound(sound,1,false,global.volsfx)
		global.sfx[1] = channel
	}
	else
	{
		audio_play_sound(sound,1,false,global.volbgm)
	}
}

function bgm(bgmstr,loops)
{
	if instance_exists(oRacemanager) && !(bgmstr = "Levelend" or bgmstr = "GO")
	{
		exit;
	}
	
	if is_string(bgmstr) && global.musicchannels = true && global.player != "Peter Griffin" &&
		global.player != "Martin" && global.player != "Anton"
		&& bgmstr != "Levelend" && bgmstr != "Castleend" && bgmstr != "Lobby"
	{
		audio_stop_sound(global.ch[0]);
		audio_stop_sound(global.ch[1]);
		audio_stop_sound(global.ch[2]);
		audio_stop_sound(global.ch[3]);
		audio_stop_sound(global.ch[4]);
		
		audio_stop_all();
	
		var c0 = asset_get_index("mus"+bgmstr+"_c0")
		var c1 = asset_get_index("mus"+bgmstr+"_c1")
		var c2 = asset_get_index("mus"+bgmstr+"_c2")
		var c3 = asset_get_index("mus"+bgmstr+"_c3")
	
		if audio_exists(c0) {global.ch[0] = audio_play_sound(c0,1,loops,global.volbgm);}
		if audio_exists(c1) {global.ch[1] = audio_play_sound(c1,1,loops,global.volbgm);}
		if audio_exists(c2) {global.ch[2] = audio_play_sound(c2,1,loops,global.volbgm);}
		if audio_exists(c3) {global.ch[3] = audio_play_sound(c3,1,loops,global.volbgm);}
	}
	else
	{
		audio_stop_sound(global.ch[4])
		
		if bgmstr != -1
		{
			var mus = asset_get_index("mus"+bgmstr)
			
			if global.player = "Peter Griffin"
			{
				if bgmstr = "GO"	{mus = musFamilyguydie;}
				else if bgmstr = "Starman"	{mus = musFamilyGuyStarman;}
				else if bgmstr = "Levelend" or bgmstr = "Castleend"	{mus = musFamilyguyLevelend;}
				else {mus = musFamilyGuy;}
			}
			if (bgmstr = "OW" or bgmstr = "UW" or bgmstr = "UG" or bgmstr = "CS")
			{
				if global.player = "Anton"
				{mus = musAnton;}
				if global.player = "Martin"
				{mus = musMartin;}
			}
			
			global.ch[4] = audio_play_sound(mus,1,loops,global.volbgm);
			
		}
		else
		{
			audio_stop_sound(global.ch[0]);
			audio_stop_sound(global.ch[1]);
			audio_stop_sound(global.ch[2]);
			audio_stop_sound(global.ch[3]);
			audio_stop_sound(global.ch[4]);
		}
	}
}

function points(amnt,give)
{
	var p = instance_create_depth((bbox_left+sprite_width/2),bbox_top-8,-9999,oPoints);
	var ind = 0
	switch(amnt)
	{
		case 100: ind = 1; break;
		case 200: ind = 2; break;
		case 400: ind = 3; break;
		case 500: ind = 4; break;
		case 800: ind = 5; break;
		case 1000: ind = 6; break;
		case 2000: ind = 7; break;
		case 4000: ind = 8; break;
		case 5000: ind = 9; break;
		case 8000: ind = 10; break;
	}
	if ind != 0
	{
		if give = true
		{global.score += amnt;}
		p.image_index = ind;
	}
}

function BLAST()
{
	if global.player = "Anton"
	{
		var ins = instance_create_depth(x,y,depth-99999,oBLAST)
	
		ins.image_xscale = sprite_width/32
		ins.image_yscale = sprite_height/32
	
		ins.x -= (sprite_width)/2
		ins.y -= (sprite_height)/2
	}
}

function onview()
{
	var cx = camera_get_view_x(view_camera[0]);
	var cy = camera_get_view_y(view_camera[0]);
	if bbox_right+16 > cx && bbox_left-16 < cx+SCREENW && bbox_bottom+16 > cy && bbox_top-16 < cy+SCREENH
	{return true;}
	return false;
}

function move_out(pixels,collision)
{
	for (var i = 0; i < pixels; i ++;)
	{
		if place_meeting(x,y,collision)
		{
			if !place_meeting(x+i,y,collision)		{x += i;}
			else if !place_meeting(x-i,y,collision)	{x -= i;}
			if !place_meeting(x,y-i,collision)		{y -= i;}
			else if !place_meeting(x,y+i,collision)	{y += i;}
		}
	}
}