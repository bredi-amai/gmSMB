event_inherited()

grounded = false;

pufunc = function()
{
	instance_place(x,y,oMario).state = ps.grow;
	points(1000,true);
	instance_destroy();
}

face = 1;