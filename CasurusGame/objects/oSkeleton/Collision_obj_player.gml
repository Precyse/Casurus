/// @description Insert description here
// You can write your code in this editor
<<<<<<< Updated upstream
if(keyboard_check_pressed(ord("F"))){
	skeletonHealth -= 50;
	if skeletonHealth = 0{
		instance_destroy();
	}
}
=======
if(sprite_index = spr_skeletonAttack) && (canDamage = true){
	health -= 10;
	canDamage = false;
	alarm[0] = 50;
}
>>>>>>> Stashed changes
