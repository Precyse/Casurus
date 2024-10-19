lifetime--; // Decrease the lifetime each step
if (lifetime <= 0) {
    instance_destroy(); // Destroy the attack object after its lifetime ends
}

