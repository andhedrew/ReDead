var _up = false;
var _down = false;
var _left = false;
var _right = true;



if _up 
{
	if !place_meeting(x, y -_movespeed, objWall) && !place_meeting(x, y -_movespeed, objBallCarry)
	y -= _movespeed
}
	
if _down
{
if !place_meeting(x, y+_movespeed, objWall) && !place_meeting(x, y+_movespeed, objBallCarry)
	y += _movespeed
}
	
if _left
{
	if !place_meeting(x-_movespeed, y, objWall) && !place_meeting(x-_movespeed, y, objBallCarry)
	x -= _movespeed
}
if _right
{
	if !place_meeting(x+_movespeed, y, objWall) && !place_meeting(x+_movespeed, y, objBallCarry)
	{
	x += _movespeed
	}
	else
	{
		image_xscale = -image_xscale;
		_movespeed = -_movespeed;
	}
	
}