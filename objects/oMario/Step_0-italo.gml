kr = keyboard_check(ord("D"))
kl = keyboard_check(ord("A"))

kj = keyboard_check(ord("L"))
ka = keyboard_check(ord("K"))

kjp = keyboard_check_pressed(ord("L"))
kap = keyboard_check_pressed(ord("K"))

kar = keyboard_check_released(ord("K"))


kdp = keyboard_check_pressed(ord("S"))

if global.rtxmode = true or global.schutmode = true
{
	kj = keyboard_check(vk_space); kjp = keyboard_check_pressed(vk_space);
	ka = keyboard_check(vk_shift); kap = keyboard_check_pressed(vk_shift); kar = keyboard_check_released(vk_shift)
}

if gethit = true
{
	if powerup = "s"
	{state = ps.die;}
}


switch(state)
{
	case ps.normal:
		ps_normal();
	break;
	case ps.jump:
		ps_jump();
	break;
	case ps.pivot:
		ps_pivot();
	break;
	case ps.die:
		ps_die();
	break;
	case ps.enterpipedown:
		ps_enterpipedown();
	break;
}

x = clamp(x,camera_get_view_x(view_camera[0])+8,room_width-8);
y = clamp(y,16,room_height+64);


if global.rtxmode = true or global.schutmode = true
{
	if mouse_x > x
	{image_xscale = 1;}
	else
	{image_xscale = -1;}
}
