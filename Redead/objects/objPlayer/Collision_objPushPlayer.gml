if myState != State.Ghost
{
	if !invincibility
	{
		
		haveBeenDamaged = true;
		
		knockbackX =0;
		knockbackY =0;
		
		if place_meeting(x+16,y,other)
		{
			knockbackX = -knockbackSpd;
			
		} else if place_meeting(x-16,y,other)
		{
			knockbackX = knockbackSpd;
		}
		
		if place_meeting(x,y+16,other)
		{
			knockbackY = -knockbackSpd;
			
		} else if place_meeting(x,y-16,other)
		{
			knockbackY = knockbackSpd;
	
		}
	
		var _1 = 98;
		var _2 = 115;
		audio_play_sound(impact,1,false,1,0,(irandom_range(_1,_2)/100));
		invincibility = true;
		
		
		alarm[0] = 40;
		
	}

}