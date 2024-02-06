function sfx(sound,channel)
{
	if global.sfx[0] != -1 {audio_stop_sound(global.sfx[0]);}
	global.sfx[0] = audio_play_sound(sound,1,false)
	global.sfx[1] = channel
}
function set_bgm(bgmnamestr)
{
	audio_stop_sound(global.ch[0])
	audio_stop_sound(global.ch[1])
	audio_stop_sound(global.ch[2])
	audio_stop_sound(global.ch[3])
	
	var ac0 = asset_get_index("mus"+bgmnamestr+"_c0")
	var ac1 = asset_get_index("mus"+bgmnamestr+"_c1")
	var ac2 = asset_get_index("mus"+bgmnamestr+"_c2")
	var ac3 = asset_get_index("mus"+bgmnamestr+"_c3")
	
	if audio_exists(ac0)	{global.ch[0] = audio_play_sound(ac0,1,true);}
	if audio_exists(ac1)	{global.ch[1] = audio_play_sound(ac1,1,true);}
	if audio_exists(ac2)	{global.ch[2] = audio_play_sound(ac2,1,true);}
	if audio_exists(ac3)	{global.ch[3] = audio_play_sound(ac3,1,true);}
}

function BLAST()
{
	if global.blastmode = true
	{
		var ins = instance_create_depth(x,y,depth-99999,oBLAST)
	
		ins.image_xscale = sprite_width/32
		ins.image_yscale = sprite_height/32
	
		ins.x -= (sprite_width)/2
		ins.y -= (sprite_height)/2
	}
}

