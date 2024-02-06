/// @desc movement / position / fx
// Set camera position
if instance_exists(oMario)
{
	if freemode = false
	{
		var cx = camera_get_view_x(view_camera[0])
	
		var middle =  cx+(SCREENW/2)-8
		var thresholded =  middle+threshold
	
		if oMario.hspd > 0 && oMario.x+oMario.hspd*2 > thresholded
		{x += oMario.hspd; threshold = 0;}
	
		if oMario.x < middle
		{threshold = 8;}
	}
	else
	{
		x = oMario.x
	}
}


x = clamp(x,SCREENW/2,room_width-SCREENW/2);
y = clamp(y,SCREENH/2,room_height-SCREENH/2);


var cameraposx = x-camera_get_view_width(view_camera[0])/2;
var cameraposy = y-camera_get_view_height(view_camera[0])/2;
camera_set_view_pos(view_camera[0],cameraposx,cameraposy);




/*
    for i in (0,1):
        first_third = self.viewport[i]+self.viewport.size[i]//3
        second_third = first_third+self.viewport.size[i]//3
        player_center = self.player.rect.center[i]
        step = self.viewport[i]
        if self.player.velocity[i] > 0 and player_center >= first_third:
            if player_center < self.viewport.center[i]:
                step = self.viewport[i]+0.5*self.player.velocity[i]
            else:
                step = self.viewport[i]+self.player.velocity[i]
        elif self.player.velocity[i] < 0 and player_center <= second_third:
            if player_center > self.viewport.center[i]:
                step = self.viewport[i]+0.5*self.player.velocity[i]
            else:
                step = self.viewport[i]+self.player.velocity[i]
        low = max(0, step)
        high = self.level_rect.size[i]-self.viewport.size[i]
        self.viewport[i] = min(high, low)