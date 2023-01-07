
if other.stealBallTimer > 10
{
	with other
	{
		skipDeathAnimation = false;
	}
	instance_destroy(other);
	doNotRevive = true;

	with objBallSpawn
	createBall = true;

	instance_destroy();
}