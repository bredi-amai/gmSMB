
vspd += 0.3;

if place_meeting(x+hspd,y,oCol) && round(hspd) > 0
{hspd = -(hspd/2);}
if place_meeting(x,y+vspd,oCol) && round(vspd) > 0
{vspd = -(vspd/2);}

if place_meeting(x,y,oCol)
{hspd = 0; vspd = 0;}

image_angle += hspd*2

x += hspd
y += vspd




