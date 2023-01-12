var _up = keyboard_check(vk_up);
var _down = keyboard_check(vk_down);
var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _grab = keyboard_check(ord("X"));
var _throw = keyboard_check_pressed(ord("Z"));
var _die = keyboard_check_pressed(vk_space);
var _movespeed = 1;


var _up_pressed = keyboard_check_pressed(vk_up);
var _down_pressed = keyboard_check_pressed(vk_down);
var _left_pressed = keyboard_check_pressed(vk_left);
var _right_pressed = keyboard_check_pressed(vk_right);


if myState != myStateLastFrame
{
	switchStateTimer = 0;
}

myStateLastFrame = myState;
switchStateTimer++;

orginX = x;
orginY = y;


switch myState
{
case State.Idle:  //================================================================================================================================================================//

	image_speed = 0;
	image_index = 0;

	xSpeed = 0;
	ySpeed = 0;

	switch facing
	{
		case Dir.North: sprite_index = sprPlayerN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayer; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayer; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayer; image_xscale = -1; break;
	}
	
	myAlpha = 1;
		
	if _die
	{
		global.myCorpse = instance_create_depth(x,y,SortLayer.Ground, objCorpse);
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
	//switch states
	if _up or _down or _left or _right
	{
		myState = State.Walking;
	}
	
	if haveBeenDamaged
	{
		xSpeed = knockbackX;
		ySpeed = knockbackY;
		
		knockbackX = lerp(knockbackX, 0, 0.2)
		knockbackY = lerp(knockbackY, 0, 0.2)
		
		if (knockbackX <= 0) and (knockbackY <= 0)
		{
			haveBeenDamaged = false
		}
	}

	move.xSpdYSpd(xSpeed, ySpeed);
	
break;
case State.Walking:  //================================================================================================================================================================//

	image_speed = .2;
	
	switch facing
	{
		case Dir.North: sprite_index = sprPlayerN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayer; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayer; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayer; image_xscale = -1; break;
	}
	
	myAlpha = 1;


	//movement

		ySpeed = 0;
		xSpeed = 0;

	if _up 
	{
		ySpeed -= mySpeed;
		facing = Dir.North;

	}
	if _down
	{
		ySpeed += mySpeed;
		facing = Dir.South;

	}
	
	if _left
	{
		xSpeed -= mySpeed;
		facing = Dir.West;

	}
	if _right
	{
		xSpeed += mySpeed;
		facing = Dir.East;

	}
	
	if ySpeed == 0 && xSpeed == 0
	{
		myState = State.Idle;
	}
	
	if haveBeenDamaged
	{
		xSpeed = knockbackX;
		ySpeed = knockbackY;
		
		knockbackX = lerp(knockbackX, 0, 0.2)
		knockbackY = lerp(knockbackY, 0, 0.2)
	}
	
	move.xSpdYSpd(xSpeed, ySpeed);
	
	
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

case State.Ghost: //================================================================================================================================================================//=
	knockback = false;
	depth = SortLayer.Player;
	if switchStateTimer > 60
	{
		myColor = c_white;
	}
	sprite_index = sprGhost;
	myAlpha = 0.4;
	speed = 0;

	
	
	//movement
	ySpeed = 0;
	xSpeed = 0;
	if _up 
	{
		ySpeed -= mySpeed;
		facing = Dir.North;
		image_xscale = 1;

	}
	if _down
	{
		ySpeed += mySpeed;
		facing = Dir.South;
		image_xscale = 1;

	}
	
	if _left
	{
		xSpeed -= mySpeed;
		facing = Dir.West;
		image_xscale = -1;

	}
	if _right
	{
		xSpeed += mySpeed;
		facing = Dir.East;
		image_xscale = 1;

	}
	

	moveGhost.xSpdYSpd(xSpeed, ySpeed);
	
	
	if place_meeting(x,y,objCorpse)
	{
		global.myCorpse = instance_nearest(x,y,objCorpse)
	}
	else
	{
		global.myCorpse = noone;
	}
	
	
	
	if _die
	{
		if global.myCorpse != noone
		{
			x = global.myCorpse.x;
			y = global.myCorpse.y;
			myState = State.Idle;
			instance_destroy(global.myCorpse);
			global.myCorpse = noone;
		}
		
	}
	
		
	if _grab
	{
		if global.myCorpse != noone
		{
			myColor = c_red
			switchStateTimer = 0;
			instance_destroy(global.myCorpse);
			instance_create_depth(x,y,SortLayer.Above, objCorpseExplosion);
		}
		
	}

break;

case State.Dead:  //================================================================================================================================================================//
myColor = c_white;
break;

case State.Grabbing: //================================================================================================================================================================//
knockback = false;
speed = 0;
myColor = c_white;
var  _avoid = noone;

	switch facing
	{
		case Dir.North: sprite_index = sprPlayerGrabbingN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayerGrabbingS; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayerGrabbingE; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayerGrabbingE; image_xscale = -1; break;
	}
	
	switch facing
	{
		case Dir.North: 
		if !place_meeting(x,y-16, objWall)
		{
			var _avoid = instance_create_depth(x,y-16,SortLayer.Object,objDamage); 
			_avoid.x = x; 
			_avoid.y = y-16; 
		}
			break;
		case Dir.South: 
		if !place_meeting(x,y+16, objWall)
		{
			var _avoid = instance_create_depth(x,y+16,SortLayer.Object,objDamage); 
			_avoid.x = x; 
			_avoid.y = y+16; 
		}
			break;
		case Dir.East: 
		if !place_meeting(x+16,y, objWall)
		{
			var _avoid = instance_create_depth(x+16,y,SortLayer.Object,objDamage); 
			_avoid.x = x+16;
			_avoid.y = y; 
		}
			break;
		case Dir.West: 
		if !place_meeting(x-16,y, objWall)
		{
			var _avoid = instance_create_depth(x-16,y,SortLayer.Object,objDamage); 
			_avoid.x = x-16; 
			_avoid.y = y; 
		}
			break;
	}
	
	if !destroyedGrabbedBall
	{
		///Destroy the grabbed ball
		grabbed = instance_nearest(x,y,objBall);
	
		instance_deactivate_object(grabbed)

		destroyedGrabbedBall = true;
	}
	
	
	//create a new ball
	if !_grab
	{
		sprite_index = sprPlayer;

		
		
		switch facing
		{
			case Dir.North: grabbed.x = x; grabbed.y = y-16; break;
			case Dir.South: grabbed.x = x; grabbed.y = y+16; break;
			case Dir.East: grabbed.x = x+16; grabbed.y = y; break;
			case Dir.West: grabbed.x = x-16; grabbed.y = y; break;

		}
		
		instance_activate_object(grabbed);

		instance_destroy(_avoid);
		destroyedGrabbedBall = false;
		myState = State.Idle;
	}
	
	if _throw
	{
		var _wallBehindMe = true;

		switch facing
		{
			case Dir.North: if !place_meeting(x,y+16,objWall) or place_meeting(x,y+16,objDoor)
								{
								instance_create_depth(x,y+16,depth,objBallThrow);
								_wallBehindMe = false;
								}
								break;
			case Dir.South: if !place_meeting(x,y-16,objWall) or place_meeting(x,y-16,objDoor)
								{
								instance_create_depth(x,y-16,depth,objBallThrow); 
								_wallBehindMe = false;
								}
								break;
			case Dir.East: if !place_meeting(x-16,y,objWall) or place_meeting(x-16,y,objDoor)
							   {
							   instance_create_depth(x-16,y,depth,objBallThrow); 
							   _wallBehindMe = false;
							   }
							   break;
			case Dir.West:  if !place_meeting(x+16,y,objWall) or place_meeting(x+16,y,objDoor)
							   {
							   instance_create_depth(x+16,y,depth,objBallThrow); 
							   _wallBehindMe = false;
							   }
							   break;
		}
	
		
		if !_wallBehindMe
		{
			if _avoid != noone and instance_exists(_avoid)
			{
			instance_destroy(_avoid);
			}
			destroyedGrabbedBall = false;
			myState = State.Throwing;
		}

	}
	

	//movement
	ySpeed = 0;
	xSpeed = 0;
	
	if _avoid != noone and instance_exists(_avoid)
	{
		var _upcheck = place_meeting(_avoid.x, _avoid.y-1, objWall);
		var _downcheck = place_meeting(_avoid.x, _avoid.y+1, objWall);
		var _leftcheck = place_meeting(_avoid.x-1, _avoid.y, objWall);
		var _rightcheck = place_meeting(_avoid.x+1, _avoid.y, objWall);
	}
	else
	{
		var _upcheck = false;
		var _downcheck =  false;
		var _leftcheck =  false;
		var _rightcheck =  false;
	}
	
	if _up and !_upcheck
	{
		ySpeed -= mySpeed;
		

	}
	if _down and !_downcheck
	{
		ySpeed += mySpeed;
	

	}
	
	if _left and !_leftcheck
	{
		xSpeed -= mySpeed;
	

	}
	if _right and !_rightcheck
	{
		xSpeed += mySpeed;
		

	}
	
	move.xSpdYSpd(xSpeed, ySpeed);
	
	
break;

case State.Pushing:  //================================================================================================================================================================//

break;

case State.Throwing: //================================================================================================================================================================//
if createBallAfterTossingInPit
{

	switch facing
	{
		case Dir.North:  instance_create_depth(x,y+16,depth,objBall); break;
		case Dir.South:  instance_create_depth(x,y-16,depth,objBall); break;
		case Dir.East: instance_create_depth(x-16,y,depth,objBall); break;
		case Dir.West:  instance_create_depth(x+16,y,depth,objBall); break;
	}
	createBallAfterTossingInPit = false;
	
}



knockback = false;
	switch facing
	{
		case Dir.North: sprite_index = sprPlayerThrowN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayerThrowS; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayerThrowEW; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayerThrowEW; image_xscale = -1; break;
	}
	
	if switchStateTimer > 8
	{
		myState = State.Idle;
	}
	
break;

case State.InPit: //================================================================================================================================================================//

if createBallAfterTossingInPit
{

	switch facing
	{
		case Dir.North: instance_create_depth(x,y-16,depth,objBall); break;
		case Dir.South:  instance_create_depth(x,y+16,depth,objBall); break;
		case Dir.East: instance_create_depth(x+16,y,depth,objBall); break;
		case Dir.West:  instance_create_depth(x-16,y,depth,objBall); break;
	}
	createBallAfterTossingInPit = false;
	
}

if instance_exists(objBallCarry) && switchStateTimer < 3
{
	with instance_nearest(x,y,objBallCarry)
	{
		instance_create_depth(x,y,depth,objBall);
		instance_destroy();
	}
}


if _up_pressed && facing == Dir.North && !place_meeting(x,y-16,objWall) && switchStateTimer > 5
{
	y -= 16;
	myState = State.Idle;
}
if _down_pressed && facing == Dir.South && !place_meeting(x,y+16,objWall) && switchStateTimer > 5
{
	y += 16;
	myState = State.Idle;
}
if _right_pressed && facing == Dir.East && !place_meeting(x+16,y,objWall) && switchStateTimer > 5
{
	x += 16;
	myState = State.Idle;
}
if _left_pressed && facing == Dir.West && !place_meeting(x-16,y,objWall) && switchStateTimer > 5
{
	x -= 16;
	myState = State.Idle;
}




knockback = false;
speed = 0;
myColor = c_white;

	if _up 
	{

		facing = Dir.North;
		
	} else 
	if _down
	{
		facing = Dir.South;

	} else
	
	if _left
	{
		facing = Dir.West;

	} else
	if _right
	{
		facing = Dir.East;

	}
	
	switch facing
	{
		case Dir.North: sprite_index = sprPlayerInPitN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayerInPitS; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayerInPitEW; image_xscale = 1; break;
		case Dir.West: sprite_index =  sprPlayerInPitEW; image_xscale = -1; break;
	}
	
	if _die
	{
		with instance_nearest(x,y,objPit)
		{
			filledIn = true;
		}
		myState = State.Ghost;
	}
	
	if _grab
	{

		switch facing
		{
			case Dir.North: if place_meeting(x,y-16,objBall){ myState = State.GrabbingInPit; } break;
			case Dir.South: if place_meeting(x,y+16,objBall){ myState = State.GrabbingInPit; } break;
			case Dir.East: if place_meeting(x+16,y,objBall){ myState = State.GrabbingInPit; } break;
			case Dir.West: if place_meeting(x-16,y,objBall){ myState = State.GrabbingInPit; } break;
		}

	}
	
	
break;



case State.GrabbingInPit: //================================================================================================================================================================//


	
	switch facing
	{
		case Dir.North: sprite_index = sprPlayerGrabbingN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayerGrabbingS; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayerGrabbingE; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayerGrabbingE; image_xscale = -1; break;
	}
	
	if _grab
	{
		var _grabbed = instance_nearest(x,y,objBall);
	
		with _grabbed
		{
			instance_destroy()
		}
	}
	
	if !_grab
	{
		var _dmgOffset = 20;
		switch facing
		{
			case Dir.North:  instance_create_depth(x,y+_dmgOffset,depth,objDamage); createBallAfterTossingInPit = true; break;
			case Dir.South: instance_create_depth(x,y-_dmgOffset,depth,objDamage); createBallAfterTossingInPit = true; break;
			case Dir.East: instance_create_depth(x-_dmgOffset,y,depth,objDamage); createBallAfterTossingInPit = true; break;
			case Dir.West: instance_create_depth(x+_dmgOffset,y,depth,objDamage); createBallAfterTossingInPit = true; break;
		}

		myState = State.InPit;
	}
	
	if _throw
	{
		
		var _dmgOffset = 20;
		switch facing
		{
			case Dir.North:  instance_create_depth(x,y+_dmgOffset,depth,objDamage);createBallAfterTossingInPit = true; break;
			case Dir.South: instance_create_depth(x,y-_dmgOffset,depth,objDamage); createBallAfterTossingInPit = true; break;
			case Dir.East: instance_create_depth(x-_dmgOffset,y,depth,objDamage); createBallAfterTossingInPit = true; break;
			case Dir.West: instance_create_depth(x+_dmgOffset,y,depth,objDamage); createBallAfterTossingInPit = true; break;
		}
	
	
		myState = State.Throwing;
	
	}
	

break;
}
