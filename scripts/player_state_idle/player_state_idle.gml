// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_idle(){
	if(abs(vsp) > abs(hsp)) {
		if(vsp>0) dir = DIRS.DOWN;
		if(vsp<0) dir = DIRS.UP;
	} else {
		if(hsp>0) dir = DIRS.RIGHT;
		if(hsp<0) dir = DIRS.LEFT;
	}
	
	switch(inhabiting)
	{
		case obj_stegosaurus:
			if(dir == DIRS.UP) image_index = 6;
			else if(dir == DIRS.DOWN) image_index = 3;
			else if(dir == DIRS.LEFT) image_index = 0;
			else image_index = 9;
			break;
		default:
			image_index = 0;
			break;
	}
	
	//image_index = 0;
	
	attemptTakeover();
	//sdm("Player")
	//sdm(x)
	
	if(mouse_left_pressed) state_switch("Attack");
	if(key_left || key_right || key_down || key_up) {
		state_switch("Walk");
	}
	
}