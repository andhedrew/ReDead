maxStaysDown = 220;
staysDownTimer = maxStaysDown;
animationTimer = staysDownTimer-60;

image_speed = 0;
image_index = 0;
depth = SortLayer.Ground;


audio_play_sound(ouch,1, false,1,0,(irandom_range(85,95)/100))
audio_play_sound(squashedEnemy,1, false,1,0,(irandom_range(95,105)/100))