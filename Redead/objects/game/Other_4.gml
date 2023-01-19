if instance_exists(objPlayerStartPos)
{
	objPlayer.x = objPlayerStartPos.x;
	objPlayer.y = objPlayerStartPos.y;
	objPlayer.depth = SortLayer.Player;

}

if room == Room0
{
	objPlayer.myState = State.Ghost;
} else
{
	objPlayer.myState = State.Idle;
}

roomTimer = 60*60;