/// @description Insert description here
// You can write your code in this editor

if(takeover_target != noone && takeover_enabled && instance_exists(takeover_target)) {
	draw_set_colour(c_blue);
	draw_line_width(x+sprite_width/2-sprite_xoffset,y+sprite_height/2-sprite_yoffset,takeover_target.x+sprite_width/2-sprite_xoffset,takeover_target.y+sprite_height/2-sprite_yoffset,4);
	draw_set_colour(c_purple);
	draw_line_width(x+sprite_width/2-sprite_xoffset,y+sprite_height/2-sprite_yoffset,takeover_target.x+sprite_width/2-sprite_xoffset,takeover_target.y+sprite_height/2-sprite_yoffset,2);
}



draw_self();