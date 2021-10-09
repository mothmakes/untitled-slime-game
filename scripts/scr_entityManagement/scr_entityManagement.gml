// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_entityManagement(){

}

function spawn_enemies(_room_index,_obj) {
	var _width = obj_gameManager.rooms[_room_index].width;
	var _height = obj_gameManager.rooms[_room_index].height;
	var _spawnX = obj_gameManager.rooms[_room_index].x + ((_width-1)*random(1)*global.tile_size);
	var _spawnY = obj_gameManager.rooms[_room_index].y + ((_height-1)*random(1)*global.tile_size);
	obj_gameManager.enemies[array_length(enemies)] = instance_create_layer(_spawnX,_spawnY,"Enemies",_obj);
}