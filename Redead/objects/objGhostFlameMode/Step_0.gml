if place_meeting(x,y,objPlayer) && objPlayer.myState == State.Ghost
{
	with objPlayer
	{
		myState = State.FLAMEMODEON;
	}
	
}