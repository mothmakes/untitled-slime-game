/// @description Insert description here
// You can write your code in this editor

if(image_index == image_number - 1) {
	if(instance_exists(parent)) parent.attacking = false;
	instance_destroy(id);
}