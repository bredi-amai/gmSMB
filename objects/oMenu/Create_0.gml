menu = ds_grid_create(10,8)
optionsnum = array_create(9,0)

playwillsendmetothisroom = rm1_1

section = 0;
sel = 0;

addmenu = function(sec,pos,label)
{
	menu[# sec,pos] = label
	optionsnum[sec] += 1;
}

addmenu(0,0,"1 PLAYER GAME")
addmenu(0,1,"NETWORK GAME")
addmenu(0,2,"OPTION")

addmenu(1,0,"JOIN")
addmenu(1,1,"HOST")
addmenu(1,2,"BACK")

addmenu(2,0,"CUSTOMIZE")
addmenu(2,1,"VIDEO")
addmenu(2,2,"AUDIO")
addmenu(2,3,"CONTROLS")
addmenu(2,4,"BACK")

addmenu(3,0,"PLAYER - ")
addmenu(3,1,"PALETTE - ")
addmenu(3,2,"BACK")

addmenu(4,0,"USERNAME - ")
addmenu(4,1,"SET IP - ")
addmenu(4,2,"SET PORT - ")
addmenu(4,3,"JOIN GAME")
addmenu(4,4,"BACK")

addmenu(5,0,"SET PORT - ")
addmenu(5,1,"MAX PLAYERS - ")
addmenu(5,2,"HOST GAME")
addmenu(5,3,"BACK")

addmenu(6,0,"SOUND MODE - ")
addmenu(6,1,"SFX")
addmenu(6,2,"BGM")
addmenu(6,3,"BACK")

addmenu(7,0,"TOGGLE FULLSCREEN")
addmenu(7,1,"RESET WINDOW")
addmenu(7,2,"HIDE - SHOW DISCORD PFP")
addmenu(7,3,"BACK")

addmenu(8,0,"UP")
addmenu(8,1,"DOWN")
addmenu(8,2,"LEFT")
addmenu(8,3,"RIGHT")
addmenu(8,4,"ACTION")
addmenu(8,5,"JUMP")
addmenu(8,6,"BACK")

playerlist = ds_list_create();
creatorlist = ds_list_create();

addplist = function(name,creator)
{
	ds_list_add(playerlist,name);
	ds_list_add(creatorlist,creator);
}

addplist("Mario","nintendo")
addplist("Luigi","bredi")
addplist("Toad","nintendo")
addplist("Wario","sans1m0n")
addplist("Goomba","seven")
addplist("Martin","seven")
addplist("Peter","seven")
addplist("Anton","summitsphere")
addplist("Peter Griffin",".")
addplist("Bredi","bredi")
addplist("Goober","toasterman")
addplist("Iris","MadNyle")
addplist("Owen","owen")
addplist("Seven","seven")
addplist("SucculentKicker","dermo")
addplist("Goldron","goldron")





gamemodes = ds_list_create();
ds_list_add(gamemodes, "CLASSIC");
ds_list_add(gamemodes, "RACE");
ds_list_add(gamemodes, "VERSUS");

additions = ds_list_create();
ds_list_add(additions, "NONE");
ds_list_add(additions, "GUNS");
ds_list_add(additions, "DARKMODE");
ds_list_add(additions, "VERSUS");



waitforcontrol = 0
settingkey = global.keyu
setcontrol = function(whichglobalvarname)
{
	waitforcontrol = 60*5;
	settingkey = whichglobalvarname;
}


updtplayerpalette = function()
{
	if sprite_exists(asset_get_index("sPalette_"+string_lower(global.player)))
	{
		if global.player = "Goomba"	{global.palettesprite = asset_get_index("sPalette_goombaplayer");}
		else	{global.palettesprite = asset_get_index("sPalette_"+string_lower(global.player));}
	}
	else
	{global.palettesprite = sPalette_mario;}
}


marioxs = 0;
marioys = 0;

curplayersel = 0;

depth = -9999

