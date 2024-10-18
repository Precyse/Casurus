// Apply Gravity
if (place_meeting(x, y+1, obj_floor) && vspeed >= 0) {						// Dont fall when on floor
	vspeed = 0;
} else if (vspeed < 0) {													// Apply weaker gravity when jumping
    vspeed += self.mygravity * 0.8;
	vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
} else {																	// Apply full gravity
    vspeed += self.mygravity;
	vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
}

// Apply left-right Movement
if (canMove == true){
if (obj_player.x < x) {
	hspeed -= self.walk_speed/2;
} else if (obj_player.x > x) {
	hspeed += self.walk_speed/2;
}
}
else {
	if (place_meeting(x, y+1, obj_floor)) {hspeed = hspeed/1.2;} //slow the skeleton down over time when touching floor
	// if no floor, dont set to 0 
	if (hspeed < 0.1 && hspeed > -0.1) {hspeed = 0;}						// set to 0 when small enough
}
hspeed = clamp(hspeed, -self.walk_speed_max, self.walk_speed_max);

if (hspeed != 0) {
    image_xscale = sign(hspeed);
	sprite_index = spr_wizard_run;
}


if(distance_to_object(obj_player) < 5) && canAttack = true{
	health -= 10;
	sprite_index = spr_wizard_attack;
	canAttack = false
	alarm[0] = 50
}

if (place_meeting(x, y, obj_player)) {  // TODO: Add a movement cooldown - cant move for 0.2 sec after contacting player
    // Move the skeleton out of the collision using a small push in the opposite direction
	canMove = false;
	alarm[1] = 50;
    // Push the skeleton in the opposite direction from the player
    if (x < obj_player.x) {
        x -= self.push_back_speed; // Move left
		hspeed = 0;
    } else if (x > obj_player.x) {
        x += self.push_back_speed; // Move right
		hspeed = 0;
    }
}

// Apply Movement
x += hspeed;
y += vspeed;

if (obj_boss.health <= 0){instance_destroy();}

