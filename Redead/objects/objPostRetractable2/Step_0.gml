if activated
{
	image_index = 1;
	instance_deactivate_object(wall)
	depth = SortLayer.GroundBelow;
	
}
else
{
	image_index = 0;
	instance_activate_object(wall)
	depth = SortLayer.Object;
	if place_meeting(x,y,objPlayer) && objPlayer.myState != State.Ghost
	{
		with objPlayer
		{
			instance_create_depth(x,y,SortLayer.Above, objPlayerDie);
			myState = State.Ghost
			myHealth = myMaxHealth;
		}
	}
	
}