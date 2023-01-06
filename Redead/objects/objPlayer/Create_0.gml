moving = false;

enum State
{
	Idle,
	Walking,
	Ghost,
	Dead,
	Grabbing,
	Pushing,
	Throwing,
	InPit,
	
}

myState = State.Idle;

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