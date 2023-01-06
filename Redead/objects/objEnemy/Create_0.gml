movingDir = irandom_range(1,4);

_movespeed = 1;


_up = false;
_down = false;
_left = false;
_right = false;


switch movingDir
{
	case 1:_up = true; break;
	case 2:_down = true; break;
	case 3:_left = true; break;
	case 4:_right = true; break;
	
	
}

