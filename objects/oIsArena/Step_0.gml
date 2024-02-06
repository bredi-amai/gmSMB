

if arenarespawn = 0
{
	with(oParblock)
	{
		instance_create_depth(x,y,depth-10,object_index);
		
		var b = instance_create_depth(x,y,depth,oBLAST);
		b.image_xscale = 0.4;
		b.image_yscale = 0.4;
		
		instance_destroy();
	}
	
	arenarespawn = room_speed*15;
}
if arenarespawn > 0
{arenarespawn --;}







