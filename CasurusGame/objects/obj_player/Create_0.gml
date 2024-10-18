function setOnGround(_val = true_){
	if _val = true{
		onGround = true;
		coyoteHangTimer = coyoteHangFrames;
	} else {
		onGround = false;
		coyoteHangTimer = 0;
	}
}

controlSetup();

//Sprites
idleSpr = spr_player;
runSpr = spr_running;
deathSpr = spr_death;
jumpSpr = spr_jump;
attackSpr = spr_attack;
fallSpr = spr_fall;


health = 100;
global.stamina = 80;

//Movement
face = 1;
xspd = 0;
moveDir = 0;
moveSpd = 3;

//Attacking
isAttacking = false;

// Jumping
yspd = 0;
grav = 0.275;
jspd = -4.5;
termVel = 5;
jumpMax = 2;
jumpCount = 0;
jumpHoldTimer = 0;
jumpHoldFrames = 18;
onGround = true;

//Coyote Time
	//Hang Time
	coyoteHangFrames = 2;
	coyoteHangTimer = 0;

	//Jump Time
	coyoteJumpFrames = 5;
	coyoteJumpTimer = 0;
