if !falling
{
_drawY = y;
}
else
{
	depth = -1000;
	if _drawY < _targetY
	{
		_drawY += mySpeed;
		
		mySpeed = lerp(mySpeed, myMaxSpeed, 0.1);
	}
	else
	{
		falling = false;
		depth = finalDepth;
	}

}



draw_sprite(sprite_index, image_index,x,_drawY)