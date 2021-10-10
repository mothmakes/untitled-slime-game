playerScore = 0;
xp = 0;
playerLevel = 0;
gainedLevels = 0;
floorsTraversed = 0;
nextLevelThreshold = LEVEL_BASE_XP_COST;

levels = ds_map_create();
levels[? obj_skeleton] = 0;
levels[? obj_stegosaurus] = 0;

spentLevels = ds_map_create();
spentLevels[? obj_skeleton] = 0;
spentLevels[? obj_stegosaurus] = 0;

targetArray = [obj_skeleton,obj_stegosaurus];

target = noone;