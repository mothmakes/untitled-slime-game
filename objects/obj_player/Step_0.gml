#region Keyboard inputs

key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

key_takeover = keyboard_check(ord("E"));
mouse_left_pressed = mouse_check_button_pressed(mb_left);

#endregion

#region Stair checking

if(place_meeting(x,y,obj_stairs)) event_perform(ev_other,ev_user1);

#endregion

state_execute();