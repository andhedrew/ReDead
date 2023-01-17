var _invert = invert;

if activated
{
	
	with objPostRetractable2
	{
		activated = !_invert;
	}
}
else
{
	with objPostRetractable2
	{
		activated = _invert;
	}
	
}

if place_meeting(x,y,objBall) or 
   place_meeting(x,y,objEnemy) or 
   place_meeting(x,y,objCorpse) or
   place_meeting(x,y,objBallThrow) or
   place_meeting(x,y,objEnemySmashed)
{
	activated = true;
	image_index = 1;
} 
else if  place_meeting(x,y,objPlayer) and objPlayer.myState != State.Ghost
{
	activated = true;
	image_index = 1;
}
else
{
	activated = false;
	image_index = 0;
}