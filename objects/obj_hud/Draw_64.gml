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

for(var i = 0; i < MAX_HP_PLAYER/2; ++i)
{
	spriteIndex = obj_player.inhabited_hp >= (i+1)*2 ? 0 : (obj_player.inhabited_hp == (i+1)*2-1 ? 1 : 2);
	draw_sprite_ext(spr_inhabit_hearts, spriteIndex, 24 + i*64, 32, 4, 4, 0, -1, 1);
}

draw_set_font(font_title);
draw_set_halign(fa_right);
draw_text(display_get_gui_width(),20,"Score: " + string(obj_persistentValuesTracker.playerScore));