// Apply Gravity
if (place_meeting(x, y+1, obj_floor) && vspeed >= 0) {						
    vspeed = 0; // Reset vertical speed when hitting the floor
    
    // Check if currently performing a ground pound
    if (isGroundPounding) {
        if (distance_to_object(obj_player) < 30) {
            health -= groundPoundDamage;
            canMove = false;
            alarm[1] = 100; // Delay after hitting the player
        }
        
        // Reset ground pound states
		if !audio_is_playing(snd_boss_groundpound){
			audio_play_sound(snd_boss_groundpound,false,false);
		}
        isGroundPounding = false;
        groundPoundReady = false;  
        alarm[2] = groundPoundCooldown;  
        sprite_index = spr_boss_idle; // Set back to idle after the pound
    }
} else if (vspeed < 0) { // When going up
    vspeed += self.mygravity * 0.8; // Adjust gravity for jumping
    vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
} else { // When falling down
    vspeed += self.mygravity; // Apply full gravity
    // Slow down the fall after a ground pound
    if (!isGroundPounding) {
        vspeed /= 3; // Reduce falling speed (adjust this factor as needed)
    }
    vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
}

// Apply left-right Movement
if (canMove) {
    if (obj_player.x < x) {
        hspeed -= self.walk_speed / 2;
    } else if (obj_player.x > x) {
        hspeed += self.walk_speed / 2;
    }
} else {
    if (place_meeting(x, y+1, obj_floor)) { hspeed /= 1.2; }
    if (hspeed < 0.1 && hspeed > -0.1) { hspeed = 0; }
}

hspeed = clamp(hspeed, -self.walk_speed_max / 2.5, self.walk_speed_max / 2.5);

// Update animation based on state
if (hspeed != 0) {
    image_xscale = sign(hspeed);
    sprite_index = spr_boss_run; // Running animation
} else if (!isGroundPounding && canAttack == false && !teleportReady) {
    sprite_index = spr_boss_idle; // Only set to idle if not performing other actions
}

// Basic attack
if (distance_to_object(obj_player) < 5 && canAttack) {
    health -= 10;
	if !audio_is_playing(snd_attackHit){
	audio_play_sound(snd_attackHit,false,false);
}
    sprite_index = spr_boss_attack; // Attack animation
    image_speed = 0.5; // Slower animation speed (adjust this value as needed)
    canAttack = false;
    alarm[0] = 100; // Time until the boss can attack again
    canMove = false;
    alarm[1] = 100; // Reset movement after a short delay
}

// Ground Pound Logic
if (groundPoundReady && distance_to_object(obj_player) < 50) {
    if (place_meeting(x, y+1, obj_floor)) {
        vspeed = groundPoundHeight; // Jump for ground pound
        isGroundPounding = true;
        sprite_index = spr_boss_idle;
    }
}

// Teleport Logic
if (teleportReady && isGroundPounding == false && canMove == true) { 
    var randX = obj_player.x + irandom_range(-100, 100);
    var randY = obj_player.y + irandom_range(-50, 50);
    randX = clamp(randX, 0, room_width - sprite_width); 
    randY = clamp(randY, 0, room_height - sprite_height + 1); 
   
    x = randX;
    y = randY;
    canMove = false;
    alarm[1] = 100;
	var attack = instance_create_layer(x+30, y+5, "Instances", obj_teleport);
	audio_play_sound(snd_bossTeleport,false,false);

    teleportReady = false;
    alarm[3] = teleportCooldown;
    sprite_index = spr_boss_idle;
}

// Apply Movement
x += hspeed;
y += vspeed;

// Reset sprite to idle if not in action
if (self.health <= 0) { 
    instance_destroy();
} else if (!isGroundPounding && !teleportReady) {
    sprite_index = spr_boss_idle; // Reset to idle after actions
}