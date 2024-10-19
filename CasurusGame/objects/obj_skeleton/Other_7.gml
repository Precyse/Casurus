/// @description Insert description here
// You can write your code in this editor
if (state == "attack") {
    // cooldown after attack
    state = "cooldown";
    attack_timer = attack_cooldown;

    // if player is within range, damage
    if (distance_to_object(obj_player) <= attack_range) {
        with (obj_player) {
            health -= 10; 
        }
    }
}

if (state == "dead") {
    instance_destroy();
}
