moving = false;
xSpeed = 0;
ySpeed = 0;
mySpeed = 2;

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
	GrabbingInPit,
	
}

myState = State.Idle;

global.myCorpse = noone;

myMaxHealth = 3;
myHealth = myMaxHealth;
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


knockback = false;
knockingBack = noone;
knockbackAmount = 15;
knockbackTimer = 0;
knockbackDir = 0;


move = use_tdmc()
moveGhost = use_tdmc_Solid()


orginX = x;
orginY = y;