/// @description Insert description here
// You can write your code in this editor
draw_healthbar(10,10,200,20,health,c_red,c_red,c_red,c_red,false,false);
draw_healthbar(10,30,200,40,global.stamina,c_blue,c_blue,c_blue,c_blue,false,false);
draw_text(10, 50, "Health: ")
draw_text(10, 70, "Stamina: ")
draw_text(100, 50, health)
draw_text(100, 70, global.stamina)