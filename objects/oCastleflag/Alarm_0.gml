if fireworks > 0
{
	fireworks -= 1;
	
	var xx = x+choose(-48,-32,-16,0,16,32,48)
	var yy = y-choose(32,48,64);
	global.score += 500;
	instance_create_depth(xx,yy,0,oFireworks)
	
	alarm[0] = 40;
}






