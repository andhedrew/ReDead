
if other.stealBallTimer > 10
{
	instance_destroy(other);
	doNotRevive = true;

	with objBallSpawn
	createBall = true;

	instance_destroy();
}