// to call the current state's script
state_execute();

if(scr_detectLOS(512))
{
	//direction=point_direction(x,y,obj_player.x,obj_player.y);   
    //speed= 1.5;             //speed in which to move
	
	direction = point_direction(x,y,obj_player.x,obj_player.y);
	hsp = cos(direction * pi/180);
	vsp = -sin(direction * pi/180);
}
else
{
	hsp = 0;
	vsp = 0;
}

/*
// Prevents enemy from running across the map to get you by limiting the enemy's line of sight to the width of the screen
if distance_to_object(obj_player)<= tilemap_get_width(enemy_Current_Tilemap_Id1)
{
    // Sets the line of sight between enemy and player. if there are no blocks (noone) then...
	if (collision_line(x,y,obj_player.x,obj_player.y,enemy_Current_Tilemap_Id1,true,true) = noone) 
	{ 
         // enemy moves in the direction of the player, this will need to be more complex if player is above or below the enemy
		 direction=point_direction(x,y,obj_player.x,obj_player.y);   
         speed= 1.5;             //speed in which to move
	}
}
*/
