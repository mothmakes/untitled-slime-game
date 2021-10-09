state_machine_init();

inhabiting = obj_player;
takeover_range = 1;
takeover_percent = 0;
takeover_speed = 0.05;
takeover_cooldown = 

state_create("Idle",player_state_idle);
state_create("Walk",player_state_walk);

state_init("Idle");