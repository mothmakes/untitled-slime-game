/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_title);
draw_set_halign(fa_middle);
draw_set_colour(c_white);
draw_text(gui_w*0.5,20,"Game Over!");

draw_set_font(font_title);
draw_text(gui_w*0.5,gui_h*0.4,"Score: " + string(obj_persistentValuesTracker.playerScore));

draw_set_font(font_subtitle);
draw_text(gui_w*0.5,gui_h*0.5,"Floors traversed: " + string(obj_persistentValuesTracker.floorsTraversed));

draw_set_font(font_subtitle);
var scoreperfloor = obj_persistentValuesTracker.playerScore/obj_persistentValuesTracker.floorsTraversed;
if (obj_persistentValuesTracker.floorsTraversed == 0) scoreperfloor = obj_persistentValuesTracker.playerScore;
draw_text(gui_w*0.5,gui_h*0.6,"Score per floor: " + string(scoreperfloor));

draw_text(gui_w*0.25,gui_h*0.88,"Restart");
draw_text(gui_w*0.75,gui_h*0.88,"Exit");