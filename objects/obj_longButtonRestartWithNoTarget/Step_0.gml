/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
if(room == room0) {
	if(instance_number(obj_persistentValuesTracker.target) == 1 && obj_persistentValuesTracker.target != obj_player.inhabiting) {
		// Inherit the parent event
		event_inherited();
	}
}
