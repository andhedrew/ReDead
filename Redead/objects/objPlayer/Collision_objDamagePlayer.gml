if myState != State.Ghost
{
	if !invincibility
	{
		myHealth--;
		if myHealth <= 0
		{
			instance_create_depth(x,y,SortLayer.Above, objPlayerDie);
			myState = State.Ghost
			myHealth = myMaxHealth;
		}
		haveBeenDamaged = true;
		
		if place_meeting(x+16,y,other)
		{
			knockbackX = -knockbackSpd;
			knockbackY = 0;
		} else if place_meeting(x-16,y,other)
		{
			knockbackX = knockbackSpd;
			knockbackY = 0;
		}
		
		if place_meeting(x,y+16,other)
		{
			knockbackY = -knockbackSpd;
			knockbackX = 0;
		} else if place_meeting(x,y-16,other)
		{
			knockbackY = knockbackSpd;
			knockbackX = 0;
		}
		
		if place_meeting(x+16,y+16,other)
		{
			knockbackY = -knockbackSpd;
			knockbackX = -knockbackSpd;
		}
		if place_meeting(x-16,y-16,other)
		{
			knockbackY = knockbackSpd;
			knockbackX = knockbackSpd;
		}
		if place_meeting(x+16,y-16,other)
		{
			knockbackY = knockbackSpd;
			knockbackX = -knockbackSpd;
		}
		if place_meeting(x-16,y+16,other)
		{
			knockbackY = -knockbackSpd;
			knockbackX = knockbackSpd;
		}

		invincibility = true;
		
		alarm[0] = 40;
		
	}

}