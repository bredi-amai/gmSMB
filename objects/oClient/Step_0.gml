/// @description Latency and Timeout
Player = oMario


//Send over the current time to the server
var lbuff = buffer_create(32, buffer_grow, 1);
buffer_seek(lbuff, buffer_seek_start, 0);
buffer_write(lbuff, buffer_u8, network.latency);
buffer_write(lbuff, buffer_u32, current_time);
network_send_packet(client, lbuff, buffer_tell(lbuff));

//Check to see if the player has timed-out
timeout ++;		//increment the timeout, so it can be reset in the latency packet

//If timeout wasnt reset in 3 seconds, disconnect and return to menu
if (timeout > room_speed*3) {
	disconnecttt();
	show_message("Disconnected (Time-out)")
	global.insertclient = false;
	room_goto(rmTitle)
	//game_restart();
}


if room = rmTitle
{
	disconnecttt()
	instance_destroy();
	
}