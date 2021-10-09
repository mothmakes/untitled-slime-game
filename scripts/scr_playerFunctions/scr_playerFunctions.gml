// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerFunctions(){

}

function gainXP(_instanceToGainFrom) {
	switch(_instanceToGainFrom.object_index) {
		case obj_skeleton:
			obj_persistentValuesTracker.xp += BASE_XP_SKELETON * (1 + _instanceToGainFrom.level * LEVEL_MODIFIER);
	}
}

// To be called within player states
function attemptTakeover() {
	if(key_takeover && takeover_enabled) {
		var _enemy = getEnemyWithinRange(x,y,takeover_range*global.tile_size);
		if(_enemy != noone) {
			if(takeover_target != _enemy) {
				takeover_target = _enemy;
				takeover_percent = 0;
				return;
			}
			takeover_percent = lerp(takeover_percent,1,takeover_speed);
			//sdm(takeover_percent);
			if(takeover_percent > 0.98) {
				enemyToInhabit = _enemy;
				event_perform(ev_other,ev_user0);
			}
			
		} else takeover_target = noone;
	} else if(!key_takeover && takeover_enabled) {
		takeover_target = noone;
		takeover_percent = lerp(takeover_percent,0,takeover_loss_speed);
		//sdm(takeover_percent);
	}
}