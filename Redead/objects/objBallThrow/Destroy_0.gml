
if !doNotRevive
{
	var xx = x;
	var yy = y;
	if playerThrewMe
	{
		with objPlayer
		{
			
			grabbed.x = xx;
			grabbed.y = yy;
			instance_activate_object(grabbed);

		}
	}

}


