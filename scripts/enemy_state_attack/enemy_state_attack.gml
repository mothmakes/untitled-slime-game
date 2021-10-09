// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function enemy_state_attack(){
	if(state_new) {
		attacking = true;
		attack_charging = true;
	}
	if(!attack_charging) image_index = 5;
	else image_index = 6;
	if(!attacking) {
		attack_enabled = false;
		alarm[0] = room_speed * attack_cooldown;
		state_switch("walk");
	}
}