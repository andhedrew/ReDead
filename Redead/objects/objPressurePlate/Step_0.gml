var _invert = invert;

if activated
{
	
	with objPostRetractable
	{
		activated = !_invert;
	}
}
else
{
	with objPostRetractable
	{
		activated = _invert;
	}
	
}

if place_meeting(x,y,objPlayer) or 
   place_meeting(x,y,objBall) or 
   place_meeting(x,y,objEnemy) or 
   place_meeting(x,y,objCorpse) or
   place_meeting(x,y,objBallThrow)
{
	activated = true;
	image_index = 1;
}
else
{
	activated = false;
	image_index = 0;
}