/// @description Insert description here
// You can write your code in this editor
if(sprite_index == spr_death){
    instance_destroy();
}
if(sprite_index == spr_attack){
	state = "active";
	self.attacking = false;
}