if createBall 
&& !place_meeting(x,y,objPlayer) 
&& !place_meeting(x,y,objEnemy)
&& !place_meeting(x+8,y,objPlayer)
&& !place_meeting(x-8,y,objPlayer)
&& !place_meeting(x,y+8,objPlayer)
&& !place_meeting(x,y-8,objPlayer)
&& !place_meeting(x+8,y,objEnemy)
&& !place_meeting(x-8,y,objEnemy)
&& !place_meeting(x,y+8,objEnemy)
&& !place_meeting(x,y-8,objEnemy)
{
	instance_create_depth(x,y,depth-1,objBall);
	createBall = false;
}