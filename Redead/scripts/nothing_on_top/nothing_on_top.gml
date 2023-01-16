// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function nothing_on_top(){
	if
	!place_meeting(x,y,objBall) and
	!place_meeting(x,y,objEnemy) and
	!place_meeting(x,y,objBallThrow)
	{
		return true;
	}
	else
	{
		return false;
	}
}