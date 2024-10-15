/// @description Insert description here
// You can write your code in this editor
if(instance_exists(obj_player)){
	draw_healthbar(10,10,200,20,health,c_red,c_red,c_red,c_red,false,true);
	draw_healthbar(10,25,200,35,global.stamina,c_blue,c_blue,c_blue,c_blue,false,true);
}
//draw_text(10, 5, "Health: ")
//draw_text(10, 20, "Stamina: ")
//draw_text(100, 50, health)
//draw_text(100, 70, global.stamina)