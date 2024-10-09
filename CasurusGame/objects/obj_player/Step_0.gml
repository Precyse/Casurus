/// @description Insert description here
// You can write your code in this editor
switch(state){
	case "active":
		move_x = (keyboard_check(vk_right) - keyboard_check(vk_left)) * move_speed;
		x = clamp(x,5, room_width-5);
		y= clamp(y,0,room_height);
		if global.stamina <= 80 {
			global.stamina += 0.2;
		}
		if global.stamina <= 0{
			canJump = false;
			canAttack = false;
		}
		if global.stamina > 0 {
			canJump = true;
			canAttack = true;
		}
		move_and_collide(move_x, move_y, obj_floor);

		if move_x != 0 {
			image_xscale = sign(move_x);
			sprite_index = spr_running;
			image_speed = 1;
		} else {
			sprite_index = spr_player;
			image_speed = 1.0;
		}
} // end switch


// Can Attack When Pressing F key and Has enough Stamina
// Stamina check is in active switch-case
if keyboard_check_pressed(ord("F")) && canAttack = true{
	state = "inactive";
	sprite_index = spr_attack;
	image_speed = 1;
	global.stamina -= 10;
}
// Can jump when on ground and has enough Stamina to do so.
if place_meeting(x, y+1, obj_floor){
	move_y = 0;
	if keyboard_check_pressed(vk_space) && canJump = true{ 
	move_y = -jump_speed
	global.stamina -= 5;
}
} else if move_y < 10 {
	move_y += 1;
}
// Death Animation when health = 0
if health <= 0 {
	sprite_index = spr_death;
}
