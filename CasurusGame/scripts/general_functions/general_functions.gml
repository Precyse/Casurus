// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function controlSetup(){
	bufferTime = 3;
	jumpKeyBuffered = 0;
	jumpKeyBufferTimer = 0;
}


function get_controls(){
	rightKey = keyboard_check(vk_right) + keyboard_check(ord("D"));
	rightKey = clamp(rightKey, 0, 1);
	
	leftKey = keyboard_check(vk_left)  + keyboard_check(ord("A"));
	leftKey = clamp(leftKey, 0, 1);
	
	
	jumpKeyPressed = keyboard_check_pressed(vk_space);
	jumpKeyPressed = clamp(jumpKeyPressed, 0, 1);
	jumpKey = keyboard_check(vk_space);
	jumpKey = clamp(jumpKey,0,1);
	
	// Jump Key Buffering
	if jumpKeyPressed && canJump == true{
		jumpKeyBufferTimer = bufferTime;
		audio_play_sound(snd_player_jump,false,false);
	}
	if jumpKeyBufferTimer > 0{
		jumpKeyBuffered = 1;
		jumpKeyBufferTimer--;
	} else {
		jumpKeyBuffered = 0;
	}
}