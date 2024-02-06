
function disconnecttt() {
	if (instance_exists(oClient)) {
		
		if (instance_exists(oClient.Player)) {
			
			var dis_buff = buffer_create(32, buffer_grow, 1);
			buffer_seek(dis_buff, buffer_seek_start, 0);
			buffer_write(dis_buff, buffer_u8, network.disconnect);
			buffer_write(dis_buff, buffer_u16, oClient.Player.my_id);
			buffer_write(dis_buff, buffer_string, global.username);
			network_send_packet(oClient.client, dis_buff, buffer_tell(dis_buff));
			buffer_delete(dis_buff);
			
		} else {
			show_message("theres no playr****");	
		}
		
	} else {
		show_message("client does not exist*");	
	}
}
