if myState != State.Ghost 
{
	if !other.filledIn
	{
		x = other.x;
		y = other.y;
		myState = State.InPit;
	}
}