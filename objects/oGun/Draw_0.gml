if global.schutmode = false && can = true
{instance_destroy();}

var mdir = point_direction(x,y,mouse_x,mouse_y);
var lenx = lengthdir_x(5,mdir);	var leny = lengthdir_y(5,mdir);


if instance_exists(oMario)
{
	x = oMario.x;
	y = oMario.bbox_top+4;
	face  = sign(oMario.image_xscale)
}
	
if image_index >= sprite_get_number(sprite_index)-1
{
	image_index = 0;
	image_speed = 0;
}

if mouse_check_button(mb_left) && image_index = 0
{
	if instance_exists(oMario) && oMario.state != ps.flagpoledescend && oMario.state != ps.flagpolefinish
		 && oMario.state != ps.castleending
	{
		var lx = lengthdir_x(1,mdir); var ly = lengthdir_y(2,mdir);
		oMario.hspd -= lx;
		oMario.vspd -= ly;
	}
	image_speed = imgspd*4;
	audio_stop_sound(sndGunshot)
	audio_play_sound(sndGunshot,0,0,global.volsfx);
	instance_create_depth(x,y,depth,oBullet).direction = mdir
	var bd = instance_create_depth(x,y,depth,oBulletdropped)
	bd.direction = mdir
	bd.hspd = -face*5
}

	

draw_sprite_ext(sprite_index,image_index,x+lenx,y+3+leny,1,face,mdir,-1,image_alpha)


