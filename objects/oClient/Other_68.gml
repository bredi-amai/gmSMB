/// @description Recieve Incoming Data

/*
This is the same scenario as the server, more or less. Here we simply do the same as the server, and get the incoming buffer packet
Then, we can read this data and assign it to whoever we need to

See more below
*/

var packet = async_load[? "buffer"];
buffer_seek(packet, buffer_seek_start, 0);

var PACKET_ID = buffer_read(packet, buffer_u8);

switch (PACKET_ID) {

	#region Latency
	case network.latency:
		//Read the time that was sent to us in the packet
		var _got_time = buffer_read(packet, buffer_u32);
		
		//Set our latency to be the difference
		latency = current_time - _got_time;
		
		//Reset the timeout because we are still connected
		timeout = 0;
	break;
	#endregion
	
	#region Join
	case network.join:
		//read the ID of the player connecting
		var player_id = buffer_read(packet, buffer_u16);
		var player_user = buffer_read(packet, buffer_string);
		var find_player = ds_map_find_value(instances, player_id);	
		
		ds_list_add(global.CHAT, player_user + " joined.");
		
	break;
	#endregion

	#region Movement
	case network.move:	//If we get the packet for movement, assign it to the correct player
		var player_id = buffer_read(packet, buffer_u16);
		var find_player = ds_map_find_value(instances, player_id);		//Find the instance ID of the player through the instance map
		
		//Read the rest of the data from the packet
		var player_x =		buffer_read(packet, buffer_s16);
		var player_y =		buffer_read(packet, buffer_s16);
		var player_xscale =	buffer_read(packet, buffer_f16);
		var player_spr =	buffer_read(packet, buffer_u16);
		var player_ind =	buffer_read(packet, buffer_u16);
		var player_user =	buffer_read(packet, buffer_string);
		var player_pal =	buffer_read(packet, buffer_u8);
		var player_palspr =	buffer_read(packet, buffer_u16);
		var player_room =	buffer_read(packet, buffer_s8);
		var player_stars =	buffer_read(packet, buffer_s8);
		
		//If there is no player with that ID in our map, then create one and add it to the map
		if (is_undefined(find_player)) {
			var p = instance_create_layer(0, 0, "Instances", oOtherplayer);
			ds_map_add(instances, player_id, p);
		} else {	//If the player IS in the instance map, then assign them the data if their ID matches the packet's
			if (idd != player_id) && (instance_exists(find_player)) {

				//Assign this data to the correct player
				find_player.x =				player_x;
				find_player.y =				player_y;
				find_player.image_xscale =	player_xscale;
				find_player.sprite_index =	player_spr;
				find_player.image_index =	player_ind;
				find_player.username =		player_user;
				find_player.palette =		player_pal;
				find_player.palspr =		player_palspr;
				find_player.myroom =		player_room;
				find_player.mystars =		player_stars;
			}
		}
	break;
	#endregion
	
	#region Shooting
	case network.shoot:
		//When we get the packet of someone shooting, we need to read the data and perform a few actions
		//First we need to get the bullet's ID before anything
		var bullet_id = buffer_read(packet, buffer_u16);
		
		//Then we check to see if we shot the bullet or not
		if (idd != bullet_id) {
			//If we didn't shoot the bullet, we can continue reading and assigning the data
			var bullet_x = buffer_read(packet, buffer_s16);
			var bullet_y = buffer_read(packet, buffer_s16);
			var bullet_direction = buffer_read(packet, buffer_s16);
			
			//Now we create an instance of that bullet, and assign the data we just read
			var new_bullet = instance_create_layer(bullet_x, bullet_y, "Instances", oBullet);
			new_bullet.my_id = bullet_id;
			new_bullet.direction = bullet_direction;
		}
	break;
	case network.hostbegin:
		
		var race = buffer_read(packet,buffer_bool);
		var schut = buffer_read(packet,buffer_bool);
		var rtx = buffer_read(packet,buffer_bool);
		var arenaindex = buffer_read(packet,buffer_s8);
	
		global.race = race;
		global.rtxmode = rtx;
		global.schutmode = schut;
		global.arena = arenaindex
		
		if global.arena = 0
		{room_goto(rm1_1);}
		else
		{room_goto(asset_get_index("rmArena_"+string(global.arena-1)));}
	
	break;
	#endregion
	
	#region Chat
	case network.chat:
		//Read the message from the packet
		var msg = buffer_read(packet, buffer_string);
		
		//Now we need to add that string to the chat list
		
		ds_list_add(global.CHAT, msg);
		
	break;
	#endregion
	
	#region Disconnect
	case network.disconnect:
		//read the ID of the player to disconnect
		var disconnect_id = buffer_read(packet, buffer_u16);
		var user = buffer_read(packet, buffer_string);
		
		//find the instance that corresponds to that ID
		var disconnect_player = ds_map_find_value(instances, disconnect_id);
		
		//if that player exists, find and destroy them for all clients
		if (disconnect_id != idd) {
			if (!is_undefined(disconnect_player)) {
				//destroy the player disconnecting
				with (disconnect_player) { instance_destroy(); }	
				
				//display in chat that they left the game
				ds_list_add(global.CHAT, user + " left.");
			}
		} else {
			show_message("disconnected")
			game_end();
		}
	break;
	case network.sendraceresult:
	
		var realcounter =	buffer_read(packet, buffer_u16);
		var stringtime =	buffer_read(packet, buffer_string);
		var username =		buffer_read(packet, buffer_string);
		
		
		global.racepos[# 0,ds_grid_height(global.racepos)-1] = realcounter;
		global.racepos[# 1,ds_grid_height(global.racepos)-1] = stringtime;
		global.racepos[# 2,ds_grid_height(global.racepos)-1] = username;
		ds_grid_resize(global.racepos,3,ds_grid_height(global.racepos)+1)
		
		
		if instance_exists(oRacemanager)
		{
			oRacemanager.alarm[2] = room_speed*10
			oRacemanager.endcounter = room_speed*10
		}
		
	
	break;
	
	
	#endregion

}
