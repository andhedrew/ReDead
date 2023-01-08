


if myState != State.Ghost && myState != State.GrabbingInPit && myState != State.Throwing && myState != State.Grabbing
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
		
		sprite_index = sprPlayer;
		switch facing
		{
			case Dir.North: instance_create_depth(x,y-16,SortLayer.Object,objBall); break;
			case Dir.South: instance_create_depth(x,y+16,SortLayer.Object,objBall); break;
			case Dir.East: instance_create_depth(x+16,y,SortLayer.Object,objBall); break;
			case Dir.West: instance_create_depth(x-16,y,SortLayer.Object,objBall); break;
		}
	}
	
}
