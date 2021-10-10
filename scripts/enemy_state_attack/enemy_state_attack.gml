// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_attack(){
	if(state_new) {
		attacking = true;
		attack_charging = true;
	}
	
	if(abs(vsp) > abs(hsp)) {
		if(vsp>0) dir = DIRS.DOWN;
		if(vsp<0) dir = DIRS.UP;
	} else {
		if(hsp>0) dir = DIRS.RIGHT;
		if(hsp<0) dir = DIRS.LEFT;
	}
	
	switch(object_index)
	{
		case obj_skeleton:
			if(!attack_charging) image_index = 5;
			else image_index = 6;
			break;
		case obj_stegosaurus:
			if(attack_charging)
			{
				if(dir == DIRS.LEFT) image_index = 12;
				else if(dir == DIRS.DOWN) image_index = 13;
				else if(dir == DIRS.UP) image_index = 14;
				else image_index = 15;
			}
			break;
	}
	
	if(!attacking) {
		attack_enabled = false;
		alarm[0] = room_speed * attack_cooldown;
		state_switch("walk");
	}
}