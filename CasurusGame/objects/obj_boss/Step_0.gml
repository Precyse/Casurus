// Apply Gravity
if (place_meeting(x, y+1, obj_floor) && vspeed >= 0) {						
    vspeed = 0;
    if (isGroundPounding) {
        if (distance_to_object(obj_player) < 30) {
            health -= groundPoundDamage;
			canMove = false;
			alarm[1] = 100
        }
        sprite_index = spr_boss_idle;
        isGroundPounding = false;
        groundPoundReady = false;  
        alarm[2] = groundPoundCooldown;  
    }
} else if (vspeed < 0) {													
    vspeed += self.mygravity * 0.8;
    vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
} else {																
    vspeed += self.mygravity;
    vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
}

// Apply left-right Movement
if (canMove == true) {
    if (obj_player.x < x) {
        hspeed -= self.walk_speed / 2;
    } else if (obj_player.x > x) {
        hspeed += self.walk_speed / 2;
    }
} else {
    if (place_meeting(x, y+1, obj_floor)) { hspeed /= 1.2; }
    if (hspeed < 0.1 && hspeed > -0.1) { hspeed = 0; }
}

hspeed = clamp(hspeed, -self.walk_speed_max/2.5, self.walk_speed_max/2.5);

if (hspeed != 0) {
    image_xscale = sign(hspeed);
    sprite_index = spr_boss_run;
}

// Basic attack
if (distance_to_object(obj_player) < 5 && canAttack) {
    health -= 10;
    sprite_index = spr_boss_attack;
    canAttack = false;
    alarm[0] = 100;
	canMove = false;
	alarm[1] = 100
}

// Ground Pound Logic
if (groundPoundReady && distance_to_object(obj_player) < 50) {
    if (place_meeting(x, y+1, obj_floor)) {
        vspeed = groundPoundHeight; 
        isGroundPounding = true;
    }
}

// Teleport Logic
if (teleportReady) { 
    var randX = obj_player.x + irandom_range(-100, 100);
    var randY = obj_player.y + irandom_range(-50, 50);
    randX = clamp(randX, 0, room_width - sprite_width); 
    randY = clamp(randY, 0, room_height - sprite_height); 
    
    x = randX;
    y = randY;
	canMove = false;
	alarm[1] = 100

    teleportReady = false;
    alarm[3] = teleportCooldown;
}


x += hspeed;
y += vspeed;

if (obj_boss.health <= 0) { instance_destroy(); }

