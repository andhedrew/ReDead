damageBox.x = x;
damageBox.y = y;

depth = SortLayer.Object-(y/10);



if move.againstWall.hori == 1 
{
	xSpeed = -moveSpeed;
	image_xscale = -1;
	image_speed = 0.2;
}


if move.againstWall.hori == -1
{
	xSpeed = moveSpeed;
	image_xscale = 1;
	image_speed = 0.2;
}


if move.againstWall.vert == 1
{
	ySpeed = -moveSpeed;
	image_xscale = 1;
	image_speed = 0.2;
}


if move.againstWall.vert == -1
{
	ySpeed = moveSpeed;
	image_xscale = 1;
	image_speed = 0.2;
}


if moveDir != 0 && moveDir != 1 && moveDir != 2 && moveDir != 3
{
	image_speed = 0.05;
	sprite_index = mySleepSprite;
}



move.xSpdYSpd_enemy(xSpeed, ySpeed);

