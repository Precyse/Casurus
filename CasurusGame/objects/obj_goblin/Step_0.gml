/// @description Insert description here
// You can write your code in this editor
if (place_meeting(x, y+1, obj_floor) && vspeed >= 0) {						// Dont fall when on floor
	vspeed = 0;
} else if (vspeed < 0) {													// Apply weaker gravity when jumping
    vspeed += 0.1 * 0.8;
	vspeed = clamp(vspeed, -10, 10);
} else {																	// Apply full gravity
    vspeed += 0.1;
	vspeed = clamp(vspeed, -10, 10);
}