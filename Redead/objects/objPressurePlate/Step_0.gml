if activated
{
	with objPostRetractable
	{
		activated = true;
	}
}
else
{
	with objPostRetractable
	{
		activated = false;
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