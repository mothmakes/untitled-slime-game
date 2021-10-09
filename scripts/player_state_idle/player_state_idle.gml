// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_idle(){
	image_index = 0;
	
	attemptTakeover();
	//sdm("Player")
	//sdm(x)
	
	if(mouse_left_pressed) state_switch("Attack");
	if(key_left || key_right || key_down || key_up) {
		state_switch("Walk");
	}
	
}