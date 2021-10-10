/// @description Insert description here
// You can write your code in this editor

if(dir == DIRS.LEFT) hsp = -3;
else if(dir == DIRS.RIGHT) hsp = 3;
else if(dir == DIRS.UP) vsp = -3;
else vsp = 3;

timer = current_time;

if(current_time - startTime > 750) {
	if(instance_exists(parent)) parent.attacking = false;
	instance_destroy(id);
}

if(parent.object_index == obj_player) {
	var _num = instance_place_list(x, y, obj_enemy, enemyList, false);
	if(_num>0) {
		//damage enemies
		for(var i=0;i<_num;i++) {
			sdm("hit enemies!");
			damageEntity(parent,enemyList[| i]);
			
			// Destroy fireball after one hit.
			if(instance_exists(parent)) parent.attacking = false;
			instance_destroy(id);
		}
	}
} else {
	if(place_meeting(x,y,obj_player)) {
		//damage players
		sdm("hit player!");
		damageEntity(parent,obj_player.id);
			
		// Destroy fireball after one hit.
		if(instance_exists(parent)) parent.attacking = false;
		instance_destroy(id);
	}
}

x += hsp;
y += vsp;

draw_self();
