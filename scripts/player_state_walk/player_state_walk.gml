// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function player_state_walk(){
	hsp = (key_right-key_left) * 2;
	vsp = (key_down-key_up) * 2;
	
	#region Collisions
	
	var bbox_side;
	var _tile = global.tile_size;
	var _tilemap = obj_gameManager.CollisionMap

	//Tile Based Collisions - X
	if (hsp > 0) bbox_side = bbox_right; else bbox_side = bbox_left;
	if (tilemap_get_at_pixel(_tilemap,bbox_side+hsp,bbox_top) == 1 ) or (tilemap_get_at_pixel(_tilemap,bbox_side+hsp,bbox_bottom) == 1 ) {
		if (hsp > 0) x = x - (x mod _tile) + 15 - (bbox_right-x);
		else x = x - (x mod _tile) - (bbox_left-x);
		hsp = 0;
	}

	x += hsp;

	//Tile Based Collisions - Y
	if (vsp > 0) bbox_side = bbox_bottom; else bbox_side = bbox_top;
	if (tilemap_get_at_pixel(_tilemap,bbox_left,bbox_side+vsp) != 0 ) or (tilemap_get_at_pixel(_tilemap,bbox_right,bbox_side+vsp) != 0 ) {
		if (vsp > 0) y = y - (y mod _tile) + 15 - (bbox_bottom-y);
		else y = y - (y mod _tile) - (bbox_top-y);
		vsp = 0;
	}

	y += vsp;
	
	#endregion
	
	if(hsp == 0 && vsp == 0) state_switch("Idle");
}