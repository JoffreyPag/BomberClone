/// @description reiniciando quando todos os players estiverem mortos

if(numero_de_jogadores <= 0){
	if(instance_exists(obj_jogo)){
		if(!obj_jogo.pause) obj_jogo.pause = true
	}
	
	//room_restart()
}
var click = mouse_check_button_released(mb_left)
if(click){
	instance_create_layer((mouse_x div grid_size)*grid_size, 
							(mouse_y div grid_size)*grid_size, 
							"Level", obj_inimigo)
}