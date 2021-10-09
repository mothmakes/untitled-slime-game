// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_constantsAndValues(){
	enum DIRS {
		UP = 0,
		DOWN = 180,
		LEFT = 90,
		RIGHT = 270
	}
	#macro NON_COLLIDE_TILE_INDEX_START 23
	#macro MAX_HP_PLAYER 3
	#macro ATTACK_SPEED_PLAYER 1
	#macro ATTACK_RANGE_PLAYER global.tile_size * 1
}

function setupSpawnChance() {
	var _spawnChances = ds_map_create();
	
	// Add more values to map in same style as below:
	ds_map_add(_spawnChances,obj_skeleton,0.75);
	
	return _spawnChances;
}