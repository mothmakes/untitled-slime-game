/// @description Trigger end level

if(inhabiting == obj_persistentValuesTracker.target) {
	obj_persistentValuesTracker.floorsTraversed++;
	room_goto_next();
} else {
	noTargetErrorAlpha = 1;
	// Play sound!
}