/// @description Insert description here
// You can write your code in this editor


if(image_index == 0) {
	if(instance_exists(parent) && parent.object_index == obj_player) {
		var _num = instance_place_list(x, y, obj_enemy, enemyList, false);
		if(_num>0) {
			//damage enemies
			for(var i=0;i<_num;i++) {
				//sdm("hit enemies!");
				if(instance_exists(enemyList[| i])) damageEntity(parent,enemyList[| i]);
			}
		}
	} else if (instance_exists(parent)) {
		if(place_meeting(x,y,obj_player)) {
			//damage players
			//sdm("hit player!");
			if(object_exists(obj_player)) damageEntity(parent,obj_player.id);
		}
	}
}

draw_self();