if instance_exists(objPlayer) and room != Room0
{
	if objPlayer.myState != State.Ghost
	{
		var _i = 0;
		var _xpadding = 15;
		var _xStart = 1;
		var _y = 0;
		repeat objPlayer.myMaxHealth
		{
			draw_sprite_ext(sprHeart,1,_xStart+(_xpadding*_i), _y,1,1,0,c_white,1);
			_i++;
		}
		var _i = 0;
		repeat objPlayer.myHealth
		{
			draw_sprite_ext(sprHeart,0,_xStart+(_xpadding*_i), _y,1,1,0,c_white,1);
			_i++;
		}
	}
	
	
}