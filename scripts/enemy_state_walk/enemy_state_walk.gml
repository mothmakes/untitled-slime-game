// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_walk(){
	if(abs(vsp) > abs(hsp)) {
		if(vsp>0) dir = DIRS.DOWN;
		if(vsp<0) dir = DIRS.UP;
	} else {
		if(hsp>0) dir = DIRS.RIGHT;
		if(hsp<0) dir = DIRS.LEFT;
	}
	
	// Time offset for animation frames. Should go 0, 1, 0, 2, 0, 1, etc.
	var offset = (current_time / 333) % 4;
	if(offset == 2) offset = 0;
	else if(offset == 3) offset = 2;
	
	switch(object_index)
	{
		case obj_skeleton:
			{
				if (dir == DIRS.UP) image_index = 3;
				if (dir == DIRS.DOWN) image_index = 4;
				if (hsp != 0) image_index = 1;
			}
			break;
		// Stego has more anim frames than skele, so the logic is different.
		case obj_stegosaurus:
			{
				if(dir == DIRS.UP) image_index = 6 + offset;
				else if(dir == DIRS.DOWN) image_index = 3 + offset;
				else if(dir == DIRS.LEFT) image_index = 0 + offset;
				else image_index = 0;
			}
			break;
	}
	
	if(los && distance_to_object(obj_player) <= attack_range && attack_enabled) {
		alarm[1] = room_speed * attack_delay;
		state_switch("Attack");
	}
	
	if (vsp	&& hsp = 0) {
		state_switch("idle")
	}
	
	x += hsp;
	y += vsp;
	
	
}