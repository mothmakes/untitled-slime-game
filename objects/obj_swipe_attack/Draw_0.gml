/// @description Insert description here
// You can write your code in this editor

if(image_index == image_number - 1) {
	parent.attacking = false;
	if(parent.object_index == obj_player) {
		if(place_meeting(x,y,obj_enemy)) {
			//damage enemies
			sdm("hit enemy!");
		}
	} else {
		if(place_meeting(x,y,obj_player)) {
			//damage players
		}
	}
	instance_destroy(id);
}

draw_self();