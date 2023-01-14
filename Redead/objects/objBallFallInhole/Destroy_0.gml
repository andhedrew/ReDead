with objBallSpawn
{
	if !instance_exists(myBall)
	{
		createBall = true;
	}
}

if place_meeting(x,y,objPlayer)
{
	with instance_nearest(x,y,objPit)
	{
		filledIn = true;
	}
	with objPlayer
	{
		myState = State.Ghost;
	}
}