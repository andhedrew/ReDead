var _speed = 3;
image_speed = 1;




switch facing
{
	case Dir.North: if place_meeting(x,y-1,objWall) { instance_destroy();} break;
	case Dir.South: if place_meeting(x,y+1,objWall) { instance_destroy();} break;
	case Dir.East: if place_meeting(x+1,y,objWall) { instance_destroy();} break;
	case Dir.West: if place_meeting(x-1,y,objWall) { instance_destroy();} break;
}


switch facing
{
	case Dir.North: y+= _speed; break;
	case Dir.South: y-= _speed; break;
	case Dir.East: x-= _speed; break;
	case Dir.West: x+= _speed; break;
}




