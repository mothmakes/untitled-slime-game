// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_walk(){
	hsp = (key_right-key_left) * 2;
	vsp = (key_down-key_up) * 2;
	
	attemptTakeover();
	
	#region Collisions
	
	var bbox_side;
	var _tile = global.tile_size;
	var _tilemap = obj_gameManager.CollisionMap
	
	var bbox_height = bbox_top-bbox_bottom;
	var num_checks_height = ceil(bbox_height/global.tile_size) + 1;
	var check_div_height = bbox_height/num_checks_height;
	
	var bbox_width = bbox_right-bbox_left;
	var num_checks_width = ceil(bbox_width/global.tile_size) + 1;
	var check_div_width = bbox_width/num_checks_width;

	//Tile Based Collisions - X
	if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	var collide_y = true;
	for(var i=0;i<num_checks_height;i++) {
		collide_y = collide_y && (tilemap_get_at_pixel(_tilemap,bbox_side+hsp,bbox_top+(check_div_height*i)) > 0);
	}
	sdm(x)
	//if (tilemap_get_at_pixel(_tilemap,bbox_side+hsp,bbox_top) == 1 ) or (tilemap_get_at_pixel(_tilemap,bbox_side+hsp,bbox_bottom) == 1 ) {
	if(collide_y) {
		if (hsp > 0) x = (ceil(bbox_side/_tile)*_tile)-bbox_width;
		else x = ceil(bbox_side/_tile)*_tile;
		//if (hsp > 0) x = x - (x mod _tile) + (bbox_right-bbox_left) - (bbox_right-x);
		//else x = x - (x mod _tile) - (bbox_left-x);
		hsp = 0;
	}

	x += hsp;

	//Tile Based Collisions - Y
	if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	var collide_x = true;
	for(var i=0;i<num_checks_width;i++) {
		collide_x = collide_x && (tilemap_get_at_pixel(_tilemap,bbox_left+(check_div_width*i),bbox_side+vsp) > 0);
	}
	//if (tilemap_get_at_pixel(_tilemap,bbox_left,bbox_side+vsp) != 0 ) or (tilemap_get_at_pixel(_tilemap,bbox_right,bbox_side+vsp) != 0 ) {
	if(collide_x) {
		if (vsp > 0) y = (ceil(bbox_side/_tile)*_tile)-bbox_height;
		else y = ceil(bbox_side/_tile)*_tile;
		//if (vsp > 0) y = y - (y mod _tile) + (bbox_bottom-bbox_top) - (bbox_bottom-y);
		//else y = y - (y mod _tile) - (bbox_top-y);
		vsp = 0;
	}

	y += vsp;
	
	#endregion
	
	if(hsp == 0 && vsp == 0) state_switch("Idle");
	
	// to set the animations if the player is moving
	if(hsp != 0) {
		if(key_right) image_index = 2;
		
		if(key_left) image_index = 0;
	}
	if(vsp != 0) {
		if(key_up) image_index = 3;
		
		if(key_down) image_index = 4;
	
	}
	
}