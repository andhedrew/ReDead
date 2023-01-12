moving = false;
xSpeed = 0;
ySpeed = 0;
knockbackX = 0;
knockbackY = 0;
knockbackSpd = 2;
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

myMaxHealth = 6;
myHealth = myMaxHealth;
haveBeenDamaged = false
invincibility = false;


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


move = use_tdmc()
moveGhost = use_tdmc_Solid()


orginX = x;
orginY = y;

createBallAfterTossingInPit = false;
destroyedGrabbedBall = false;
grabbed = noone;