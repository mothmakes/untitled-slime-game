// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_idle(){
	image_index = 1;
	
	if(los && distance_to_object(obj_player) <= attack_range && attack_enabled) {
		alarm[1] = room_speed * attack_delay;
		state_switch("Attack");
	}
	
	if (vsp != 0 || hsp != 0) {
		state_switch("walk");	
	}

}