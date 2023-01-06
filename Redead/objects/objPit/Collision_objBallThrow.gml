

if !filledIn
{

	with other
	{
		 doNotRevive = true;

	}

	instance_destroy(other);

	instance_create_depth(x,y,depth-1, objBallFallInhole);
}
