/// @description Initialize Discord.

#macro DISCORD_APP_ID "1127940823883989052"

ready = false;

alarm[0] = room_speed * 5;

alarm[1] = room_speed * 10;

if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}


envspr = "ow"
where = "waiting..."