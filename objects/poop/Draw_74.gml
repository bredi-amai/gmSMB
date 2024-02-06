if global.trippymode = true
{
	
	draw_set_color(c_black);
	draw_rectangle(-100,-100,SCREENW+100,SCREENH+100,false)
	draw_set_color(-1);

	var spr = sprite_create_from_surface(application_surface,0,0,SCREENW,SCREENH,false,false,SCREENW/2,SCREENH/2)

	shader_set(shdWave)
	shader_set_uniform_f(shader_get_uniform(shdWave,"time"),-current_time/10);

	var ws = 32

	draw_sprite_pos(spr,0,
		+sin(current_time/300)*ws,+sin(current_time/300)*ws,
		SCREENW-cos(current_time/300)*ws,-cos(current_time/300)*ws,
		SCREENW-sin(current_time/300)*ws,SCREENH+sin(current_time/300)*ws,
		-cos(current_time/300)*ws,SCREENH-cos(current_time/300)*ws,1)

	sprite_flush(spr)
	sprite_delete(spr)

	shader_reset();


	audio_sound_pitch(global.ch[0],sin(current_time/90)+1)
	audio_sound_pitch(global.ch[1],sin(current_time/90)+1)
	audio_sound_pitch(global.ch[2],sin(current_time/90)+1)
	audio_sound_pitch(global.ch[3],sin(current_time/90)+1)
	audio_sound_pitch(global.ch[4],sin(current_time/90)+1)

	audio_sound_pitch(global.sfx[0],sin(current_time/90)+1)
}




