/// @description Insert description here
// You can write your code in this editor
var enter = keyboard_check_released(vk_enter)

if(enter and not escolha){
	escolha = true
	switch(sel){
		case 0:
			global.jogadores = [true, false, false, false]
			var trans = instance_create_layer(x,y, "Transition", obj_tran)
			trans.destino = Room1
		break;
		case 1:
			global.jogadores = [true, true, false, false]
			var trans = instance_create_layer(x,y, "Transition", obj_tran)	
			trans.destino = Room1
		break;
		case 2:
			global.jogadores = [true, true, true, false]
			var trans = instance_create_layer(x,y, "Transition", obj_tran)	
			trans.destino = Room1
		break;
		case 3:
			global.jogadores = [true, true, true, true]
			var trans = instance_create_layer(x,y, "Transition", obj_tran)	
			trans.destino = Room1
		break;
		case 4:
			var trans = instance_create_layer(x,y, "Transition", obj_tran)	
			trans.destino = rm_control
		break;
	}
}