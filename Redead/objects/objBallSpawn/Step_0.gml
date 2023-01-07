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
{
	var _ball = instance_create_depth(x,y,depth-1,objBall);
	with _ball
	{
		finalDepth = depth;
		_drawY = startY;
		falling = true;
	}
	createBall = false;
}
