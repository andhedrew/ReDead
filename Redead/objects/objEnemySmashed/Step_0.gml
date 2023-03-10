staysDownTimer--;
animationTimer--;

if animationTimer < 0
{
	image_speed = .2;
}

if staysDownTimer < 0
{
	if nothing_on_top()
	{
		if place_meeting(x,y,objCorpse)
		{
			var _corpse = instance_nearest(x,y,objCorpse);
			instance_destroy(_corpse);
			instance_create_depth(x,y,SortLayer.Above, objCorpseExplosionBig);
			instance_destroy();
		}
		else
		{
			var _new = instance_create_depth(x,y,SortLayer.Player, objEnemySmashable);
			var _returnDir = returnDir;
			with _new
			{
				moveDir = _returnDir;
				returnDir = _returnDir;
			}
			instance_destroy();
		}
	}
	else
	{
		staysDownTimer = maxStaysDown;
		animationTimer = staysDownTimer-60;
		image_speed = 0;
		image_index = 0;
	}

}