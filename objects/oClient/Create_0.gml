/// @description Initialize Client

//Client Variables
port = global.port;
ip = global.ip;

network_set_config(network_config_connect_timeout, 3000);
client = network_create_socket(network_socket_tcp);
network_connect_raw(client, ip, port);

//Create Our Player
instances = ds_map_create();
idd = 0;
Player = oMario//instance_create_layer(random(room_width), random(room_height), "Instances", oMario);
idd = Player.my_id;

ds_map_add(instances, idd, Player);

//Latency and Timeout
latency = 0;
timeout = 0;

//Send a connection buffer to the server
var jbuff = buffer_create(32, buffer_grow, 1);
buffer_seek(jbuff, buffer_seek_start, 0);
buffer_write(jbuff, buffer_u8, network.join);		//Send the join ID
buffer_write(jbuff, buffer_u16, idd);				//send the client's ID
buffer_write(jbuff, buffer_u16, Player);			//send the ID of this client's player
buffer_write(jbuff, buffer_string, global.username);
network_send_packet(client, jbuff, buffer_tell(jbuff));
buffer_delete(jbuff);


//Create the Chat
//instance_create_layer(x, y, "Instances", oChat);


//Display error if unable to connect
if (client < 0) {
	show_message("could not connect to server");
	game_restart();
}



text = ""