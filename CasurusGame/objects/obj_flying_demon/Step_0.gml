// Apply Gravity
if (place_meeting(x, y+1,obj_floor) && vspeed >= 0) {						// Dont fall when on floor
	vspeed = 0;
} else if (vspeed < 0) {													// Apply weaker gravity when jumping
    vspeed += 0.1 * 0.8;
	vspeed = clamp(vspeed, -10, 10);
} else {																	// Apply full gravity
    vspeed += 0.1;
	vspeed = clamp(vspeed, -10, 10);
}

//Follows player
if distance_to_object(obj_player) < attack_range {
	path_end()
	direction = point_direction(x, y, obj_player.x, obj_player.y)
	speed = hsp
}
	
//determines if enemy is facing left or right
if direction > 90 and direction < 270 {
	image_xscale = -1
} else {
	image_xscale = 1
}

//enemy attacks player
if (distance_to_object(obj_player) < 5 and can_attack = true) {
	health -= 10
	sprite_index = spr_flying_demon_attack
	can_attack = false
	alarm[1] = 50
}

//enemy dies after it reaches 0 health
if obj_flying_demon.health <= 0 {
	instance_destroy()
}