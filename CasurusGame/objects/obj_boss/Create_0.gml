obj_boss.health = 100;
direction = 0;

move_x = 0;
move_y = 0;

canAttack = true;
cooldown = false;
canMove = true;

groundPoundReady = true;
teleportReady = true;

groundPoundHeight = -100; 
groundPoundDamage = 10;  
isGroundPounding = false;

teleportCooldown = 200; 
groundPoundCooldown = 500; 

isFloating = false; // To track floating state
floatDuration = 30; // Duration to float (frames)
floatCounter = 0; // Frame counter for floating