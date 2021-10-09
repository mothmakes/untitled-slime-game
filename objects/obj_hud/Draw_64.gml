/// @description Insert description here
// You can write your code in this editor

var _maxHealth = 20;
var _health = 19;

for(var i = 0; i < _maxHealth/2; ++i)
{
	spriteIndex = _health >= (i+1)*2 ? 0 : (_health == (i+1)*2-1 ? 1 : 2);
	draw_sprite_ext(spr_hearts, spriteIndex, 16 + i*64, 16, 4, 4, 0, -1, 1);
}
