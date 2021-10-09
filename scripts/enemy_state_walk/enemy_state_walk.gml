// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_walk(){
	
	if (vsp > 0) {
			image_index = 3
	}
	
		if (vsp < 0) {
		
			image_index = 4
	}
	
		if ( hsp != 0) {
			image_index = 1
	}
	
		if (vsp	&& hsp = 0) {
			state_switch(enemy_state_idle())
	}
}