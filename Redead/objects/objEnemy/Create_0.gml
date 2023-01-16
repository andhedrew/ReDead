moveSpeed = 1;


xSpeed = 0;
ySpeed = 0;

switch moveDir

{
	case 0: xSpeed = moveSpeed; ySpeed = 0; break;
	case 1: xSpeed = 0; ySpeed = moveSpeed; break;
	case 2: xSpeed = -moveSpeed; ySpeed = 0; break;
	case 3: xSpeed = 0; ySpeed = -moveSpeed; break;

}




depth = SortLayer.Object;

move = use_tdmc_enemy()

damageBox = instance_create_depth(x,y,depth,objDamagePlayer);

image_speed = .2;