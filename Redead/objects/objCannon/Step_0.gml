firingTimer--;

if firingTimer < 30 and firingTimer > 0
{
	image_index = 1;
} else
{
	image_index = 0;
}

if firingTimer < 0
{
	switch image_angle //these are backwards, because the player facing sets the ball's direction normally.
	{
		case 0:
			var _ball = instance_create_depth(x+16,y,SortLayer.Object, objBallThrow);
			with _ball { facing = Dir.West}
		break;
		case 90:
			var _ball = instance_create_depth(x,y-16,SortLayer.Object, objBallThrow);
			with _ball { facing = Dir.South}
		break;
		case 180:
			var _ball = instance_create_depth(x-16,y,SortLayer.Object, objBallThrow);
			with _ball { facing = Dir.East}
		break;
		case 270:
			var _ball = instance_create_depth(x,y+16,SortLayer.Object, objBallThrow);
			with _ball { facing = Dir.North}
		break;
		
	}
	firingTimer = firingSpeed;
}