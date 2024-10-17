// states
enum SkeleState {
    Idle,
    Running,
    Attacking
}

// Apply Gravity
if (place_meeting(x, y + 1, obj_floor) && vspeed >= 0) {   // Don't fall when on floor
    vspeed = 0;
} else if (vspeed < 0) {   // Apply weaker gravity when jumping
    vspeed += self.mygravity * 0.8;
    vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
} else {    // Apply full gravity
    vspeed += self.mygravity;
    vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
}

// Apply left-right Movement
if (state != SkeleState.Attacking && canMove) { 
    if (obj_player.x < x) {
        hspeed -= self.walk_speed;
    } else if (obj_player.x > x) {
        hspeed += self.walk_speed;
    } else {
        if (place_meeting(x, y + 1, obj_floor)) {
            hspeed = hspeed / 1.2;   // Slow the skeleton down over time when touching the floor
        }
        if (abs(hspeed) < 0.1) {
            hspeed = 0;   // Set to 0 when small enough
        }
    }
    hspeed = clamp(hspeed, -self.walk_speed_max, self.walk_speed_max);
}

// Update state based on movement
if (state != SkeleState.Attacking) {
    if (hspeed != 0) {
        state = SkeleState.Running;
        image_xscale = sign(hspeed); // gets skele direction
        sprite_index = spr_skeletonRunning;
    } else {
        state = SkeleState.Idle;
        sprite_index = spr_skeleton;
    }
}

// Attack player if close enough
if (distance_to_object(obj_player) < 5 && canAttack) {
    state = SkeleState.Attacking;
    canAttack = false;
    canMove = false;
    sprite_index = spr_skeletonAttack;
    alarm[0] = 1000; // Cooldown for attack
    alarm[2] = sprite_get_number(sprite_index) * sprite_get_speed(sprite_index); // set alarm to end attack
    health -= 10; 
}

// Handle collisions with player
if (place_meeting(x, y, obj_player)) {  // TODO: Add a movement cooldown - can't move for 0.2 sec after contacting player
    canMove = false;
    alarm[1] = 100; // Cooldown for movement after collision
    // Move the skeleton out of the collision using a small push in the opposite direction
    if (x < obj_player.x) {
        x -= self.push_back_speed; // Move left
        hspeed = 0;
    } else if (x > obj_player.x) {
        x += self.push_back_speed; // Move right
        hspeed = 0;
    }
}

// Apply Movement
if (canMove) {
    x += hspeed;
}
y += vspeed;

if (obj_skeleton.health <= 0) {
    instance_destroy();
}
