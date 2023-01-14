var _speed = 2;
image_speed = 1;



switch facing
{
	case Dir.North: if place_meeting(x,y+1,objDoor) { 
														instance_destroy(objDoor);
														doNotRevive = true;
														with objBallSpawn
														{  if !instance_exists(myBall)
															{ createBall = true;}
														}
														instance_create_depth(x,y,depth,objBallBreak);
														instance_destroy();
													} 
													break;
	case Dir.South: if place_meeting(x,y-1,objDoor) {
														instance_destroy(objDoor);
														doNotRevive = true;
														with objBallSpawn
														{  if !instance_exists(myBall)
															{ createBall = true;}
														}
														instance_create_depth(x,y,depth,objBallBreak);
														instance_destroy();
													} 
													break;
	case Dir.East: if place_meeting(x-1,y,objDoor) {
														instance_destroy(objDoor);
														doNotRevive = true;
														with objBallSpawn
														{  if !instance_exists(myBall)
															{ createBall = true;}
														}
														instance_create_depth(x,y,depth,objBallBreak);
														instance_destroy();
													} 
													break;
	case Dir.West: if place_meeting(x+1,y,objDoor) { 
														instance_destroy(objDoor);
														doNotRevive = true;
														with objBallSpawn
														{  if !instance_exists(myBall)
															{ createBall = true;}
														}
														instance_create_depth(x,y,depth,objBallBreak);
														instance_destroy();
													}
													break;
}

switch facing
{
	case Dir.North: if place_meeting(x,y+1,objWall) { instance_destroy();} break;
	case Dir.South: if place_meeting(x,y-1,objWall) { instance_destroy();} break;
	case Dir.East: if place_meeting(x-1,y,objWall) { instance_destroy();} break;
	case Dir.West: if place_meeting(x+1,y,objWall) { instance_destroy();} break;
}




switch facing
{
	case Dir.North: y+= _speed; break;
	case Dir.South: y-= _speed; break;
	case Dir.East: x-= _speed; break;
	case Dir.West: x+= _speed; break;
}



//destroy if off-screen
var padding = 32;
if x > room_width+padding or 
	x < 0-padding or
	y > room_height+padding or
	y < 0-padding
	{
		with objBallSpawn
			createBall = true;
		instance_destroy();
	}
