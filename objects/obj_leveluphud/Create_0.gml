/// @description Insert description here
// You can write your code in this editor

gui_w = display_get_gui_width();
gui_h = display_get_gui_height();

upArrowSkeleton = instance_create_layer(gui_w*0.55,gui_h*0.30,"Instances",obj_arrowButtonUp);
upArrowSkeleton.image_xscale = 3;
upArrowSkeleton.image_yscale = 3;
upArrowSkeleton.object = obj_skeleton;

downArrowSkeleton = instance_create_layer(gui_w*0.6,gui_h*0.30,"Instances",obj_arrowButtonDown);
downArrowSkeleton.image_xscale = 3;
downArrowSkeleton.image_yscale = 3;
downArrowSkeleton.object = obj_skeleton;

upArrowStego = instance_create_layer(gui_w*0.55,gui_h*0.50,"Instances",obj_arrowButtonUp);
upArrowStego.image_xscale = 3;
upArrowStego.image_yscale = 3;
upArrowStego.object = obj_stegosaurus;

downArrowStego = instance_create_layer(gui_w*0.6,gui_h*0.50,"Instances",obj_arrowButtonDown);
downArrowStego.image_xscale = 3;
downArrowStego.image_yscale = 3;
downArrowStego.object = obj_stegosaurus;

nextRoom = instance_create_layer(gui_w*0.7,gui_h*0.9,"Instances",obj_longButtonNextRoom);
nextRoom.image_xscale = 5;
nextRoom.image_yscale = 5;
//nextRoom.text = "Continue";