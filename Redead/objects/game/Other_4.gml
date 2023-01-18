if instance_exists(objPlayerStartPos)
{
	objPlayer.x = objPlayerStartPos.x;
	objPlayer.y = objPlayerStartPos.y;
	objPlayer.depth = SortLayer.Player;

}

objPlayer.myState = State.Idle;