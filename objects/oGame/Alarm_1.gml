global.level += 1;
room_goto(rmLeveltransition)

if global.level != 0 && global.race = true
{
	if instance_exists(oRacemanager) 
	{instance_destroy(oRacemanager);}
}