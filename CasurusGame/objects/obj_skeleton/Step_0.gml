/// @description Insert description here
// You can write your code in this editor
if(obj_player){
	direction = point_direction(x,y+4,obj_player.x,obj_player.y)
	speed = 0.8;
}
if place_meeting(x, y+1, obj_floor){
	move_y = 0;
	gravity = 0;
<<<<<<< Updated upstream
} else{
=======
} else {
>>>>>>> Stashed changes
	gravity = 1;
}
if (hspeed != 0) {
    image_xscale = sign(hspeed);
	sprite_index = spr_skeletonRunning;
}
if(distance_to_object(obj_player) < 5){
	sprite_index = spr_skeletonAttack;
}
if (place_meeting(x, y, obj_player)) {
    // Move the skeleton out of the collision using a small push in the opposite direction

    // Push the skeleton in the opposite direction from the player
    if (x < obj_player.x) {
        x -= push_back_speed; // Move left
    } else if (x > obj_player.x) {
        x += push_back_speed; // Move right
    }
}