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
	
	if (vsp > 0) {
			image_index = 3
	}
	
		if (vsp < 0) {
			image_index = 4
	}
	
		if (hsp != 0) {
			image_index = 1
	}
	
		if (vsp	&& hsp = 0) {
			state_switch("idle")
	}
	
	x += hsp;
	y += vsp;
	
	if(los && distance_to_object(obj_player) <= attack_range && attack_enabled) {
		state_switch("Attack");
	}
}