if activated
{
	

	image_index = 1;
	instance_deactivate_object(wall)
	depth = SortLayer.GroundBelow;

	
}
else 
{
	if !place_meeting(x,y,objBall) and !place_meeting(x,y,objEnemy) and !place_meeting(x,y,objBallThrow) and !place_meeting(x,y,objCorpse) and !place_meeting(x,y,objPlayer)
	{
		image_index = 0;
		instance_activate_object(wall)
		depth = SortLayer.Object-(y/10);
	}

}