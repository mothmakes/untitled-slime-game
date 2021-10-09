if(hp/max_hp <= TAKEOVER_THRESHOLD && hp > 0) {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_red,1);
} else if (hp<=0) {
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_dkgrey,1);
} else {
	draw_self();
}