if room == RoomStart
{
	if keyboard_check_pressed(vk_space)
	{
		with objPlayer
		{
			myState = State.Ghost;
		}
		room_goto(Room0)
	}
	
}

depth = SortLayer.Above;


//sound

if objPlayer.myState == State.Throwing && throwsound == false
{
	audio_play_sound(throwing,1,false);
	throwsound = true;
}

if objPlayer.myState != State.Throwing
{
	throwsound = false;
}


roomTimer--;