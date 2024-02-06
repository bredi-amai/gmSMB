
if isfinal = false
{draw_sprite(sprite_index,image_index,x,y)}




if isfinal = false
{y -= 1;}

if (isfinal = true && instance_exists(oFlagpole) && y > oFlagpole.bbox_top+32)
{y -= 2;}