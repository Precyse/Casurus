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