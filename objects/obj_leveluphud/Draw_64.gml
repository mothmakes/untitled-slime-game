/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_title);
draw_set_halign(fa_middle);
draw_set_colour(c_white);
draw_text(display_get_gui_width()/2,20,"Level up the monsters!");

draw_set_font(font_subtitle);
draw_text(display_get_gui_width()/2,90,"Level them up to give more health, damage and score!");

draw_set_halign(fa_left);



draw_sprite_ext(spr_skeleton,0,display_get_gui_width()*0.2,display_get_gui_height()*0.3,6,6,0,c_white,1);
draw_text(gui_w*0.35,gui_h*0.30,"Level " + string(obj_persistentValuesTracker.levels[? obj_skeleton]));
draw_text(gui_w*0.65,gui_h*0.3,"Spent Levels: " + string(obj_persistentValuesTracker.spentLevels[? obj_skeleton]));

draw_sprite_ext(spr_stegosaurus,0,display_get_gui_width()*0.2,display_get_gui_height()*0.5,6,6,0,c_white,1);
draw_text(gui_w*0.35,gui_h*0.50,"Level " + string(obj_persistentValuesTracker.levels[? obj_stegosaurus]));
draw_text(gui_w*0.65,gui_h*0.5,"Spent Levels: " + string(obj_persistentValuesTracker.spentLevels[? obj_stegosaurus]));

draw_text(gui_w*0.05,gui_h*0.9,"Levels To Spend " + string(obj_persistentValuesTracker.gainedLevels));

draw_set_halign(fa_middle);
draw_text(gui_w*0.7,gui_h*0.88,"Continue");
