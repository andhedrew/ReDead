
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
	else
	{
		instance_create_depth(x,y,SortLayer.Object, objBall);
	}
}
