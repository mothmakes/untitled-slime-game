/// @description Trigger end level

if(room == room_tutorial)
{
	if(inhabiting == obj_skeleton)
	{
		room_goto_next();
	}
}
else
{
	if(inhabiting == obj_persistentValuesTracker.target) {
		obj_persistentValuesTracker.floorsTraversed++;
		obj_persistentValuesTracker.currentPlayerInhabit = inhabiting;
		room_goto_next();
	} else {
		noTargetErrorAlpha = 1;
		audio_play_sound(sou_notargeterror,9,false);
	}
}
