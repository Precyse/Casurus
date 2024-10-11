// Can Attack When Pressing F key and Has enough Stamina
// Stamina check is in active switch-case
if (global.stamina >= self.attack_stamina_cost) {
	state = "inactive";
	self.attacking = true;
	sprite_index = spr_attack;
	image_speed = 1;
	global.stamina -= self.attack_stamina_cost;
}