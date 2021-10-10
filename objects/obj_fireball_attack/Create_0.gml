/// @description Insert description here
// You can write your code in this editor

dir = DIRS.LEFT;
hsp = 0;
vsp = 0;

startTime = current_time;
canAttack = true;

enemyList = ds_list_create();
hitList = ds_list_create();

parent = noone;

audio_play_sound(sou_fireball,8,false);
