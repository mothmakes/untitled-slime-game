// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_attack(){
	if(state_new) {
		attacking = true;
		var _ydir;
		var _xdir;
		switch(getPlayerDirection()) {
			case DIRS.UP:
				_ydir = -1
				_xdir = 0;
				sdm("Up")
				sdm(_ydir*global.tile_size);
			case DIRS.LEFT:
				_ydir = 0;
				_xdir = -1;
			case DIRS.DOWN:
				_ydir = 1
				_xdir = 0;
			case DIRS.RIGHT:
				_ydir = 0;
				_xdir = 1;
		}
		var _spriteMidW = sprite_width/2;
		var _spriteMidH = sprite_height/2;
		switch(inhabiting) {
			case obj_player:
				sdm("attacking!")
				sdm(_xdir);
				sdm(_spriteMidW + (_xdir*ATTACK_RANGE_PLAYER));
				var attack = instance_create_layer(x+_spriteMidW+(_xdir*ATTACK_RANGE_PLAYER),y+_spriteMidH+(_ydir*ATTACK_RANGE_PLAYER),"Instances",obj_swipe_attack);
				attack.image_speed *= ATTACK_SPEED_PLAYER;
				attack.parent = id;
				
				attack.image_angle = getPlayerDirection();
				break;
		}
		
	}
	image_index = 0;
	if(!attacking) state_switch("Idle");
}