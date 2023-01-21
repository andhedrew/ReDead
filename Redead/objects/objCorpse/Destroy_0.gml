if !skipDeathAnimation
instance_create_depth(x,y,depth, objCorpseAnimate);

if createEnemy
{
	instance_create_depth(x,y,depth, objEnemyRaiseAnimate);
	if spawnSpeed != 0
	{
		other.spawnSpeed = spawnSpeed;
	}
}