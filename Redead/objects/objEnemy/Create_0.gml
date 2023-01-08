moveSpeed = 1;


switch moveDir

{
	case 0: xSpeed = moveSpeed; ySpeed = 0; break;
	case 1: xSpeed = 0; ySpeed = moveSpeed; break;
	case 2: xSpeed = -moveSpeed; ySpeed = 0; break;
	case 3: xSpeed = 0; ySpeed = -moveSpeed; break;
	
	
}

xSpeed = moveSpeed;
ySpeed = 0;


depth = SortLayer.Object;

move = use_tdmc_enemy()