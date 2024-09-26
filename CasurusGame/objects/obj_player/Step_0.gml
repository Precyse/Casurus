/// @description Insert description here
// You can write your code in this editor
move_x = (keyboard_check(vk_right) - keyboard_check(vk_left)) * move_speed

if place_meeting(x, y+2, obj_floor){
	move_y = 0;
	if keyboard_check_pressed(vk_space) move_y = -jump_speed
} else if move_y < 10 {
	move_y += 1;
}

move_and_collide(move_x, move_y, obj_floor);

if move_x != 0 {
	 image_xscale = sign(move_x);
}