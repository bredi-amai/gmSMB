image_angle = direction


if !onview()
{instance_destroy();}

if place_meeting(bbox_left,y,oCol) && place_meeting(bbox_right,y,oCol)
	&& place_meeting(x,bbox_top,oCol) && place_meeting(x,bbox_bottom,oCol)
{
	instance_destroy()
}
