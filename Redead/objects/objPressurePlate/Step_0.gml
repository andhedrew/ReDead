var _invert = invert;
if activated
{
	
	with objPostRetractable
	{
		if _invert
		{
			activated = false;
		} else
		{
			activated = true;
		}
		
	}
}
else
{
	with objPostRetractable
	{
		if _invert
		{
			activated = true;
		} else
		{
			activated = false;
		}
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
	if !playedSound
	{
		audio_play_sound(dirt,1,false);
		playedSound = true;
	}
} 
else if  place_meeting(x,y,objPlayer) and objPlayer.myState != State.Ghost
{
	activated = true;
	image_index = 1;
	if !playedSound
	{
		audio_play_sound(dirt,1,false);
		playedSound = true;
	}
}
else
{
	activated = false;
	image_index = 0;
	if playedSound
	{
		audio_play_sound(dirt,1,false);
		playedSound = false;
	}
}