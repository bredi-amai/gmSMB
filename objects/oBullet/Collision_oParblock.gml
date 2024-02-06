if other.object_index = oBrickblock
{other.triggerbreak = true;}
else
{
	if other.blockstate = 0 
	{other.blockstate = 1;}
	else
	{instance_destroy(other);}
}

instance_destroy()




