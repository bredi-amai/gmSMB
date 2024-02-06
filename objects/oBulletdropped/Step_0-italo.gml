
vspd += 0.3;

if place_meeting(x+hspd,y,oCol)
{hspd = -(hspd/2);}
if place_meeting(x,y+vspd,oCol)
{vspd = -(vspd/2);}
if place_meeting(x,y,oCol)
{vspd = 0; hspd = 0;}

image_angle += hspd*2

x += hspd
y += vspd




