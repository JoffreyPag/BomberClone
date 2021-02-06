/// @description Insert description here
// You can write your code in this editor
if(room = rm_inicio){
	var enter = keyboard_check_released(vk_enter)
	if(enter and not escolha){
		show_debug_message("entrou")
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
			case 5:
				game_end()
			break;
		}
	}
}else if(room = Room1){
	//pause the game
	if(keyboard_check_pressed(vk_escape)){
		pause = !pause
	}
	if(pause){
		//criando a superficie
		if(surf == 0){
			surf = surface_create(view_get_wport(view_camera[0]), view_get_hport(view_camera[0]));
			surface_set_target(surf)
			draw_clear_alpha(c_black, 0)
			surface_copy(surf, 0, 0, application_surface)
			surface_reset_target()
		}
		
		
		//desativando tudo
		instance_deactivate_all(true)
	}else{
		//acabar a superficie
		if(surf != 0){
			surface_free(surf)
			surf = 0
		}
		
		//reativando tudo
		instance_activate_all()
	}
}