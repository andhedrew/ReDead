if myState != State.Ghost
{
	if !haveBeenDamaged
	{
		myHealth--;
		if myHealth <= 0
		{
			
			myState = State.Ghost
			myHealth = myMaxHealth;
		}
		haveBeenDamaged = true;
		alarm[0] = 40;
		
	}
	knockingBack = other;
	speed = 3;
	knockback = true;
	
}