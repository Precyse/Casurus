/// @description End attack
// You can write your code in this editor

canMove = true;
canAttack = true;

// Determine the next state based on movement
if (hspeed != 0) {
    state = SkeleState.Running;
    sprite_index = spr_skeletonRunning;
} else {
    state = SkeleState.Idle;
    sprite_index = spr_skeleton;
}