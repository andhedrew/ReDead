
if !instance_exists(myBall) or myBall == noone
{
	firingTimer--;

	if firingTimer < 30 and firingTimer > 0
	{
		image_index = 1;
	} else
	{
		image_index = 0;
	}
} else
{
	image_index = 0;
	firingTimer = firingSpeed;
}

if firingTimer < 0
{
	if !instance_exists(myBall) or myBall == noone
	{
		
		switch image_angle //these are backwards, because the player facing sets the ball's direction normally.
		{
			case 0:
				myBall = instance_create_depth(x+16,y,SortLayer.Object, objBallThrow);
				with myBall { facing = Dir.West; myCannon = id;}
			break;
			case 90:
				myBall = instance_create_depth(x,y-16,SortLayer.Object, objBallThrow);
				with myBall { facing = Dir.South;  myCannon = id;}
			break;
			case 180:
				myBall = instance_create_depth(x-16,y,SortLayer.Object, objBallThrow);
				with myBall { facing = Dir.East;  myCannon = id;}
			break;
			case 270:
				myBall = instance_create_depth(x,y+16,SortLayer.Object, objBallThrow);
				with myBall { facing = Dir.North;  myCannon = id;}
			break;
		
		}
	}
	firingTimer = firingSpeed;
}
