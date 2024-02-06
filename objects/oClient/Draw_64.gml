/// @description Draw Latency

//draw_text(room_width/2+64, 16, "Ping: " + string(latency));
draw_set_font(FNT);
//draw_text(16, 10, " - CONNECTED");
draw_text(16, 24, "PING -  " + string(latency));



draw_set_font(fntComicsmall)

if keyboard_check_pressed(vk_tab)
{
	global.chatfocus = !global.chatfocus;
	text = "";
	keyboard_string = "";
}

var maxchar = 32

if (global.chatfocus = true)
{
	if string_length(text) < maxchar
	{
		text = keyboard_string;
	}
	
	//If the user presses enter to send the chat:
	if keyboard_check_released(vk_enter)
	{
		//Create a buffer (packet) to send to the server	
		var text_buff = buffer_create(32, buffer_grow, 1);
		buffer_seek(text_buff, buffer_seek_start, 0);
		buffer_write(text_buff, buffer_u8, network.chat);
		buffer_write(text_buff, buffer_string, "[" + global.username + "]: " + string(text));
		
		network_send_packet(client, text_buff, buffer_tell(text_buff));
		
		//Delete the buffer
		buffer_delete(text_buff);
		

		
		//Reset the text back to nothing, and exit the chat
		text = "";
		keyboard_string = "";
		global.chatfocus = !global.chatfocus;
		
	}
}
	
	
	
/// @description Draw the Chat

//Draw the input box and text
var chatx = SCREENW/2+24
var chaty = SCREENH/2+48

if (global.chatfocus)
{
	draw_set_color(c_black)
	draw_set_alpha(0.5)
	draw_rectangle(chatx-2, chaty-2, SCREENW+2, SCREENH,false)
	draw_set_color(-1)
	draw_set_alpha(1)
	draw_rectangle(chatx, chaty, SCREENW-8, SCREENH/2+48+8, true);
	draw_text(chatx+2, chaty, string(text) + "_");
}
else
{
	draw_set_color(c_black)
	draw_set_alpha(0.1)
	draw_rectangle(chatx-2, chaty-2, SCREENW+2, SCREENH,false)
	draw_set_color(-1)
	draw_set_alpha(1)
	draw_set_alpha(0.5)
	draw_text(chatx+2, chaty, "Press TAB to chat.");
	draw_set_alpha(1);
}



//Draw messages from the chat
var yy = chaty;

//Loop through the list and draw the messages
for (var i = ds_list_size(global.CHAT); i >= 0; i--)
{
	if is_string(global.CHAT[| i])
	{
		draw_text_ext(chatx+2,yy,global.CHAT[| i],-1,99999);
	}
	
	yy += 16;
}


//Control how many messages are stored in the chat at once
while (ds_list_size(global.CHAT) > 6) {
	ds_list_delete(global.CHAT, 0);	//Delete the message that was sent the longest ago
}

draw_set_font(-1);
/*


draw_set_font(fntComicsmall)

if keyboard_check_pressed(vk_tab)
{global.chatfocus = !global.chatfocus;}

var maxchar = 150

if (global.chatfocus) {
	text = keyboard_string;		//set our text variable to be whatever the user types
	
	//If the user presses enter to send the chat:
	if (keyboard_check_released(vk_enter) && string_length(text) < maxchar) {
		
		//Create a buffer (packet) to send to the server	
		var text_buff = buffer_create(32, buffer_grow, 1);
		buffer_seek(text_buff, buffer_seek_start, 0);
		buffer_write(text_buff, buffer_u8, network.chat);
		buffer_write(text_buff, buffer_string, "[" + global.username + "]: " + string(text));
		
		network_send_packet(client, text_buff, buffer_tell(text_buff));
		
		//Delete the buffer
		buffer_delete(text_buff);
		
		//Reset the text back to nothing, and exit the chat
		text = "";
		keyboard_string = "";
		global.chatfocus = !global.chatfocus;
		
	}
	
	
	
	
	/// @description Draw the Chat

	//Draw the input box and text
	if (global.chatfocus) {

		draw_rectangle(8, room_height/2-32, SCREENW-8, room_height/2-16, true);
		draw_text(10, room_height/2-32, string(text) + "_");
	} else {
		draw_set_alpha(0.5)
		draw_text(8, room_height/2-32, "Press TAB to chat.");
		draw_set_alpha(1);
	}

	//Draw messages from the chat
	var yy = 64;

	//Loop through the list and draw the messages
	for (var i = 0; i < ds_list_size(global.CHAT); i++) {
		draw_text_ext(16, yy, ds_list_find_value(global.CHAT, i), -1, maxchar);
		yy += 16;
	}

}

//Control how many messages are stored in the chat at once
while (ds_list_size(global.CHAT) > 6) {
	ds_list_delete(global.CHAT, 0);	//Delete the message that was sent the longest ago
}

draw_set_font(-1);