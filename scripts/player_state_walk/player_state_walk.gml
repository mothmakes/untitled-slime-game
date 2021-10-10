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
	
	var bbox_height = bbox_bottom-bbox_top;
	var num_checks_height = ceil(bbox_height/global.tile_size) + 1;
	var check_div_height = bbox_height/num_checks_height;
	
	var bbox_width = bbox_right-bbox_left;
	var num_checks_width = ceil(bbox_width/global.tile_size) + 1;
	var check_div_width = bbox_width/num_checks_width;

	//Tile Based Collisions - X
	if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	var collide_y = false;
	for(var i=0;i<num_checks_height;i++) {
		collide_y = (tile_get_index(tilemap_get_at_pixel(_tilemap,bbox_side+hsp,max(bbox_top+(check_div_height*i),bbox_bottom))) > 0);
		if(collide_y) break;
	}
	//sdm("Player")
	//sdm(x)
	//if (tilemap_get_at_pixel(_tilemap,bbox_side+hsp,bbox_top) == 1 ) or (tilemap_get_at_pixel(_tilemap,bbox_side+hsp,bbox_bottom) == 1 ) {
	if(collide_y) {
		if (hsp > 0) x = (ceil(bbox_side/_tile)*_tile)-bbox_width-1;
		else x = ceil(bbox_side/_tile)*_tile//+1;
		//if (hsp > 0) x = x - (x mod _tile) + (bbox_right-bbox_left) - (bbox_right-x);
		//else x = x - (x mod _tile) - (bbox_left-x);
		hsp = 0;
	}

	x += hsp;

	//Tile Based Collisions - Y
	if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	var collide_x = false;
	for(var i=0;i<num_checks_width;i++) {
		collide_x = (tile_get_index(tilemap_get_at_pixel(_tilemap,max(bbox_left+(check_div_width*i),bbox_right),bbox_side+vsp)) > 0);
	}
	//if (tilemap_get_at_pixel(_tilemap,bbox_left,bbox_side+vsp) != 0 ) or (tilemap_get_at_pixel(_tilemap,bbox_right,bbox_side+vsp) != 0 ) {
	if(collide_x) {
		if (vsp > 0) y = (ceil(bbox_side/_tile)*_tile) - bbox_height - 1;
		else y = ceil(bbox_side/_tile)*_tile;
		//if (vsp > 0) y = y - (y mod _tile) + (bbox_bottom-bbox_top) - (bbox_bottom-y);
		//else y = y - (y mod _tile) - (bbox_top-y);
		vsp = 0;
	}

	y += vsp;
	
	#endregion
	
	if(mouse_left_pressed) state_switch("Attack");
	if(hsp == 0 && vsp == 0) state_switch("Idle");
	
	
	/*
	// to set the animations if the player is moving
	if(hsp != 0) {
		if(key_right) {
			dir = DIRS.RIGHT;
			image_index = 3;
		}
		if(key_left) {
			dir = DIRS.LEFT;
			image_index = 1;
		}
	}
	if(vsp != 0) {
		if(key_up) {
			dir = DIRS.UP;
			image_index = 4;
		}
		if(key_down) {
			dir = DIRS.DOWN;
			image_index = 2;
		}
	}
	*/
	
	if(abs(vsp) > abs(hsp)) {
		if(vsp>0) dir = DIRS.DOWN;
		if(vsp<0) dir = DIRS.UP;
	} else {
		if(hsp>0) dir = DIRS.RIGHT;
		if(hsp<0) dir = DIRS.LEFT;
	}
	
	// Time offset for animation frames. Should go 0, 1, 0, 2, 0, 1, etc.
	offset = floor(current_time / 200) % 4;
	if(offset == 2) offset = 0;
	else if(offset == 3) offset = 2;
	
	switch(inhabiting)
	{
		// Stego has more anim frames than skele, so the logic is different.
		case obj_stegosaurus:
			if(dir == DIRS.UP) image_index = 6 + offset;
			else if(dir == DIRS.DOWN) image_index = 3 + offset;
			else if(dir == DIRS.LEFT) image_index = 0 + offset;
			else image_index = 9 + offset;
			break;
		default:
			if(dir == DIRS.RIGHT) image_index = 3;
			else if(dir == DIRS.LEFT) image_index = 1;
			else if(dir == DIRS.UP) image_index = 4;
			else image_index = 2;
			break;
	}
	
}