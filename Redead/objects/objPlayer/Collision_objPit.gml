if myState != State.Ghost && myState != State.GrabbingInPit && myState != State.Throwing
{
	if myState == State.Grabbing
	{
		var _ball = instance_nearest(x,y, objBallCarry);
		with _ball
		{
			instance_destroy();
		}
		switch facing
		{
			case Dir.North: instance_create_depth(other.x,other.y-16,depth, objBall); break;
			case Dir.South: instance_create_depth(other.x,other.y+16,depth, objBall); break;
			case Dir.East: instance_create_depth(other.x+16,other.y,depth, objBall); break;
			case Dir.West: instance_create_depth(other.x-16,other.y,depth, objBall); break;
		}

	}
	
		if !other.filledIn
		{
			x = other.x;
			y = other.y;
			myState = State.InPit;
		}

}