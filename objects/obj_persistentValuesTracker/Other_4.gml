/// @description Insert description here
// You can write your code in this editor

if(room_get_name(room) == "room0") {
	target = targetArray[irandom(array_length(targetArray)-1)];
	if(currentPlayerInhabit != noone) obj_player.inhabiting = currentPlayerInhabit;
	with(obj_player) {
		sprite_index = inhabiting.sprite_index;
		inhabited_hp = inhabiting.max_hp;	
	}
	if(instance_number(target) == 1) {
		room_goto(room0);
	}
	audio_play_sound(sou_dungeonmusic,7,true);
}