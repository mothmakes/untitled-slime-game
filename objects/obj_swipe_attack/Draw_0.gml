/// @description Insert description here
// You can write your code in this editor

if(image_index == image_number - 1) {
	if(instance_exists(parent)) parent.attacking = false;
	if(parent.object_index == obj_player) {
		var _num = instance_place_list(x, y, obj_enemy, enemyList, false);
		if(_num>0) {
			//damage enemies
			for(var i=0;i<_num;i++) {
				sdm("hit enemies!");
				damageEntity(parent,enemyList[| i]);
			}
		}
	} else {
		if(place_meeting(x,y,obj_player)) {
			//damage players
			sdm("hit player!");
		}
	}
	instance_destroy(id);
}

draw_self();