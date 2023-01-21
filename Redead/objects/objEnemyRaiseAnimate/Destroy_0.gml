var _enemy = instance_create_depth(x,y,SortLayer.Object, objEnemy);
var _spawnSpeed = spawnSpeed;
with _enemy
{
	spawnSpeed = _spawnSpeed;
}