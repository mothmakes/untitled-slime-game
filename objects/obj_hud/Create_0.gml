gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

restart = instance_create_layer(gui_w*0.5,gui_h*0.9,"Instances",obj_longButtonRestartWithNoTarget);
restart.image_xscale = 5;
restart.image_yscale = 5;