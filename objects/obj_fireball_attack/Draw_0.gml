/// @description Insert description here
// You can write your code in this editor

if(dir == DIRS.LEFT) hsp = -ATTACK_SPEED_STEGO;
else if(dir == DIRS.RIGHT) hsp = ATTACK_SPEED_STEGO;
else if(dir == DIRS.UP) vsp = -ATTACK_SPEED_STEGO;
else vsp = ATTACK_SPEED_STEGO;

timer = current_time;

if(current_time - startTime > 750) {
	if(instance_exists(parent)) parent.attacking = false;
	instance_destroy(id);
}

if(instance_exists(parent) && parent.object_index == obj_player) {
	var _num = instance_place_list(x, y, obj_enemy, enemyList, false);
	if(_num>0) {
		//damage enemies
		for(var i=0;i<_num;i++) {
			sdm("hit enemies!");
				
			if(ds_list_find_index(hitList, enemyList[| i]) == -1 && instance_exists(enemyList[| i]))
			{
				damageEntity(parent,enemyList[| i]);
				ds_list_add(hitList, enemyList[| i]);
			}
		}
	}
} else {
	if(canAttack && instance_exists(parent)) {
		if(place_meeting(x,y,obj_player)) {
			//damage players
			sdm("hit player!");
			if(object_exists(obj_player))damageEntity(parent,obj_player.id);
			
			canAttack = false;
		}
	}
}

x += hsp;
y += vsp;

draw_self();
