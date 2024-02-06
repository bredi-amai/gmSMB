hspd = 0;
vspd = 0;
grounded = false;

enum ps
{
	normal,
	jump,
	pivot,
	die,
	enterpipedown,
	enterpiperight,
	exitpipeup,
}

state = ps.normal

spr = sMario_s_idle;
ind = 0;

holdjump = -1
releasedrunmidjump = false;
gethit = 0;
dietimer = 0;

pipeinforoom = rm1_1
 
powerup = "s"

palindex = 0


if !grounded
{spr = sMario_s_walk; state = ps.jump;}