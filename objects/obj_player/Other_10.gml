/// @description Trigger takeover mechanic
sdm("Takeover success!");
takeover_enabled = false;
takeover_target = noone;
alarm[0] = room_speed * takeover_cooldown;

var _newObj = enemyToInhabit.object_index;
var _x = enemyToInhabit.x;
var _y = enemyToInhabit.y;


//Add stuff to do with hp here
//Get any other needed variables here

x = _x;
y = _y;
inhabiting = _newObj;
sprite_index = inhabiting.sprite_index;
inhabited_hp = inhabiting.max_hp;

//Do not access enemy variables after this!!
instance_destroy(enemyToInhabit);
enemyToInhabit = noone;

takeover_percent = 0;