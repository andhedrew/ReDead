
image_speed = .2;

if _up 
{
	if !place_meeting(x, y -_movespeed, objEnemyAvoid)
	{
	y -= _movespeed
	}	else
	{
		_movespeed = -_movespeed;
	}
}
	
if _down
{
	if !place_meeting(x, y+_movespeed, objEnemyAvoid)
	{
	y += _movespeed
	}
		else
	{

		_movespeed = -_movespeed;
	}

}
	
if _left
{
	if !place_meeting(x+_movespeed, y, objEnemyAvoid)
	{
	x += _movespeed
	}	else
	{
		image_xscale = -1;
		_movespeed = -_movespeed;
		_right = true;
		_left = false;
	}
}
if _right
{
	if !place_meeting(x+_movespeed, y, objEnemyAvoid) 
	{
	x += _movespeed
	}
	else
	{
		image_xscale = 1;
		_movespeed = -_movespeed;
		_right = false;
		_left = true;
	}
	
}