#region Keyboard inputs

key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

key_takeover = keyboard_check(ord("E"));
key_takeover_pressed = keyboard_check_pressed(ord("E"));
mouse_left_pressed = mouse_check_button_pressed(mb_left);

#endregion

#region Stair checking

if(place_meeting(x,y,obj_stairs)) event_perform(ev_other,ev_user1);

#endregion

if(inhabited_hp <= 0 && inhabiting != obj_player) {
	event_perform(ev_other,ev_user2);	
}

if(hp<=0) {
	state_switch("Dead");
}

state_execute();