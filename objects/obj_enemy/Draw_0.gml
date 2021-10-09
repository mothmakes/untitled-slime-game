if(hp/max_hp <= TAKEOVER_THRESHOLD) {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_red,1);
} else {
	draw_self();
}