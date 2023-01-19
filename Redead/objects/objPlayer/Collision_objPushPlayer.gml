if myState != State.Ghost
{

		haveBeenDamaged = true;
		
		if place_meeting(x+16,y,other)
		{
			knockbackX = -knockbackSpd;
			knockbackY = 0;
		} else if place_meeting(x-16,y,other)
		{
			knockbackX = knockbackSpd;
			knockbackY = 0;
		}
		
		if place_meeting(x,y+16,other)
		{
			knockbackY = -knockbackSpd;
			knockbackX = 0;
		} else if place_meeting(x,y-16,other)
		{
			knockbackY = knockbackSpd;
			knockbackX = 0;
		}
		
		if place_meeting(x+16,y+16,other)
		{
			knockbackY = -knockbackSpd;
			knockbackX = -knockbackSpd;
		}
		if place_meeting(x-16,y-16,other)
		{
			knockbackY = knockbackSpd;
			knockbackX = knockbackSpd;
		}
		if place_meeting(x+16,y-16,other)
		{
			knockbackY = knockbackSpd;
			knockbackX = -knockbackSpd;
		}
		if place_meeting(x-16,y+16,other)
		{
			knockbackY = -knockbackSpd;
			knockbackX = knockbackSpd;
		}

		var _1 = 98;
		var _2 = 115;
		audio_play_sound(ouch,1,false,1,0,(irandom_range(_1,_2)/100));
}