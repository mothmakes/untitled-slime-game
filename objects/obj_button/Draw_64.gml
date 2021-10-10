/// @description Insert description here
// You can write your code in this editor

var index;

if(hover && !clicked) {
	index = 1;
} else if (clicked) {
	index = 2;
} else {
	index = 0;
}

draw_sprite_ext(sprite_index,index,x,y,image_xscale,image_yscale,0,c_white,1)

draw_set_font(font_subtitle);
draw_set_halign(fa_middle);
draw_text((bbox_right-bbox_left)/2,(bbox_bottom-bbox_top)/2,text);