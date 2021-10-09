/// @description Insert description here
// You can write your code in this editor

//var _maxHealth = 20;
//var _health = 19;

//var _inhabitMaxHealth = 20;
//var _inhabitHealth = 15;

for(var i = 0; i < MAX_HP_PLAYER/2; ++i)
{
	spriteIndex = obj_player.hp >= (i+1)*2 ? 0 : (obj_player.hp == (i+1)*2-1 ? 1 : 2);
	draw_sprite_ext(spr_hearts, spriteIndex, 16 + i*64, 16, 4, 4, 0, -1, 1);
}
var _max_hp;
if(obj_player.inhabiting != obj_player) {
	if(instance_exists(obj_player.inhabiting)) _max_hp = obj_player.inhabiting.max_hp;
	else _max_hp = 0;
} else _max_hp = 0;

for(var i = 0; i < _max_hp/2; ++i)
{
	spriteIndex = obj_player.inhabited_hp >= (i+1)*2 ? 0 : (obj_player.inhabited_hp == (i+1)*2-1 ? 1 : 2);
	draw_sprite_ext(spr_inhabit_hearts, spriteIndex, 32 + i*64, 40, 4, 4, 0, -1, 1);
}

draw_set_font(font_title);
draw_set_halign(fa_right);
draw_set_colour(c_white);
draw_text(display_get_gui_width(),20,"Score: " + string(obj_persistentValuesTracker.playerScore));

draw_set_font(font_subtitle);
draw_set_halign(fa_left);
draw_text(10,display_get_gui_height()-80,"Level " + string(obj_persistentValuesTracker.playerLevel));

var percent = (obj_persistentValuesTracker.xp/obj_persistentValuesTracker.nextLevelThreshold)*100;
draw_healthbar(10,display_get_gui_height()-20,display_get_gui_width()-10,display_get_gui_height()-40,percent,c_black,c_red,c_green,0,true,true);