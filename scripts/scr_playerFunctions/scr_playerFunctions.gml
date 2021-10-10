// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_playerFunctions(){

}

function gainXP(_instanceToGainFrom) {
	sdm("xp!");
	switch(_instanceToGainFrom.object_index) {
		case obj_skeleton:
			var xpGain = BASE_XP_SKELETON * (1 + (_instanceToGainFrom.level * LEVEL_MODIFIER));
			obj_persistentValuesTracker.xp += xpGain;
			obj_persistentValuesTracker.playerScore += xpGain;
			
		case obj_stegosaurus:
			var xpGain = BASE_XP_STEGO * (1 + _instanceToGainFrom.level * LEVEL_MODIFIER);
			obj_persistentValuesTracker.xp += xpGain;
			obj_persistentValuesTracker.playerScore += xpGain;
	}
}

function damageEntity(_damager,_damagee) {
	_damagee.image_blend = c_red;
	_damagee.alarm[9] = room_speed * 0.5
	if(_damagee.object_index == obj_player && obj_player.inhabiting != obj_player) {
		var targetHP = _damagee.inhabited_hp - _damager.damage;
		_damagee.inhabited_hp = targetHP;
		return;
	}
	var targetHP = _damagee.hp - _damager.damage;
	if(_damager.object_index == obj_player) {
		if(_damagee.hp/_damagee.max_hp > TAKEOVER_THRESHOLD && targetHP <= 0) {
			targetHP = 0.01;
		}
	}
	_damagee.hp = targetHP;
	return;
}

// To be called within player states
function attemptTakeover() {
	if(key_takeover && takeover_enabled) {
		if(key_takeover_pressed) var _enemy = getEnemyWithinRange(x,y,takeover_range*global.tile_size);
		else var _enemy = takeover_target;
		if(_enemy != noone) {
			if(takeover_target != _enemy) {
				takeover_target = _enemy;
				takeover_percent = 0;
				return;
			}
			if(takeover_target.hp/takeover_target.max_hp>TAKEOVER_THRESHOLD) {
				takeover_enabled = false;
				alarm[0] = room_speed * (takeover_cooldown / 2);
				instance_create_layer(takeover_target.x+sprite_width/2-sprite_xoffset,takeover_target.y+sprite_height/2-sprite_yoffset,"Enemies",obj_notakeover)
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