// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_idle(){
	image_index = 1;
	
	if (vsp != 0 || hsp != 0) {
		state_switch("walk");	
	}

}