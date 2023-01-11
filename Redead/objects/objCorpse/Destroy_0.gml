if !skipDeathAnimation
instance_create_depth(x,y,depth, objCorpseAnimate);

if createEnemy
{
	instance_create_depth(x,y,depth, objEnemyRaiseAnimate);
}