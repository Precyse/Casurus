// Get Inputs
get_controls();

x = clamp(x, 0, room_width);
y = clamp(y, 0, room_height);

// X Movement
	//Direction
	moveDir = rightKey - leftKey;

	if moveDir != 0 {face = moveDir; };
	
	//Get xspd
	xspd = moveDir * moveSpd;
	
	var _subPixel = .5;
	if place_meeting(x + xspd, y, obj_floor){
		var _pixelCheck = _subPixel * sign(xspd);
		while !place_meeting(x + _pixelCheck,y,obj_floor){
			x += _pixelCheck;
		}
		xspd = 0;
	}
	x += xspd;

// Y Movement
	// Gravity
	if coyoteHangTimer > 0{
		coyoteHangTimer--;
	} else {
		setOnGround(false);
	}
	
	yspd += grav
	//Reset jump
	if onGround{
		jumpCount = 0;
		coyoteJumpTimer = coyoteJumpFrames;
	} else {
		coyoteJumpFrames--;
		if jumpCount == 0  && coyoteJumpTimer <= 0 { jumpCount = 1; };
	}
	//Jump
	if jumpKeyBuffered && jumpCount < jumpMax{
		
		global.stamina -= 5;
		
		jumpKeyBuffered = false;
		jumpKeyBufferTimer = 0;
		
		jumpCount++;
		
		yspd = jspd;
		
	}
	if yspd > termVel{yspd = termVel}
	
	// Y Collision
	var _subPixel = .5;
	if place_meeting(x, y + yspd, obj_floor){
		var _pixelCheck = _subPixel * sign(yspd);
		while !place_meeting(x,y + _pixelCheck, obj_floor){
			y += _pixelCheck;
		}
		yspd = 0;
	}
	// Set if im on the ground
	if yspd >= 0 && place_meeting(x, y+1, obj_floor){
		setOnGround(true);
	}
	y += yspd;
	
//Attacking
if(keyboard_check_pressed(ord("F")) && canAttack == true){
	isAttacking = true;
	alarm[0] = 30;
	global.stamina -= 10;
	var attack = instance_create_layer(x+30, y+5, "Instances", obj_attack);
	attack.direction = image_xscale;
}
if((yspd > 0 || yspd < 0) && isAttacking == true){
	yspd = 0;
	grav = 0;
	alarm[1] = 20;
	sprite_index = attackSpr;
}

//Stamina Control
if global.stamina <= 80 && (sprite_index = idleSpr || sprite_index = runSpr){
	global.stamina += 0.5;
	canJump = true;
	canAttack = true;
}
if global.stamina <= 0{
	canAttack = false;
	canJump = false;
}


// Animation Control
if abs(xspd) > 0 {
	sprite_index = runSpr; 
	if !audio_is_playing(snd_player_run){
		audio_play_sound(snd_player_run,false,false);
	}
}
if xspd == 0 {sprite_index = idleSpr; };

if yspd > 0 {sprite_index = fallSpr; }; 

if yspd < 0 {
	sprite_index = jumpSpr; 
	}

if isAttacking == true {
	sprite_index = attackSpr; 
	if !audio_is_playing(snd_attack){
		audio_play_sound(snd_attack,false,false);
	}
}

if health <= 0 {
	sprite_index = deathSpr;
	audio_play_sound(snd_death,false,false);
}
	
 
mask_index = idleSpr;
