if activated
{
	image_index = 1;
	instance_deactivate_object(wall)
	depth = SortLayer.GroundBelow;
	
}
else
{
	image_index = 0;
	instance_activate_object(wall)
	depth = SortLayer.Object-(y/10);
	if place_meeting(x,y,objPlayer) && objPlayer.myState != State.Ghost
	{
		with objPlayer
		{
			instance_create_depth(x,y,SortLayer.Above, objPlayerDie);
			myState = State.Ghost
			myHealth = myMaxHealth;
		}
	}
	if place_meeting(x,y,objBall)
	{
		var _ball = instance_nearest(x,y,objBall)
		instance_create_depth(x,y,depth,objBallBreak);
		audio_play_sound(ballRunningIntoWall,1,false);
		with objBallSpawn
		{  if !instance_exists(myBall)
			{ createBall = true;}
		}
		instance_destroy(_ball)
	}
	
	if place_meeting(x,y,objEnemy)
	{
		var _objEnemy = instance_nearest(x,y,objEnemy)
		instance_create_depth(x,y,depth,objEnemyDie);
		instance_destroy(_objEnemy)
	}
	
	if place_meeting(x,y,objBallThrow)
	{
		var _ball = instance_nearest(x,y,objBallThrow)
		instance_create_depth(x,y,depth,objBallBreak);
		audio_play_sound(ballRunningIntoWall,1,false);
		with objBallSpawn
		{  if !instance_exists(myBall)
			{ createBall = true;}
		}
		instance_destroy(_ball)
	}
	if place_meeting(x,y,objCorpse)
	{
		var _objCorpse = instance_nearest(x,y,objCorpse)
		instance_create_depth(x,y,depth,objEnemyDie);
		instance_destroy(_objCorpse)
	}
	
	
}