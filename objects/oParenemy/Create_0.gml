hspd = 0;
vspd = 0;

maxhspd = 0.5;

grounded = false;
facingdir = -1

stomptype = 0; //squish, shell, cant be squished
stomptimer = 50;

shellcooldown = 0;

dieface = 1;

enum es
{
	patrol,
	stomp,
	shell,
	shellhit,
	die,
	patrolwinged,
	frozen
}

state = es.patrol
if !instance_exists(oIsArena)
{state = es.frozen}



