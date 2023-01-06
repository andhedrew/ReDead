if myState != State.Ghost
{
	if !haveBeenDamaged
	{
		myHealth--;
		haveBeenDamaged = true;
		alarm[0] = 30;
		
	}
	
	
}