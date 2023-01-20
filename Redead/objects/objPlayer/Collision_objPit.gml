


if myState != State.Ghost && myState != State.GrabbingInPit && myState != State.ThrowingInPit && myState != State.Grabbing
{
	
		if !other.filledIn
		{
			x = other.x;
			y = other.y;
			myState = State.InPit;
		}

} else if myState == State.Grabbing
{
	if distance_to_point(other.xx, other.yy) < 1
	
	
	{
		if !other.filledIn
		{
			x = other.x;
			y = other.y;
			myState = State.GrabbingInPit;
		}
		
		

	}
	
}
