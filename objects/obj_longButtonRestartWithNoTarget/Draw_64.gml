/// @description Insert description here
// You can write your code in this editor

draw_set_font(font_subtitle);
draw_set_halign(fa_middle);
draw_set_colour(c_white);
draw_text(display_get_gui_width()/2,20,"Left-click to damage the skeleton.");
draw_text(display_get_gui_width()/2,80,"Press E to take it over when it turns red.");
draw_text(display_get_gui_width()/2,140,"Make sure you don't kill it!");

if(room == room0) {
	if(instance_number(obj_persistentValuesTracker.target) == 1 && obj_persistentValuesTracker.target != obj_player.inhabiting) {
		// Inherit the parent event
		event_inherited();
	}
}
else if(room == room_tutorial)
{
	if(obj_player.inhabiting != obj_skeleton && instance_number(obj_skeleton) == 0)
	{
		event_inherited();
		
		draw_set_font(font_subtitle);
		draw_set_halign(fa_middle);
		draw_set_colour(c_white);
		draw_text(300,240,"Restart");
	}
}
