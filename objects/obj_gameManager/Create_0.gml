#region Setup Variables
Map = noone;
CollisionMap = noone;
scr_constantsAndValues();
#endregion

#region Views

scr_viewSetup();

#endregion

#region Variables
global.tile_size = 16;
room_count = 10;
min_w = 6;
min_h = 6;
max_w = 12;
max_h = 12;

#endregion

#region Generator

#region Initialize generator

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
var _seperated = false;
var _seperationMaxDistance = 0.01;
var iters = 0;
//repeat (power(2.7156,sqrt(room_count)) * 7) { 
while(!_seperated) {
	_seperated = true;
	iters++;
	//Loops through each room
	for(var i = 0;i < _number;i++) {
		var _agent = instance_find(obj_room,i);
		
		//Performs seperation steering algorithm to determine a vector to add to the current
		//position
		var _seperation = scr_computeSeperation(_agent,_number);
		if(abs(_seperation[0]) <= _seperationMaxDistance && abs(_seperation[1]) <= _seperationMaxDistance) {
			_seperated = _seperated && true;
		} else {
			_seperated = _seperated && false;
		}
	
		with _agent {
			//Adds seperation vector
			x += _seperation[0] * base_speed;
			y += _seperation[1] * base_speed;
		}
	}
}
sdm(iters);

// Ensures all rooms are snapped to grid. Better results than rounding each move (stops overlap)
for(var i = 0;i < _number;i++) {
		var _agent = instance_find(obj_room,i);
		
		with _agent {
			//Snaps to tilegrid
			x = scr_roundm(x,16);
			sdm(x);
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

endRoom = scr_parseTree(tree,9,startRoom)
show_debug_message(endRoom)

// Dangerous regions

#endregion

//Triggers the tile conversion
event_user(0) 

//Spawns player
player = instance_create_layer(startRoom.xx,startRoom.yy,"Instances",obj_player);

//Spawns stairs
stairs = instance_create_layer(endRoom.xx,endRoom.yy,"Instances",obj_stairs);

//Spawns enemies
spawnChances = setupSpawnChance();
enemies = [];

for (var i = 0;i<array_length_1d(rooms);i++) {
	if rooms[i] != startRoom {
		spawn_enemies(i,obj_skeleton,irandom(4));
		spawn_enemies(i,obj_stegosaurus,irandom(4));
	}
}

//with obj_gameManager enemies = obj_generatorManager.enemies;

#endregion

#region Objects
//instance_create_layer(0,0,"Managers",obj_generatorManager);
#endregion