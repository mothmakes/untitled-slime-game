/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if(obj_persistentValuesTracker.spentLevels[? object] > 0) {
	obj_persistentValuesTracker.levels[? object]--;
	obj_persistentValuesTracker.spentLevels[? object]--;
	obj_persistentValuesTracker.gainedLevels++;
} else {
	// Play sound here to indicate failure!
	
}