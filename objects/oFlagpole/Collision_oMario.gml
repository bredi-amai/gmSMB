if other.x >= bbox_left+8 && other.state != ps.flagpoledescend && other.state != ps.flagpolefinish
	&& other.finishedrace = false
{
	other.state = ps.flagpoledescend

	
	other.x = bbox_left+8;
	audio_stop_all();
	
	other.finishedrace = true
	
	sfx(sndFlagpole,0);
	
	if instance_exists(oFlag)
	{instance_nearest(x,y,oFlag).down = true}
	
	//bgm(-1,0)
	
	
	var amnt = 0;
	var top = bbox_top+16;
	var butt = other.bbox_bottom
	var d = 16
	
	amnt = 100;
	if butt<=top+(d*8) {amnt = 200;}
	if butt<=top+(d*7) {amnt = 400;}
	if butt<=top+(d*6) {amnt = 500;}
	if butt<=top+(d*5) {amnt = 800;}
	if butt<=top+(d*4) {amnt = 1000;}
	if butt<=top+(d*3) {amnt = 2000;}
	if butt<=top+(d*2) {amnt = 2000;}
	if butt<=top+(d*1) {amnt = 5000;}

	
	
	
	var p = instance_create_depth((bbox_right+4),bbox_bottom-16,-9999,oPoints)
	p.isfinal = true;
	
	
	var ind = 0
	switch(amnt)
	{
		case 100: ind = 1; break;
		case 200: ind = 2; break;
		case 400: ind = 3; break;
		case 500: ind = 4; break;
		case 800: ind = 5; break;
		case 1000: ind = 6; break;
		case 2000: ind = 7; break;
		case 4000: ind = 8; break;
		case 5000: ind = 9; break;
	}
	if ind != 0
	{
		global.score += amnt;
		p.image_index = ind;
	}
}






