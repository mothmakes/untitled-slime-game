// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_idle(){
	image_index = 1;
	sdm(x)
	attemptTakeover();
	
	if(key_left || key_right || key_down || key_up) {
		state_switch("Walk");
	}
	
}