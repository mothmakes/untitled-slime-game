/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_title);
draw_set_halign(fa_middle);
draw_set_colour(c_white);
draw_text(display_get_gui_width()/2,20,"Level up the monsters!");

draw_set_font(font_subtitle);
draw_text(display_get_gui_width()/2,90,"Level them up to give more health, damage and score!");

draw_sprite_ext(spr_skeleton,0,display_get_gui_width()*0.3,display_get_gui_height()*0.3,6,6,0,c_white,1);
draw_sprite_ext(spr_stegosaurus,0,display_get_gui_width()*0.3,display_get_gui_height()*0.5,6,6,0,c_white,1);