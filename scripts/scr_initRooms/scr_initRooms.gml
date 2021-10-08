function scr_initRooms() {
	room_count = 10;
	radius = 320;

	max_width = 12;
	min_width = 6;

	max_height = 12;
	min_height = 6;

	translate_width = room_width/2;
	translate_height = room_height/2;

	var _roomPositions = [];
	var _roomDimensions = [];

	instance_destroy(obj_room);

	draw_set_colour(c_white);

	//Creates the set of rooms as rooms
	for(var i=0;i<room_count;i++) {
		//Gets a point in the circle for the start
		_roomPositions[i] = scr_getRandomPointInCircle(radius);
		var _point = _roomPositions[i];
	
		//Gets a random size
		var _height = irandom_range(min_height,max_height);
		var _width = irandom_range(min_width,max_width);
	
		_roomDimensions[i] = [_width,_height];
	
		//Creates the rooms for the rooms
		var _room = instance_create_layer(_point[0],_point[1],"Instances",obj_room);
	
		//Sets their variables to the generated size
		_room.width = _width;
		_room.height = _height;
	
	}

	//Returns info about rooms (likely deprecated)
	return [_roomPositions,_roomDimensions]


}
