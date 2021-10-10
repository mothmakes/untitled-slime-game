/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_title);
draw_set_halign(fa_middle);
draw_set_colour(c_white);

draw_set_alpha(noTargetErrorAlpha);
draw_text(display_get_gui_width()/2,display_get_gui_height()/2,"Not inhabiting the target!");
draw_set_alpha(1);

noTargetErrorAlpha = lerp(noTargetErrorAlpha,0,0.05);