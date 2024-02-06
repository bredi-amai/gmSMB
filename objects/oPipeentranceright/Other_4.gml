if activated = true && room = troom
{
	if instance_exists(oMario) && instance_exists(oPipeexit)
	{
		var me = id
		var iid = -1
		with(oPipeexit)
		{
			if num = me.num
			{iid = id;}
		}
		
		if iid != -1 && num != -1
		{
			oMario.x = iid.x;
			oMario.y = iid.bbox_bottom;
			oMario.state = ps.exitpipeup;
		}
	}
}

if room != bornroom 
{instance_destroy();}







