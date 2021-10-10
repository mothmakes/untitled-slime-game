/// @description Insert description here
// You can write your code in this editor

if(room_get_name(room) == "room0") {
	target = targetArray[irandom(array_length(targetArray)-1)];
	if(instance_number(target) == 1) {
		room_goto(room0);
	}
}