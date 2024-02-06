if modernmode = false	{var t = instance_create_depth(tymx,tymy,depth,oText); t.center = false;}
else	{var t = instance_create_depth(camera_get_view_x(view_camera[0])+SCREENW/2,tymy,depth,oText);}

t.text = "THANK YOU "+string_upper(global.player)+"!";

alarm[1] = interval
