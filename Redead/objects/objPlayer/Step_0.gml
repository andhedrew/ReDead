var _up = keyboard_check(vk_up);
var _down = keyboard_check(vk_down);
var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _grab = keyboard_check(ord("X"));
var _throw = keyboard_check_pressed(ord("Z"));
var _die = keyboard_check_pressed(vk_space);
var _movespeed = 1;


if myState != myStateLastFrame
{
	switchStateTimer = 0;
}

myStateLastFrame = myState;
switchStateTimer++;

switch myState
{
case State.Guy:

	switch facing
	{
		case Dir.North: sprite_index = sprPlayerN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayer; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayer; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayer; image_xscale = -1; break;
	}
	
	myAlpha = 1;
	
	if haveBeenDamaged
	{
		myColor = c_red;
	}
	else
	{
		myColor = c_white;
	}
	
	if _up 
	{
		facing = Dir.North;
		if !place_meeting(x, y -_movespeed, objWall)
		y -= _movespeed
	}
	
	if _down
	{
		facing = Dir.South;
	if !place_meeting(x, y+_movespeed, objWall)
		y += _movespeed
	}
	
	if _left
	{
		facing = Dir.West;
		if !place_meeting(x-_movespeed, y, objWall)
		x -= _movespeed
	}
	if _right
	{
		facing = Dir.East;
		if !place_meeting(x+_movespeed, y, objWall)
		x += _movespeed
	}
	if _die
	{
		global.myCorpse = instance_create_depth(x,y,depth, objCorpse);
		myState = State.Ghost;
	}
	
	if _grab
	{
		switch facing
		{
			case Dir.North: if place_meeting(x,y-16,objBall){ myState = State.Grabbing } break;
			case Dir.South: if place_meeting(x,y+16,objBall){ myState = State.Grabbing } break;
			case Dir.East: if place_meeting(x+16,y,objBall){ myState = State.Grabbing } break;
			case Dir.West: if place_meeting(x-16,y,objBall){ myState = State.Grabbing } break;
		}
		
		
		
	}
break;

case State.Ghost:
	sprite_index = sprGhost;
	myAlpha = 0.4;

	
	
	if _up 
	{
		if !place_meeting(x, y -_movespeed, objWall)
		y -= _movespeed
	}
	
	if _down
	{
	if !place_meeting(x, y+_movespeed, objWall)
		y += _movespeed
	}
	
	if _left
	{
		if !place_meeting(x-_movespeed, y, objWall)
		x -= _movespeed
	}
	if _right
	{
		if !place_meeting(x+_movespeed, y, objWall)
		x += _movespeed
	}
	if _die
	{
		if global.myCorpse != noone
		{
			//x = global.myCorpse.x;
			//y = global.myCorpse.y;
			myState = State.Guy;
			instance_destroy(global.myCorpse);
			global.myCorpse = noone;
		}
		
	}

break;

case State.Dead:

break;

case State.Grabbing:

if _throw
{
	
	with instance_nearest(x,y,objBallCarry)
		{
			instance_destroy();
		}
	
	switch facing
	{
		case Dir.North: instance_create_depth(x,y+16,depth,objBallThrow); break;
		case Dir.South: instance_create_depth(x,y-16,depth,objBallThrow); break;
		case Dir.East: instance_create_depth(x-16,y,depth,objBallThrow); break;
		case Dir.West: instance_create_depth(x+16,y,depth,objBallThrow); break;
	}
	
	
	
	myState = State.Throwing;
	
	
}
	switch facing
	{
		case Dir.North: sprite_index = sprPlayerGrabbingN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayerGrabbingS; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayerGrabbingE; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayerGrabbingE; image_xscale = -1; break;
	}
	
	
	var _grabbed = instance_nearest(x,y,objBall);
	
	with _grabbed
	{
		instance_create_depth(x,y,depth,objBallCarry);
		instance_destroy()
	}
	var _grabbed = instance_nearest(x,y,objBallCarry);
	
	with _grabbed
	{
		switch objPlayer.facing
		{
			case Dir.North: x = objPlayer.x; y = objPlayer.y-16; break;
			case Dir.South: x = objPlayer.x; y = objPlayer.y+16; break;
			case Dir.East: x = objPlayer.x+16; y = objPlayer.y; break;
			case Dir.West: x = objPlayer.x-16; y = objPlayer.y; break;
		}
		
		
	}
	
	if !_grab
	{
	
		with instance_nearest(x,y,objBallCarry)
		{
			instance_create_depth(x,y,depth,objBall);
			instance_destroy();
		}
	
		myState = State.Guy;
	}
	

	
	if _up 
	{
		if !place_meeting(x, y -_movespeed, objWall)
		y -= _movespeed
	}
	
	if _down
	{
	if !place_meeting(x, y+_movespeed, objWall)
		y += _movespeed
	}
	
	if _left
	{
		if !place_meeting(x-_movespeed, y, objWall)
		x -= _movespeed
	}
	if _right
	{
		if !place_meeting(x+_movespeed, y, objWall)
		x += _movespeed
	}
break;

case State.Pushing:

break;

case State.Throwing:
	switch facing
	{
		case Dir.North: sprite_index = sprPlayerThrowN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayerThrowS; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayerThrowEW; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayerThrowEW; image_xscale = -1; break;
	}
	
	if switchStateTimer > 8
	{
		myState = State.Guy;
	}
	
break;

}