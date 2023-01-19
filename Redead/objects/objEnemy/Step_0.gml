damageBox.x = x;
damageBox.y = y;




move.xSpdYSpd_enemy(xSpeed, ySpeed);


if move.againstWall.hori == 1 
{
	xSpeed = -moveSpeed;
	image_xscale = -1;
}


if move.againstWall.hori == -1
{
	xSpeed = moveSpeed;
	image_xscale = 1;
}


if move.againstWall.vert == 1
{
	ySpeed = -moveSpeed;
	image_xscale = 1;
}


if move.againstWall.vert == -1
{
	ySpeed = moveSpeed;
	image_xscale = 1;
}


if moveDir != 0 && moveDir != 1 && moveDir != 2 && moveDir != 3
{

}

