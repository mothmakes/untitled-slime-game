if(keyboard_check_pressed(vk_enter)) {
	room_goto_next();	
}

if(keyboard_check_pressed(vk_escape)) {
	room_goto(room0);
}