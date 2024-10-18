/// @description Insert description here
// You can write your code in this editor
if(sprite_index == deathSpr){
    instance_destroy();
	room_restart();
}
if(sprite_index == attackSpr){
	image_index = 0;
	image_speed = 1;
	isAttacking = false;
}