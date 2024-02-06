/// @description Draw Total Players

var all_players = ds_list_size(total_players);

draw_set_font(FNT);

draw_text(16, 10, " - HOSTING!");

draw_set_halign(fa_center);
	draw_text(SCREENW/2, SCREENH/2 - 16, "PLAYERS CONNECTED - " + string(all_players));


draw_set_font(fntComic)
	draw_text(SCREENW/2, SCREENH-48, "To join, open another client");
	draw_text(SCREENW/2, SCREENH-32, "Press ESCAPE to set gamemode or start game");

draw_set_halign(fa_left);


if choosingmode = true
{draw_set_color(c_black); draw_set_alpha(0.98); draw_rectangle(0,0,SCREENW+1,SCREENH+1,false); draw_set_color(-1); draw_set_alpha(1);}


if keyboard_check_pressed(vk_escape)
{choosingmode = !choosingmode; cmsel = 0;}

if choosingmode = true
{
	for(var i = 0; i < ds_list_size(cmoptions); i ++;)
	{
		var gv = variable_global_get(cmbool[| i])
		
		
		
		if is_string(cmbool[| i])
		{draw_sprite(sCheckbox,sign(gv),32+16,64+(i*16));}
		
		
		//if cmoptions[| i] = "Arena (-DOES NOT WORK-):"
		//{draw_text(64,64+(i*16)-4,cmoptions[| i]+" "+string(gv));}
		//else
		//{
		draw_text(64,64+(i*16)-4,cmoptions[| i]);
	}
	
	draw_sprite(sMushsel,0,32,64+(cmsel*16))
	
	if keyboard_check_pressed(global.keyd) && cmsel < ds_list_size(cmoptions)-1
	{cmsel += 1;}
	if keyboard_check_pressed(global.keyu) && cmsel > 0
	{cmsel -= 1;}

	if keyboard_check_pressed(global.keyj)
	{
		/*if cmoptions[| cmsel] = "Arena:"
		{
			var gv = variable_global_get(cmbool[| cmsel])
			var valnew = gv+1;
			if valnew > 1
			{valnew = 0;}
			variable_global_set(cmbool[| cmsel],valnew)
		}*/
		if is_string(cmbool[| cmsel])
		{
			var gv = variable_global_get(cmbool[| cmsel])
			variable_global_set(cmbool[| cmsel],!gv)
		}
		else
		{
			if cmoptions[| cmsel] = "Begin game"
			{
				var jbuff = buffer_create(32, buffer_grow, 1);
				buffer_seek(jbuff, buffer_seek_start, 0);
				buffer_write(jbuff, buffer_u8, network.hostbegin);
				buffer_write(jbuff, buffer_bool, global.race);		
				buffer_write(jbuff, buffer_bool, global.schutmode);	
				buffer_write(jbuff, buffer_bool, global.rtxmode);
				buffer_write(jbuff, buffer_bool, global.arena);
				//network_send_packet(client, jbuff, buffer_tell(jbuff));
				
				//Loop through the total player list (containing sockets) and send the packet to each one
				for (var i = 0; i < ds_list_size(total_players); i++) {
					network_send_packet(ds_list_find_value(total_players, i), jbuff, buffer_tell(jbuff));	
				}
				
				buffer_delete(jbuff);
			}
			choosingmode = false;
		}
	}

	draw_set_halign(fa_center);
	draw_text(SCREENW/2, SCREENH-32, "Press ESCAPE to return");
	draw_set_halign(fa_left);
}

draw_set_font(-1);
