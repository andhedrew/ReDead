/// @description Insert description here
// You can write your code in this editor




// Inherit the parent event
event_inherited();

if moveDir != 0 && moveDir != 1 && moveDir != 2 && moveDir != 3
{
	sprite_index = sprEnemySmashableSleep;
	var _speed = irandom_range(2,5);
	
	image_speed = _speed/100;
}


moveSpeed = .8;
