state_machine_init();

inhabiting = obj_player;
enemyToInhabit = noone;
attacking = false;

takeover_enabled = true;
takeover_range = 1;
takeover_percent = 0;
takeover_speed = 0.05;
takeover_loss_speed = 0.1;
takeover_cooldown = 5;

hp = MAX_HP_PLAYER;
inhabited_hp = 0;

state_create("Idle",player_state_idle);
state_create("Walk",player_state_walk);
state_create("Attack",player_state_attack);

state_init("Idle");