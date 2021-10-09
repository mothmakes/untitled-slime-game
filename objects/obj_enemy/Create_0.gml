hp = 30;
max_hp = 30;

dir = DIRS.DOWN;

// setting speed  variables
hsp = 0
vsp = 0

los = false;

attack_enabled = true;
attack_range = 0;
attack_cooldown = 0;
attacking = false;

los_distance = 128;
standoff_range = STANDOFF_RANGE;

// Get current tilemap id

enemy_Current_Tilemap_Id1 = layer_tilemap_get_id(layer_get_id("Tiles_1"));

// Prevents enemy from running across the map to get you by limiting the enemy's line of sight to the width of the screen
if distance_to_object(obj_player)<= tilemap_get_width(enemy_Current_Tilemap_Id1){
    // Sets the line of sight between enemy and player. if there are no blocks (noone) then...
	if (collision_line(x,y,obj_player.x,obj_player.y,enemy_Current_Tilemap_Id1,true,true) = noone) { 
         // enemy moves in the direction of the player, this will need to be more complex if player is above or below the enemy
		 direction=point_direction(x,y,obj_player.x,obj_player.y);   
         speed= 1.5;             //speed in which to move
		}
	}
// initialise state machine
state_machine_init();

// Create states
state_create("walk",enemy_state_walk);
state_create("idle", enemy_state_idle);
state_create("Attack", enemy_state_attack);

// Set the default state
state_init("idle");
