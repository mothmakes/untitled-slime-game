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

//Spawns player
//player = instance_create_layer(startRoom.xx,startRoom.yy,"Instances",obj_player);
player = obj_player;

#endregion

#region Objects
//instance_create_layer(0,0,"Managers",obj_generatorManager);
#endregion

#region Tutorial stages

firstStep = false;
secondStep = false;
thirdStep = false;

#endregion
