if instance_exists(objPlayer) and room != RoomStart and room != RoomFinalScreen
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


if objPlayer.myState == State.Ghost && !instance_exists(objCorpse) && !instance_exists(objGravestone)& !instance_exists(objEnemyLeavesCorpse)
{
draw_set_font(fntBebasbig)
draw_text(1.5*16,8*16,"Press R to restart room");
draw_set_font(fntBebas)
}


if room == RoomFinalScreen
{
	draw_set_font(fntBebasbig);
	var _y = 120;
	
	draw_text(10, (room_height/2), "Drawing, thinking, designing,")
	draw_text(10, (room_height/2)+16, "and programming mistakes:")
	draw_text(10, (room_height/2)+16+25, "ANDREW MILLER,")
	draw_text(10, (room_height/2)+16+25+16, "Hermit Gamesmith")
}

