// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_dead(){
	image_blend = c_dkgrey;
	if(state_timer > room_speed * DEATH_TIME) {
		instance_destroy(id);	
	}
}