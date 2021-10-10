/// @description Insert description here
// You can write your code in this editor

if(point_in_rectangle(device_mouse_x_to_gui(0),device_mouse_y_to_gui(0),bbox_left,bbox_top,bbox_right,bbox_bottom)) {
	hover = true;
} else {
	hover = false;
}

mouse_left = mouse_check_button(mb_left);
mouse_left_released = mouse_check_button_released(mb_left);

if(mouse_left && hover) {
	clicked = true;
	
}

if(clicked && mouse_left_released) {
	clicked = false;
	event_perform(ev_other,ev_user0);
}