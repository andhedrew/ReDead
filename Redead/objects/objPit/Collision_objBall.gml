

if !filledIn
{

	instance_destroy(other);

	instance_create_depth(x,y,depth-1, objBallFallInhole);
}
