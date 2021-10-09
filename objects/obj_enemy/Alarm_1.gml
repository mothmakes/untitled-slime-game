/// @description Attack delay

attack_charging = false;
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
switch(object_index) {
	case obj_skeleton:
		damage = DAMAGE_SKELETON;
		var attack = instance_create_layer(x+_spriteMidW+(_xdir*ATTACK_DISTANCE_SKELETON),y+_spriteMidH+(_ydir*ATTACK_DISTANCE_SKELETON),"Enemies",obj_swipe_attack);
		//Change to vary on enemy level
		attack.image_speed *= ATTACK_SPEED_SKELETON;
		break;
}
attack.parent = id;
attack.image_angle = dir;
