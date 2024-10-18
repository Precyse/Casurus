// Can Attack When Pressing F key and Has enough Stamina
// Stamina check is in active switch-case
if (global.stamina >= self.attack_stamina_cost) {
	state = "inactive";
	self.attacking = true;
	sprite_index = spr_attack;
	image_index = 0;
	image_speed = 1;
	global.stamina -= self.attack_stamina_cost;
	if(distance_to_object(obj_boss) < 7){
		obj_boss.health -= 10
		sprite_index.obj_boss = spr_boss_hit
		}
	if(distance_to_object(obj_skeleton) < 7){obj_skeleton.health -= 10}
	if(distance_to_object(obj_goblin) < 7){obj_goblin.health -= 10}
	if (distance_to_object(obj_flying_eye) < 7){obj_flying_eye.health -= 10}
	if (distance_to_object(obj_dark_knight) < 7){obj_dark_knight.health -= 10}
	if (distance_to_object(obj_wizard) < 7){obj_wizard.health -= 10}
	if (distance_to_object(obj_water_priestess) < 7){obj_water_priestess.health -= 10}
	if (distance_to_object(obj_flying_demon) < 7){obj_flying_demon.health -= 10}
}