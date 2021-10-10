/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

with(obj_persistentValuesTracker) {
	playerScore = 0;
	xp = 0;
	playerLevel = 0;
	gainedLevels = 0;
	floorsTraversed = 0;
	nextLevelThreshold = LEVEL_BASE_XP_COST;
	currentPlayerInhabit = noone;

	levels[? obj_skeleton] = 0;
	levels[? obj_stegosaurus] = 0;

	spentLevels[? obj_skeleton] = 0;
	spentLevels[? obj_stegosaurus] = 0;
	
	target = noone;
}

if(room == room0)
	room_goto(room0);
else if(room == room_tutorial)
	room_goto(room_tutorial);
