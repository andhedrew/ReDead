if y > targetY+1 && !hitTarget
{
	y = lerp(y, targetY, 0.2)
} else if timer > 15
{
	hitTarget = true;
	y = lerp(y, startingY, 0.2+(y/500))
	
	if y >= startingY-1
	{
		instance_destroy();
	}
	
}else
{
	y = targetY;
}



timer ++;