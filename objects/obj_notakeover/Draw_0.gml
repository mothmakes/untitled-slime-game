/// @description Insert description here
// You can write your code in this editor

image_alpha = alpha
draw_self();

alpha = lerp(alpha,0,0.1);
if(alpha < 0.05) instance_destroy(id);