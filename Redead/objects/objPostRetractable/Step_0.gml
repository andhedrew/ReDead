if activated
{
	image_index = 1;
	instance_deactivate_object(wall)
	depth = SortLayer.GroundBelow;
	
}
else
{
	image_index = 0;
	instance_activate_object(wall)
	depth = SortLayer.Object;
	
}