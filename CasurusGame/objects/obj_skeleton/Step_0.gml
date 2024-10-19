/// @description Insert description here
// You can write your code in this editor

if (place_meeting(x, y + 1, obj_floor) && vspeed >= 0) {   // Don't fall when on floor
    vspeed = 0;
    // Adjust y to ensure the skeleton stays on the floor
    while (!place_meeting(x, y + 1, obj_floor)) {
        y += 1;
    }
    while (place_meeting(x, y, obj_floor)) {
        y -= 1;
    }
} else if (vspeed < 0) {   // Apply weaker gravity when jumping
    vspeed += self.mygravity * 0.8;
    vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
    y += vspeed;
} else {    // Apply full gravity
    vspeed += self.mygravity;
    vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
    y += vspeed;
}
    
// death check
if (self.health <= 0 && state != "dead") {
    state = "dead";
    speed = 0;
    vspeed = 0;
    sprite_index = spr_skeleton_death;
    image_index = 0;
    image_speed = 1;
}

// dead state
if (state == "dead") {
   // rest is in animation end
    exit;
}

// gets player position
var player_x = obj_player.x;

// distaaaaance calculation (player)
var dist_to_player = abs(x - player_x);

// switch case of death
switch (state) {
    case "chase":
        sprite_index = spr_skeleton_run;
        image_speed = 1;

        // movement towards player
        if (player_x < x) {
            image_xscale = -1; // Face left
            hspeed = -walk_speed; 
        } else if (player_x > x) {
            image_xscale = 1;  // Face right
            hspeed = walk_speed; 
        } else {
            hspeed = 0;
        }

        // collision handling
        if (!place_meeting(x + hspeed, y, obj_floor)) {
            x += hspeed;
        } else {
            hspeed = 0;
        }

        // attack state within attack range
        if (dist_to_player <= attack_range) {
            state = "attack";
            speed = 0;
            vspeed = 0;
            hspeed = 0;
            sprite_index = spr_skeleton_attack;
            image_index = 0;
            image_speed = 1;
        }
        break;

    case "attack":
        vspeed = 0;
        hspeed = 0;
        // animation end event
        break;

    case "cooldown":
        // skele idle
        sprite_index = spr_skeleton;
        image_speed = 1;
        vspeed = 0;
        hspeed = walk_speed;
        
        attack_timer -= 1;

        // chase if player is too far
	if(dist_to_player < 110){
        if ((dist_to_player > attack_range)){
            state = "chase";
            hspeed = walk_speed;
        }
		
        // attack after cooldown
        else if (attack_timer <= 0) {
            state = "attack";
            sprite_index = spr_skeleton_attack;
		if !audio_is_playing(snd_enemy_attack){
			audio_play_sound(snd_enemy_attack,false,false);
			}
            image_index = 0;
            image_speed = 1;
            speed = 0;
            vspeed = 0;
        }
	}
	else{
		hspeed = 0;
	}
        break;
}

if (isGroundPounding) {
    if (abs(x - obj_player.x) < 30) {
        self.health -= groundPoundDamage;
        canMove = false;
        alarm[1] = 100; // Delay after hitting the player
    }
    
    // Reset ground pound states
    isGroundPounding = false;
    groundPoundReady = false;  
    alarm[2] = groundPoundCooldown;  
    sprite_index = spr_boss_idle;
}
