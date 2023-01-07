instance_destroy(other);
doNotRevive = true;

with objBallSpawn
createBall = true;


instance_create_depth(x,y,depth,objBallBreak);


instance_destroy();
