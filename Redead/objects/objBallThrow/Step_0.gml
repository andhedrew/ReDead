var _speed = 3;
image_speed = 1;

switch facing
{
	case Dir.North: y+= _speed; break;
	case Dir.South: y-= _speed; break;
	case Dir.East: x-= _speed; break;
	case Dir.West: x+= _speed; break;
}

