if(takeover_target != noone && takeover_enabled) {
	draw_circular_bar(takeover_target.x+sprite_width/2-sprite_xoffset,takeover_target.y+sprite_height/2-sprite_yoffset,takeover_percent,1,c_purple,7,0.9,2);
}

draw_circular_bar(x+sprite_width/2-sprite_xoffset,y+sprite_height/2-sprite_yoffset,alarm[0],room_speed*takeover_cooldown,c_purple,7,1,2);