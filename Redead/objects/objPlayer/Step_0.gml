var _up = keyboard_check(vk_up);
var _down = keyboard_check(vk_down);
var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _grab = keyboard_check(ord("X"));
var _throw = keyboard_check_pressed(ord("Z"));
var _die = keyboard_check_pressed(vk_space);



var _up_pressed = keyboard_check_pressed(vk_up);
var _down_pressed = keyboard_check_pressed(vk_down);
var _left_pressed = keyboard_check_pressed(vk_left);
var _right_pressed = keyboard_check_pressed(vk_right);

if room != roomLastFrame
{
	cancelMovement = true;
}
if !_up and !_down and !_left and !_right
{
	cancelMovement = false;
}

if cancelMovement
{
	
	var _up = false;
	var _down =  false;
	var _left =  false;
	var _right =  false;
	var _grab =  false;
	var _throw =  false;
	var _die =  false;
} 

roomLastFrame = room;


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
	sprite_index = sprPlayerIdle;
	image_speed = 0;
	image_index = 0;

	xSpeed = 0;
	ySpeed = 0;

	switch facing
	{
		case Dir.North: sprite_index = sprPlayerNIdle; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayerIdle; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayerIdle; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayerIdle; image_xscale = -1; break;
	}
	
	myAlpha = 1;
		
	if _die  and !place_meeting(x,y,objCorpse)
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
	
	if _die and !place_meeting(x,y,objCorpse)
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
	if switchStateTimer < 2
	{
		audio_play_sound(deathPlayer,1,false);
		audio_play_sound(moan,0,false);
	}
	
	knockback = false;
	depth = SortLayer.Player;
	if switchStateTimer > 60
	{
		myColor = c_white;
	}
	sprite_index = sprGhost;
	myAlpha = 0.4;
	speed = 0;
	image_speed = 0.03;
	
	
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
	

	moveGhost.xSpdYSpd_solid(xSpeed, ySpeed);
	
	
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
				
			audio_play_sound(revivePlayer,1,false);
		
	
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
if switchStateTimer < 2
{
	audio_play_sound(grab,1,false);
}

if _down or _up or _left or _right
{
	image_speed = 0.2;
} else
{
	image_speed = 0;
	image_index = 0;
}

myColor = c_white;
var  _avoid = noone;

	switch facing
	{
		case Dir.North: sprite_index = sprPlayerGrabbingN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayerGrabbingS; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayerGrabbingE; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayerGrabbingW; image_xscale = -1; break;
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
		audio_play_sound(grab,1,false);
		myState = State.Idle;
	}
	
	if _throw
	{
		var _wallBehindMe = true;

		switch facing
		{
			case Dir.North: if !place_meeting(x,y+16,objWall) or place_meeting(x,y+16,objDoor) or place_meeting(x,y+16,objGravestone)
								{
								var _ball = instance_create_depth(x,y+16,depth,objBallThrow);
								with _ball { playerThrewMe = true; }
								_wallBehindMe = false;
								}
								break;
			case Dir.South: if !place_meeting(x,y-16,objWall) or place_meeting(x,y-16,objDoor) or place_meeting(x,y-16,objGravestone)
								{
								var _ball = instance_create_depth(x,y-16,depth,objBallThrow); 
								with _ball { playerThrewMe = true; }
								_wallBehindMe = false;
								}
								break;
			case Dir.East: if !place_meeting(x-16,y,objWall) or place_meeting(x-16,y,objDoor) or place_meeting(x-16,y,objGravestone)
							   {
							  var _ball =  instance_create_depth(x-16,y,depth,objBallThrow); 
							  with _ball { playerThrewMe = true; }
							   _wallBehindMe = false;
							   }
							   break;
			case Dir.West:  if !place_meeting(x+16,y,objWall) or place_meeting(x+16,y,objDoor) or place_meeting(x+16,y,objGravestone)
							   {
							   var _ball = instance_create_depth(x+16,y,depth,objBallThrow); 
							   with _ball { playerThrewMe = true; }
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
	
	var _slowerSpeed = mySpeed/2;
	if _up and !_upcheck
	{
		ySpeed -= _slowerSpeed;
		

	}
	if _down and !_downcheck
	{
		ySpeed += _slowerSpeed;
	

	}
	
	if _left and !_leftcheck
	{
		xSpeed -= _slowerSpeed;
	

	}
	if _right and !_rightcheck
	{
		xSpeed += _slowerSpeed;
		

	}
	
	
	if haveBeenDamaged
	{
		
		xSpeed = knockbackX;
		ySpeed = knockbackY;
		
		knockbackX = lerp(knockbackX, 0, 0.2)
		knockbackY = lerp(knockbackY, 0, 0.2)
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
		case Dir.North: grabbed.x = x; grabbed.y = y+16; break;
		case Dir.South: grabbed.x = x; grabbed.y = y-16; break;
		case Dir.East: grabbed.x = x-16; grabbed.y = y; break;
		case Dir.West: grabbed.x = x+16; grabbed.y = y; break;

	}
	instance_activate_object(grabbed);
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

case State.ThrowingInPit: //================================================================================================================================================================//
if createBallAfterTossingInPit
{

	switch facing
	{
		case Dir.North: grabbed.x = x; grabbed.y = y+16; break;
		case Dir.South: grabbed.x = x; grabbed.y = y-16; break;
		case Dir.East: grabbed.x = x-16; grabbed.y = y; break;
		case Dir.West: grabbed.x = x+16; grabbed.y = y; break;

	}
	instance_activate_object(grabbed);
	createBallAfterTossingInPit = false;
	
}



knockback = false;
	switch facing
	{
		case Dir.North: sprite_index = sprPlayerThrowInPitN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayerThrowInPitS; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayerThrowInPitEW; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayerThrowInPitEW; image_xscale = -1; break;
	}
	
	if switchStateTimer > 8
	{
		myState = State.Idle;
	}
	
break;

case State.InPit: //================================================================================================================================================================//
if switchStateTimer < 2
{
	audio_play_sound(dirt, 1, false);
}

if createBallAfterTossingInPit
{

	switch facing
	{
		case Dir.North: grabbed.x = x; grabbed.y = y-16; break;
		case Dir.South: grabbed.x = x; grabbed.y = y+16; break;
		case Dir.East: grabbed.x = x+16; grabbed.y = y; break;
		case Dir.West: grabbed.x = x-16; grabbed.y = y; break;

	}
	instance_activate_object(grabbed);
	createBallAfterTossingInPit = false;
	
}


if _up_pressed && facing == Dir.North && !place_meeting(x,y-16,objWall) && switchStateTimer > 5 && !place_meeting(x,y-16,objSpikes)
{
	y -= 16;
	myState = State.Idle;
}
if _down_pressed && facing == Dir.South && !place_meeting(x,y+16,objWall) && switchStateTimer > 5 && !place_meeting(x,y+16,objSpikes)
{
	y += 16;
	myState = State.Idle;
}
if _right_pressed && facing == Dir.East && !place_meeting(x+16,y,objWall) && switchStateTimer > 5 && !place_meeting(x+16,y,objSpikes)
{
	x += 16;
	myState = State.Idle;
}
if _left_pressed && facing == Dir.West && !place_meeting(x-16,y,objWall) && switchStateTimer > 5 && !place_meeting(x-16,y,objSpikes)
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


	if switchStateTimer < 2
	{
		audio_play_sound(grab,1,false);
	}

	
	switch facing
	{
		case Dir.North: sprite_index = sprPlayerGrabbingInPitN; image_xscale = 1; break;
		case Dir.South: sprite_index = sprPlayerGrabbingInPitS; image_xscale = 1; break;
		case Dir.East: sprite_index = sprPlayerGrabbingInPitE; image_xscale = 1; break;
		case Dir.West: sprite_index = sprPlayerGrabbingInPitW; image_xscale = -1; break;
	}
	
	if !destroyedGrabbedBall
	{
		///Destroy the grabbed ball
		grabbed = instance_nearest(x,y,objBall);
	
		instance_deactivate_object(grabbed)

		destroyedGrabbedBall = true;
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
		destroyedGrabbedBall = false;
		audio_play_sound(grab,1,false);
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
	
		destroyedGrabbedBall = false;
		myState = State.ThrowingInPit;
	
	}
	

break;
case State.FLAMEMODEON: //================================================================================================================================================================//

	knockback = false;
	depth = SortLayer.Above-1;
	sprite_index = sprGhostMAD;
	myAlpha = 1;
	
	
	if flameModeDamage != noone
	{
		instance_destroy(flameModeDamage);
	}
	
	flameModeDamage = instance_create_depth(x,y,depth, objDamage)
		flameModeDamage.x = x;
		flameModeDamage.y = y;
	

	
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
	

	moveGhost.xSpdYSpd_solid(xSpeed, ySpeed);
	
	
	instance_create_depth(x,y,SortLayer.Above, objPlayerDie);
		
	if _die or _grab
	{
		instance_create_depth(x,y,SortLayer.Above, objCorpseExplosion);
	}
	
	if switchStateTimer > 120
	{
		myState = State.Ghost;
	}
	if place_meeting(x,y,objGhostFlameMode)
	{
		switchStateTimer = 0;
	}
break;
}
