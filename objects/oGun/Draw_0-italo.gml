if global.schutmode = false && can = true
{instance_destroy();}

var mdir = point_direction(x,y,mouse_x,mouse_y);
var lenx = lengthdir_x(5,mdir);	var leny = lengthdir_y(5,mdir);


if instance_exists(oMario)
{
	x = oMario.x;
	y = oMario.y-10;
	face  = sign(oMario.image_xscale)
}
	
if image_index >= sprite_get_number(sprite_index)-1
{
	image_index = 0;
	image_speed = 0;
}

if mouse_check_button(mb_left) && image_index = 0
{
	if instance_exists(oMario) && !oMario.kr
	{oMario.hspd -= lengthdir_x(1,mdir); oMario.vspd -= lengthdir_y(2,mdir);}
	image_speed = imgspd*4;
	audio_stop_sound(sndGunshot)
	audio_play_sound(sndGunshot,1,false);
	instance_create_depth(x,y,depth,oBullet).direction = mdir
	var bd = instance_create_depth(x,y,depth,oBulletdropped)
	bd.direction = mdir
	bd.hspd = -face*5
}

	

draw_sprite_ext(sprite_index,image_index,x+lenx,y+3+leny,1,face,mdir,-1,image_alpha)


