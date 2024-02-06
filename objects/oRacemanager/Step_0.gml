if room = rmTitle or room = rmLobby
{audio_stop_sound(racemusic); instance_destroy(); exit;}

if start >= 1
{
	audio_stop_sound(global.ch[0]);
	audio_stop_sound(global.ch[1]);
	audio_stop_sound(global.ch[2]);
	audio_stop_sound(global.ch[3]);
	audio_stop_sound(global.ch[4]);
	
	if start mod (room_speed) = 0
	{
		image_index += 1;
		if image_index < 3
		{sfx(sndBeep,1);}
		else if image_index = 3
		{audio_play_sound(sndBeep,1,false,global.volsfx,0,1.5);}
	}
	
	if image_index >= 3
	{
		start = -1;
		alarm[1] = 50;
	}
	
	start ++;
}
if /*instance_exists(oClient) && */showresults = false && round(image_index) >= 3
{
	//minutes = round((round((counter) / room_speed * 1000))/60000);
	seconds = round(counter div room_speed) mod 60;
	milliseconds = round((counter % room_speed) / room_speed * 1000);
	
	
	minutecounter ++;
	if minutecounter mod (room_speed*60) = 0
	{minutes ++;}
	
	counter ++;
	
	if !(instance_exists(oMario) && oMario.state = ps.die)
	{
		if !audio_is_playing(racemusic)
		{racemusic = audio_play_sound(musRace,1,0,global.volbgm);}
		if audio_sound_get_track_position(racemusic) >= 29.07
		{audio_sound_set_track_position(racemusic,3.4);}
	}

	
	
	if instance_exists(oMario) && (oMario.state = ps.flagpoledescend or oMario.state = ps.castleending)
	{showresults = true; audio_stop_sound(racemusic);}
}


if showresults = true && instance_exists(oClient)
{
	var mm = string(minutes);
	var ss = string(seconds);
	var mls = string(milliseconds);
		
	
	while (string_length(mm) < 2)	{mm = "0"+mm;}
	while (string_length(ss) < 2)	{ss = "0"+ss;}
	while (string_length(mls) < 3)	{mls = "0"+mls;}
		
	var timestr = mm+":"+ss+":"+mls;
		
	var buff = buffer_create(32, buffer_grow, 1);
	buffer_seek(buff, buffer_seek_start, 0);
	buffer_write(buff, buffer_u8, network.sendraceresult);	
	buffer_write(buff, buffer_u16, counter);
	buffer_write(buff, buffer_string, timestr);
	buffer_write(buff, buffer_string, global.username);
	network_send_packet(oClient.client, buff, buffer_tell(buff));
	buffer_delete(buff);
	
	showresults = 2
}
