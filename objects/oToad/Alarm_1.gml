if modernmode = false	{var t = instance_create_depth(bopiix,bopiiy,depth,oText); t.center = false;}
else	{var t = instance_create_depth(camera_get_view_x(view_camera[0])+SCREENW/2,bopiiy,depth,oText);}
t.text = "BUT OUR PRINCESS IS IN"


if modernmode = false	{var t = instance_create_depth(acx,acy,depth,oText); t.center = false;}
else	{var t = instance_create_depth(camera_get_view_x(view_camera[0])+SCREENW/2,acy,depth,oText);}
t.text = "ANOTHER CASTLE!"


alarm[2] = interval*4