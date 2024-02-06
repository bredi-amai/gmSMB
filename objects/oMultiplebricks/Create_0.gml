for(var i = 0; i < image_xscale; i ++;)
{
	for(var j = 0; j < image_yscale; j ++;)
	{
		instance_create_depth(x+(i*16),y+(j*16),depth,oBrickblock);
	}
	
}

instance_destroy()