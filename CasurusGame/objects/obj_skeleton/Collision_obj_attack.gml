/// @description Insert description here
// You can write your code in this editor
if !audio_is_playing(snd_attackHit){
	audio_play_sound(snd_attackHit,false,false);
}
self.health -= 5;