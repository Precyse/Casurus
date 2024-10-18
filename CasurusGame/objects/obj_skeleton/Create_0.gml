// states
enum SkeleState {
    Idle,
    Running,
    Attacking
}

obj_skeleton.health = 10;
direction = 0;
move_x = 0;
move_y = 0;
canMove = true;
canAttack = true;
state = SkeleState.Idle;