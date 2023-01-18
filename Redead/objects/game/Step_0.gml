if room == Room0
{
	if keyboard_check_pressed(vk_space)
	{
		room_goto(Room1)
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

