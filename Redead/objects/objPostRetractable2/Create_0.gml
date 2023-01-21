/// @description Insert description here
// You can write your code in this editor




// Inherit the parent event
event_inherited();
image_speed = 0;
image_index = 0;

activated = false;

wall = instance_create_depth(x,y,depth,objWallInvisible);


depth = SortLayer.Object-(y/10);