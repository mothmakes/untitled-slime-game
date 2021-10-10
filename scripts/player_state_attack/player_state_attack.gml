// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_attack(){
	if(state_new) {
		attacking = true;
		var _ydir = 0;
		var _xdir = 0;
		switch(dir) {
			case DIRS.UP:
				_ydir = -1
				_xdir = 0;
				break;
			case DIRS.LEFT:
				_ydir = 0;
				_xdir = -1;
				break;
			case DIRS.DOWN:
				_ydir = 1
				_xdir = 0;
				break;
			case DIRS.RIGHT:
				_ydir = 0;
				_xdir = 1;
				break;
		}
		var _spriteMidW = sprite_width/2;
		var _spriteMidH = sprite_height/2;
		switch(inhabiting) {
			case obj_player:
				damage = DAMAGE_PLAYER;
				var attack = instance_create_layer(x+_spriteMidW+(_xdir*ATTACK_DISTANCE_PLAYER),y+_spriteMidH+(_ydir*ATTACK_DISTANCE_PLAYER),"Instances",obj_swipe_attack);
				attack.image_speed *= ATTACK_SPEED_PLAYER;
				break;
			case obj_skeleton:
				damage = DAMAGE_SKELETON;
				var attack = instance_create_layer(x+_spriteMidW+(_xdir*ATTACK_DISTANCE_SKELETON),y+_spriteMidH+(_ydir*ATTACK_DISTANCE_SKELETON),"Instances",obj_swipe_attack);
				//Change to vary on enemy level
				attack.image_speed *= ATTACK_SPEED_SKELETON;
				break;
			case obj_stegosaurus:
				damage = DAMAGE_STEGO;
				var attack = instance_create_layer(x+_spriteMidW+(_xdir*ATTACK_DISTANCE_STEGO),y+_spriteMidH+(_ydir*ATTACK_DISTANCE_STEGO),"Instances",obj_fireball_attack);
				//Change to vary on enemy level
				attack.image_speed *= ATTACK_SPEED_STEGO;
				break;
		}
		attack.parent = id;
		attack.image_angle = dir;
		
	}
	image_index = 0;
	if(!attacking) state_switch("Idle");
}