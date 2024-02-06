if onview()
{
	var ins = instance_create_depth(x,y,depth-99999,oBLAST)
	
	ins.image_xscale = 0.2
	ins.image_yscale = 0.2
	
	ins.x -= (sprite_width*0.2)/2
	ins.y -= (sprite_height*0.2)/2
}



