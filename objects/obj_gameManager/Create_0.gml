#region Setup Variables
Map = noone;
CollisionMap = noone;
#endregion

#region Views
view_enabled = true;
view_visible[0] = true;
view_camera[0] = camera_create_view(0, 0, 640, 360, 0, noone, -1, -1, -1, -1);
#endregion

#region Objects
//instance_create_layer(0,0,"Managers",obj_generatorManager);
#endregion

#region Generator

#region Initialize generator
global.tile_size = 16;

//Ensure seed is random
randomize();

//Create the rooms and return an array containing info
roomInfo = scr_initRooms();

//Split info into two arrays
roomPositions = roomInfo[0];
roomDimensions = roomInfo[1];

//Create the dictionary holding the fully connected graph as an adjacency list
adjacency_list = ds_map_create();

//Booleans for the Draw event, to dictate what stage the generator is at so
//correct data is displayed
graphed = false;
treed = false;

startRoom = noone;
endRoom = noone;

#endregion

#region Seperate Rooms using rudimentary physics engine

//Number of rooms
var _number = instance_number(obj_room);

//Determines length of simulation based on number of rooms
repeat (power(2.7156,sqrt(room_count)) * 7) { 
	
	//Loops through each room
	for(var i = 0;i < _number;i++) {
		var _agent = instance_find(obj_room,i);
		
		//Performs seperation steering algorithm to determine a vector to add to the current
		//position
		var _seperation = scr_computeSeperation(_agent,_number);
	
		with _agent {
			//Adds seperation vector
			x += _seperation[0] * base_speed;
			y += _seperation[1] * base_speed;
		}
	}
}

// Ensures all rooms are snapped to grid. Better results than rounding each move (stops overlap)
for(var i = 0;i < _number;i++) {
		var _agent = instance_find(obj_room,i);
		
		with _agent {
			//Snaps to tilegrid
			x = scr_roundm(x,16);
			y = scr_roundm(y,16);
			
			//Updates room centres, rounds to grid
			xx = scr_roundm(x+((width*16)/2),global.tile_size);
			yy = scr_roundm(y+((height*16)/2),global.tile_size);
		}
}

#endregion

#region Create graph of all nodes. Fully connected, undirected, weighted with distances

//Creates array of room rooms
for (var i=0;i<instance_number(obj_room);i++) {
	rooms[i] = instance_find(obj_room,i);	
}

//Creates a dictionary (edges) within adjacency list, accesible by the room (node)
for (var i=0;i<array_length_1d(rooms);i++) {
	var _edges = ds_map_create();
	ds_map_add_map(adjacency_list,rooms[i],_edges);
}

//Connect graph
for (var i=0;i<array_length_1d(rooms);i++) {
	var _room = rooms[i];
	//Connect each other node to current node
	for (var k=0;k<array_length_1d(rooms);k++) {
		var _temproom = rooms[k]
		if _temproom != _room {
			//Calculate distance between current node, and node to be connected
			var _weight = scr_distance_to_point([_room.x,_room.y],[_temproom.x,_temproom.y])
			
			//Adds edge by using node to be connected as a key for it's distance
			ds_map_add(adjacency_list[?rooms[i]],_temproom,_weight);
		}
	}
}

//Updates stage for Draw event
graphed = true;

#endregion

#region Start the MST stage.

tree = [];

//Returns the edges in the MST. An MST is a tree that connects all nodes using the shortest
//connection available after adding a node. No loops, but all rooms are accessible.
tree = scr_minimumSpanningTree();

//Cleanup data structures
ds_map_destroy(adjacency_list);
ds_list_destroy(unreachSet);

//Starts MST stage for Draw event.
treed = true;

#endregion

#region Identify rooms for specific contents based on position in tree.

// Start and end rooms
startRoom = rooms[scr_findCentreNode()];
show_debug_message(startRoom)

endRoom = scr_parseTree(tree,5,startRoom)
show_debug_message(endRoom)

// Dangerous regions

#endregion

//Triggers the tile conversion
event_user(0) 

//Spawns player
player = instance_create_layer(startRoom.xx,startRoom.yy,"Instances",obj_player)

//Spawns enemies
spawnChance = 0.75
enemies = [];

for (var i = 0;i<array_length_1d(rooms);i++) {
	if rooms[i] != startRoom {
		if random(1) <= spawnChance {
			var _width = rooms[i].width;
			var _height = rooms[i].height;
			var _spawnX = rooms[i].x + ((_width-1)*random(1)*global.tile_size);
			var _spawnY = rooms[i].y + ((_height-1)*random(1)*global.tile_size);
			enemies[i] = instance_create_layer(_spawnX,_spawnY,"Instances",obj_enemy);
		}
	}
}

//with obj_gameManager enemies = obj_generatorManager.enemies;

#endregion