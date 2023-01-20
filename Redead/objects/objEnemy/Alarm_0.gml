switch moveDir

{
	case 0: xSpeed = moveSpeed; ySpeed = 0; break;
	case 1: xSpeed = 0; ySpeed = moveSpeed; break;
	case 2: xSpeed = -moveSpeed; ySpeed = 0; break;
	case 3: xSpeed = 0; ySpeed = -moveSpeed; break;
	default: xSpeed = 0; ySpeed = 0;sprite_index = mySleepSprite; break;

}