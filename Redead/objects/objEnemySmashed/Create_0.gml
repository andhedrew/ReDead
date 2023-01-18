maxStaysDown = 220;
staysDownTimer = maxStaysDown;
animationTimer = staysDownTimer-60;

image_speed = 0;
image_index = 0;
depth = SortLayer.Ground;

audio_play_sound(squashedEnemy,1, false)