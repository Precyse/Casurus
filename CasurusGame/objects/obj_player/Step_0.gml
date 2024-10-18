// Apply Gravity
if ((place_meeting(x, y+1, obj_floor) || place_meeting(x, y+1, obj_grassFloor)) && vspeed >= 0) {						// Dont fall when on floor
	vspeed = 0;
} else if (self.attacking) {												// Dont fall when attacking
	vspeed = 0;
} else if (vspeed < 0) {													// Apply weaker gravity when jumping
    vspeed += self.mygravity * 0.8;
	vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
} else {																	// Apply full gravity
    vspeed += self.mygravity;
	vspeed = clamp(vspeed, -self.fall_speed_max, self.fall_speed_max);
}


// Apply left-right Movement
if (keyboard_check(vk_right)) {
	hspeed += self.walk_speed;
} else if (keyboard_check(vk_left)) {
	hspeed -= self.walk_speed;
} else {
	if (place_meeting(x, y+1, obj_floor) || place_meeting(x, y+1, obj_grassFloor) || self.attacking) {hspeed = hspeed/1.2;} //slow the player down over time when touching floor or attacking
	// if no floor, dont set to 0 
	if (hspeed < 0.1 && hspeed > -0.1) {hspeed = 0;}		
	// set to 0 when small enough
}
hspeed = clamp(hspeed, -self.walk_speed_max, self.walk_speed_max);


// State handler i guess
switch(state){
	case "active":
		if global.stamina <= 80 {
			global.stamina += 0.2;
		}
		if global.stamina <= 0{
			can_jump = false;
			can_attack = false;
		}
		if global.stamina > 0 {
			can_jump = true;
			can_attack = true;
		}

		if hspeed != 0 {
			image_xscale = sign(hspeed);
			sprite_index = spr_running;
			image_speed = 1;
		} else {
			sprite_index = spr_player;
			image_speed = 1.0;
		}
} // end switch 




if health <= 0 {													// Death Animation when health = 0
	sprite_index = spr_death;
}


// Apply Movement
x += hspeed;
y += vspeed;
// Prevent OoB
x = clamp(x,5, room_width-5);
y = clamp(y,0,room_height);

// Climb Ladder
if (instance_place(x, y, obj_ladder)) {
	climbing = true
	vspeed = 0
	gravity = 0
} else {
	climbing = false
} if (climbing) {
	if (keyboard_check(vk_up)) {
		vspeed -= 1
	} else if (keyboard_check(vk_down)) {
		vspeed += 1
	}
	vspeed = clamp(vspeed, -1, 1)
	hspeed = clamp(hspeed, -1, 1)
}