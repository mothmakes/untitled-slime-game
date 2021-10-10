state_machine_init();

inhabiting = obj_player;
enemyToInhabit = noone;
attacking = false;
dir = DIRS.DOWN;

noTargetErrorAlpha = 0;

takeover_enabled = true;
takeover_range = 3;
takeover_percent = 0;
takeover_speed = 0.05;
takeover_loss_speed = 0.1;
takeover_cooldown = 5;
takeover_target = noone;

hp = MAX_HP_PLAYER;
max_hp = MAX_HP_PLAYER;
damage = DAMAGE_PLAYER;
inhabited_hp = 0;

vsp = 0;
hsp = 0;

state_create("Idle",player_state_idle);
state_create("Walk",player_state_walk);
state_create("Attack",player_state_attack);
state_create("Dead",player_state_dead);

state_init("Idle");
