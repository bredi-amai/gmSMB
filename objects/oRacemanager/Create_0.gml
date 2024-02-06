
myracetime = 0;

counter = 0;

minutes = 0;
seconds = 0;
milliseconds = 0


minutecounter = 0;


showresults = false;

start = 0;
alarm[0] = 1;

racemusic = -1;

endcounter = -1

if ds_grid_height(global.racepos) > 1
{
	ds_grid_destroy(global.racepos)
	global.racepos = ds_grid_create(3,1);
}

fx = 0