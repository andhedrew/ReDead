if myState != State.Ghost && myState != State.GrabbingInPit && myState != State.Throwing
{
	if !other.filledIn
	{
		x = other.x;
		y = other.y;
		myState = State.InPit;
	}
}