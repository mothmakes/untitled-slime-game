state_machine_init();

state_create("Idle",player_state_idle);
state_create("Walk",player_state_walk);


state_init("Idle");