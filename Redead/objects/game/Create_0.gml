enum SortLayer
{
	Above = -100,
	Player = 0,
	Object = 50,
	Ground = 80,
	GroundBelow = 90,
	Background = 300,
}
audio_group_load(Music);
audio_group_load(Sound);
audio_play_sound(SoundtrackLOOP,1,true);


throwsound = false;
grabSound = false;
