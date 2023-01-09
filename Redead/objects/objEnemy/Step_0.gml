damageBox.x = x;
damageBox.y = y;


image_speed = .2;

move.xSpdYSpd(xSpeed, ySpeed);


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