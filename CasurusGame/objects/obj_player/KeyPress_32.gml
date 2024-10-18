/// @description Insert description here
// You can write your code in this editor
jump_speed = 2.5;
if ((place_meeting(x, y + 1, obj_floor) || place_meeting(x, y+1, obj_grassFloor)) && global.stamina >= self.jump_stamina_cost) {
    global.stamina -= self.jump_stamina_cost; // reduce stamina
	vspeed = -self.jump_speed;  // jump
}