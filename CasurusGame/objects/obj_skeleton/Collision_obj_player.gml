/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(ord("F"))){
	skeletonHealth -= 50;
	move_contact_solid(direction, 12);
	if skeletonHealth = 0{
		instance_destroy();
	}
}