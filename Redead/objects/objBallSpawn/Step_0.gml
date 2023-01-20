var _margin = 4;
if createBall 
&& !place_meeting(x,y,objPlayer) 
&& !place_meeting(x,y,objEnemy)
&& !place_meeting(x+_margin,y,objPlayer)
&& !place_meeting(x-_margin,y,objPlayer)
&& !place_meeting(x,y+_margin,objPlayer)
&& !place_meeting(x,y-_margin,objPlayer)
&& !place_meeting(x+_margin,y,objEnemy)
&& !place_meeting(x-_margin,y,objEnemy)
&& !place_meeting(x,y+_margin,objEnemy)
&& !place_meeting(x,y-_margin,objEnemy)
&& !instance_exists(myBall)
{
	myBall = instance_create_depth(x,y,depth-1,objBallGrow);
	//with myBall
	//{

	//	finalDepth = depth;
	//	_drawY = startY;
	//	falling = true;
	//}
	createBall = false;
}
