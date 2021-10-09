// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerFunctions(){

}

function getPlayerDirection() {
	switch(floor(image_index)) {
		case 0:
			return DIRS.DOWN;
		case 1:
			return DIRS.LEFT;
		case 2:
			return DIRS.DOWN;
		case 3:
			return DIRS.RIGHT;
		case 4:
			return DIRS.UP;
		default:
			return DIRS.DOWN;
			
	}
}

// To be called within player states
function attemptTakeover() {
	if(key_takeover && takeover_enabled) {
		var _enemy = getEnemyWithinRange(x,y,takeover_range*global.tile_size);
		if(_enemy != noone) {
			takeover_percent = lerp(takeover_percent,1,takeover_speed);
			//sdm(takeover_percent);
			if(takeover_percent > 0.98) {
				enemyToInhabit = _enemy;
				event_perform(ev_other,ev_user0);
			}
		}
	} else if(!key_takeover && takeover_enabled) {
		takeover_percent = lerp(takeover_percent,0,takeover_loss_speed);
		//sdm(takeover_percent);
	}
}