/// @description Insert description here
// You can write your code in this editor
draw_self()
draw_set_font(casurusFont);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(x,y,title_text);

draw_set_halign(fa_left);
draw_set_valign(fa_top);

if room == rm_startScreen{
	audio_play_sound(snd_menuMusic,false,true);
}