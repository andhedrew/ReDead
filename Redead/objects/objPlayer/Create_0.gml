moving = false;

enum State
{
	Guy,
	Ghost,
	Dead,
	Grabbing,
	Pushing,
	Throwing,
	
	
}

myState = State.Guy;

global.myCorpse = noone;

myHealth = 3;
haveBeenDamaged = false


myColor = c_white;
myAlpha = 1;

ghostTimerMax = 80;
ghostTimer = ghostTimerMax;

enum Dir
{
	North,
	East,
	South,
	West,
	
}

facing = Dir.South;

switchStateTimer = 0;
myStateLastFrame = noone;