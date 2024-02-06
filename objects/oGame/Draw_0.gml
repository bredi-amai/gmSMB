
depth = dep;


// handle tile palette
var tbr = layer_get_id("Tiles_brown")
if layer_exists(tbr)
{layer_script_begin(tbr,tile_brownpalswap);	layer_script_end(tbr,tile_palreset);  dep = layer_get_depth(tbr)-1}
var tgr = layer_get_id("Tiles_green")
if layer_exists(tgr)
{layer_script_begin(tgr,tile_greenpalswap);	layer_script_end(tgr,tile_palreset);}
var tbl = layer_get_id("Tiles_blue")
if layer_exists(tbl)
{layer_script_begin(tbl,tile_bluepalswap);	layer_script_end(tbl,tile_palreset);}
var tbg = layer_get_id("Background")
if layer_exists(tbg)
{layer_script_begin(tbg,bg_palswap);	layer_script_end(tbg,tile_palreset);}


if room = rmServer
{exit;}



/// handle gui
draw_set_font(FNT)

var cx = camera_get_view_x(view_camera[0])
var cy = camera_get_view_y(view_camera[0])

// MARIO
var tile = 8;
draw_text((tile*2)+tile+cx,tile+cy,string_upper(global.player))


// Score
var scorestr = string(global.score)		while (string_length(scorestr) < 6)	{scorestr = "0"+scorestr;}
draw_text((tile*2)+tile+cx,tile+tile+cy,scorestr)

// Coins
shader_set(shdColorswap);
	apply_palette(sPalette_gold,global.environment+1,image_alpha)
	draw_sprite(sCoinicon,image_index,tile+(tile*10)+cx,tile+tile+cy)
shader_reset();

var coinstr = string(global.coins)		while (string_length(coinstr) < 2)	{coinstr = "0"+coinstr;}
draw_text((tile*2)+(tile*10)+cx,tile+tile+cy,"*"+coinstr)

// WORLD
//draw_text((SCREENW/2)+(tile*2)+cx,cy+tile,"WORLD")
//draw_text((SCREENW/2)+(tile*2)+tile+cx,cy+tile+tile,"1-"+string(global.level))

if !instance_exists(oIsArena) && room != rmTitle && room != rmLobby
{
	draw_text((SCREENW-(256/2))+(tile*2)+cx,cy+tile,"WORLD")
	if global.level != 0 
	{draw_text((SCREENW-(256/2))+(tile*2)+tile+cx,cy+tile+tile,string(global.world)+"-"+string(global.level))}
}
if instance_exists(oIsArena)
{
	draw_text((SCREENW-(256/2))+(tile*2)+cx,cy+tile,"GOAL")
	{draw_text((SCREENW-(256/2))+(tile*2)+tile+cx,cy+tile+tile,global.goalofstars)}
}

// Time
//draw_text((SCREENW/2)+(tile*2)+(tile*7)+cx,cy+tile,"TIME")
draw_text((SCREENW-(256/2))+(tile*2)+(tile*7)+cx,cy+tile,"TIME")

if global.time >= 0
{
	var timestr = string(round(global.time/(room_speed*TIMESEC)))		while (string_length(timestr) < 3)	{timestr = "0"+timestr;}
	//draw_text((SCREENW/2)+(tile*2)+(tile*8)+cx,cy+tile+tile,timestr)
	draw_text((SCREENW-(256/2))+(tile*2)+(tile*8)+cx,cy+tile+tile,timestr)


	if instance_exists(oRacemanager) && global.race = true
	{
		var mm = string(oRacemanager.minutes);
		var ss = string(oRacemanager.seconds);
		var mls = string(oRacemanager.milliseconds);
		
		
		while (string_length(mm) < 2)	{mm = "0"+mm;}
		while (string_length(ss) < 2)	{ss = "0"+ss;}
		while (string_length(mls) < 3)	{mls = "0"+mls;}
		
		timestr = mm+":"+ss+":"+mls;
		
		draw_set_halign(fa_right);
		//draw_text((SCREENW/2)+(tile*2)+(tile*11)+cx,cy+tile+tile*2,timestr)
		draw_text((SCREENW-(256/2))+(tile*2)+(tile*11)+cx,cy+tile+tile*2,timestr)
		draw_set_halign(fa_left);
	}
}




if global.race = true && instance_exists(oRacemanager)
{
	draw_set_font(fntComic)
	
	var relist = ds_grid_create(ds_grid_width(global.racepos),ds_grid_height(global.racepos))
	
	ds_grid_copy(relist,global.racepos)
	
	ds_grid_sort(relist,0,true);
		
	for (var i = 0; i < ds_grid_height(relist); i++;)
	{
		if relist[# 0,i] > 0
		{
			if i = 1		{draw_set_color(c_yellow);}
			else if i = 2	{draw_set_color(c_ltgrey);}
			else if i = 3	{draw_set_color(c_maroon);}
			else			{draw_set_color(c_white);}
			
			var timestr = string(relist[# 1,i])
			draw_set_font(fntComic)
			draw_text(cx+(tile*2),cy+tile*3+tile*3+(16*i),timestr + " - " + string(relist[# 2,i]))
		}
	}
	draw_set_font(-1);
	draw_set_color(-1);
	
	ds_grid_destroy(relist);
}





draw_set_font(-1);

