

instance_destroy(other);
doNotRevive = true;

with objBallSpawn
{
	if !instance_exists(myBall)
	{
		createBall = true;
	}
}

instance_destroy();

