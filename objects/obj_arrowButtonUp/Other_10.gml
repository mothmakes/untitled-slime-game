/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(obj_persistentValuesTracker.gainedLevels > 0) {
	obj_persistentValuesTracker.levels[? object]++;
	obj_persistentValuesTracker.spentLevels[? object]++;
	obj_persistentValuesTracker.gainedLevels--;
} else {
	audio_play_sound(sou_clickerror,9,false);
}