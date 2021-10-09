/// @description Insert description here
// You can write your code in this editor

nextLevelThreshold = LEVEL_BASE_XP_COST * (power(LEVEL_XP_COST_SCALER,playerLevel));
if(xp >= nextLevelThreshold) {
	playerLevel++;
	gainedLevels++;
	xp = xp - nextLevelThreshold;
}