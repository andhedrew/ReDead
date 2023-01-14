

if !filledIn
{

	with other
	{
		 doNotRevive = true;
		 if !playerThrewMe
			instance_destroy(myDamageBox)
	}

	instance_destroy(other);

	instance_create_depth(x,y,depth-1, objBallFallInhole);
	
	
}
