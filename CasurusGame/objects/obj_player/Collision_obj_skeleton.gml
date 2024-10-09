/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_skeleton)){
	if (obj_skeleton.sprite_index = spr_skeletonAttack) && (invincible = false){
		health -= 10;
		invincible = true;
		alarm[0] = 100;
	} else {
		health = health;
	}
}