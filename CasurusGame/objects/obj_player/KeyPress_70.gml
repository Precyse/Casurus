// Can Attack When Pressing F key and Has enough Stamina
// Stamina check is in active switch-case
if (global.stamina >= self.attack_stamina_cost) {
	state = "inactive";
	self.attacking = true;
	sprite_index = spr_attack;
	image_index = 0;
	image_speed = 1;
	global.stamina -= self.attack_stamina_cost;
	if(distance_to_object(obj_boss) < 7){obj_boss.health -= 10}
	if(distance_to_object(obj_skeleton) < 7){obj_skeleton.health -= 10}
}