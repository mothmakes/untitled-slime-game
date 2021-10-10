/// @description Insert description here
// You can write your code in this editor

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

restart = instance_create_layer(gui_w*0.25,gui_h*0.9,"Instances",obj_longButtonRestart);
restart.image_xscale = 5;
restart.image_yscale = 5;

exitgame = instance_create_layer(gui_w*0.75,gui_h*0.9,"Instances",obj_longButtonExit);
exitgame.image_xscale = 5;
exitgame.image_yscale = 5;