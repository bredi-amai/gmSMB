hspd = 0;
vspd = 0;
grounded = false;
collidecode = false;

global.stars = 0;

my_id = global.clientid

enum ps
{
	normal,
	jump,
	pivot,
	die,
	enterpipedown,
	enterpiperight,
	exitpipeup,
	crouch,
	grow,
	shrink,
	flagpoledescend,
	flagpolefinish,
	firetransform,
	castleending,
	swim,
	swimidle,
	shoulderbash,
	shoulderbashend,
	climb,
	emerge,
	dance0,
	title
}

state = ps.normal
if room = rmTitle
{state = ps.title;}

powerup = "s"
if instance_exists(oGame)
{powerup = oGame.savedpowerup;}


palindex = global.paletteindex

spr =  ms("sMario_{}_idle");
ind = 0;

scale = 1

yoff = 0;

holdjump = -1
jumpbuffer = 0;
releasedrunmidjump = false;
gethit = 0;
invincible = 0;
dietimer = 0;
flagpoletimer = 0;
crouch = false;
firetimer = 0;
starman = 0;
castleendingtrigger = false;
shoulderbash = 0;
climb = 0;

starman = 0;

pipeinforoom = rm1_1

finishedrace = false;


if !place_meeting(x,y+1,oCol)
{spr = ms("sMario_{}_walk");}



if instance_exists(oBeanstalk) && instance_nearest(x,y,oBeanstalk).emerge = true && distance_to_object(instance_nearest(x,y,oBeanstalk)) <= 32
{state = ps.emerge; depth = instance_nearest(x,y,oBeanstalk).depth-10; x = instance_nearest(x,y,oBeanstalk).x+8; y = room_height+16; }