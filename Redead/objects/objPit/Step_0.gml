if filledIn
{
	audio_play_sound(dirt,2,false);
	instance_create_depth(x,y,depth, objPitClosed)
	instance_destroy();
}