#region Keyboard inputs

key_right = keyboard_check(ord("D"));
key_left = keyboard_check(ord("A"));
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));

key_takeover = keyboard_check(ord("E"));
mouse_left_pressed = mouse_check_button_pressed(mb_left);

#endregion

state_execute();