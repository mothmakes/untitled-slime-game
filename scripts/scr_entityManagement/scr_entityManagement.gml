// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_entityManagement(){

}

function spawn_enemies(_room_index,_obj,_maxAmount) {
	if(_maxAmount == 0) return;
	var _width = obj_gameManager.rooms[_room_index].width;
	var _height = obj_gameManager.rooms[_room_index].height;
	for(var i=0;i<_maxAmount;i++) {
		if(random(1) <= obj_gameManager.spawnChances[? _obj]) {
			var _temp = instance_create_layer(0,0,"Enemies",_obj);
			var _spawnX = max(obj_gameManager.rooms[_room_index].x,obj_gameManager.rooms[_room_index].x + (_width*random(1)*global.tile_size - _obj.sprite_width));
			var _spawnY = max(obj_gameManager.rooms[_room_index].y,obj_gameManager.rooms[_room_index].y + (_height*random(1)*global.tile_size - _obj.sprite_height));
			_temp.x = _spawnX;
			_temp.y = _spawnY;
			obj_gameManager.enemies[array_length(enemies)] = _temp;
		}
	}
}

function getEnemyWithinRange(_startX,_startY,_range) {
	var _nearest = instance_nearest(_startX,_startY,obj_enemy);
	if(distance_to_object(_nearest) <= _range) {
		return _nearest;
	}
	return noone;
}