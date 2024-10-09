/// @description Insert description here
// You can write your code in this editor
<<<<<<< Updated upstream
if(instance_exists(obj_skeleton)){
	if (obj_skeleton.sprite_index = spr_skeletonAttack) && (invincible = false){
		health -= 10;
		invincible = true;
		alarm[0] = 100;
	} else {
		health = health;
	}
=======
if (sprite_index == spr_attack) && (canAttack = true){
	obj_skeleton.health -= 50;
	canAttack = false;
	alarm[0] = 50;
}
if (obj_skeleton.health = 0){
	instance_destroy(obj_skeleton);
>>>>>>> Stashed changes
}