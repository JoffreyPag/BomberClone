if(room == rm_inicio){
	var n = array_length(opcoes)
	var h = string_height(opcoes[0])*1.5

	//alternando entre as opçoes
	if(keyboard_check_pressed(vk_up)){
		if(sel > 0){
			sel--
		}else{
			sel = n-1
		}
	
	}
	if(keyboard_check_pressed(vk_down)){
		if(sel < n-1){
			sel++
		}else{
			sel=0
		}
	}

	for(var i=0; i<n; i++){
		//mudando as cores para saber  que estou selecionando
		if(sel == i){
			cor = c_red
			cor2 = c_green
			espaco = -5
		}else{
			cor = c_white
			cor2 = c_black
			espaco = 0
		}
		
		draw_set_font(fnt_inicio)
		draw_set_halign(fa_center)
	
		//Desenhando opçoes sombra
		draw_set_color(cor2)
		draw_text(room_width/2.5+2+espaco, room_height/2 +2+ i*h, opcoes[i])
	
		//Desenhando opçoes frente
		draw_set_color(cor)
		draw_text(room_width/2.5+espaco, room_height/2 + i*h, opcoes[i])
	
		draw_set_halign(-1)
		draw_set_font(-1)
	}
}

//configurando os controles
if(room == rm_control){
	
	//var n = array_length(opcoes3)
	
	draw_set_font(fnt_inicio);
	draw_set_halign(fa_top);
	draw_set_halign(fa_left);
	
//-------------------------------------------------CONTROLE---------------------------------------------------------
	if(topo){
		//trocando o player que tera o controle mudado
		if(keyboard_check_pressed(vk_left)) sel_p --;
		if(keyboard_check_pressed(vk_right))sel_p ++;
	
		if(sel_p >= array_length(opcoes2)) sel_p = 0;
		if(sel_p < 0) sel_p = array_length(opcoes2)-1;
	
		//seleciona o player para ir pra o controle da troca das keys
		if(keyboard_check_pressed(vk_enter)){
			topo = false
			escolha_t = false
		}
			
		for(var i=0; i<array_length(opcoes3)-1; i++){
			//aqui é pra ser so o texto memso
			opcoes3[i] = scr_convert_tecla(global.controle_players[# sel_p, i]) 
			//aqui fica o codigo da tecla de verdade
			teclas[i] = global.controle_players[# sel_p, i]
		}
	
		//VOLTA PRA ROOM PRINCIPAL
		if(keyboard_check_pressed(vk_escape)){
			//reseta as variaveis para poder voltar a selecionar quando na room inicio
			escolha = false
			sel = 0
			var trans = instance_create_layer(x,y, "Transition", obj_tran)	
			trans.destino = rm_inicio
		}
	}else{
		//nao esta escolhendo a tecla, apenas navegando	
		if(!escolha_t){
			//navegando no submenu das teclas do player selecionado
			if(keyboard_check_pressed(vk_up)) sel_c --;
			if(keyboard_check_pressed(vk_down))sel_c ++;
			if(sel_c >= array_length(opcoes3)) sel_c = 0;
			if(sel_c < 0) sel_c = array_length(opcoes3)-1;
			
			//se pressionar o esc sai do submenu e volta pra selecao do player
			if(keyboard_check_pressed(vk_escape)) topo = true
			
			//esta escolhendo uma tecla especifica
			if(keyboard_check_pressed(vk_enter)){
				//checa se esta em um campo de tecla e nao no ok
				if(sel_c < array_length(opcoes3)-1){
					//esta em um campo de tecla
					escolha_t = true
				}else{
					//esta no ok
					//salva as teclas globais
					for(var i=0; i<array_length(teclas)-1 ; i++){
						global.controle_players[# sel_p, i] = teclas[i]
						show_debug_message(string(global.controle_players[# sel_p, i]))
					}
					topo = true
					sel_c = 0
				}
			}
		}else{
			//neste momento esta escolhendo uma tecla para o campo que esta selecionado
			var k_atual = 0
			k_atual = keyboard_key
			if(k_atual != 0 and k_atual != vk_enter){
				opcoes3[sel_c] = scr_convert_tecla(k_atual)
				teclas[sel_c] = k_atual
				escolha_t = false
			}
			//se pressionar enter dnv cancela
			if(keyboard_check_pressed(vk_enter)){
				escolha_t = false
			}
		}
	}
	
//----------------------------------------------- EXIBICAO -----------------------------------------------------
	//se estiver selecionando o player a cor fica vermelha, se nao branca
	if(topo){
		draw_set_color(c_red)
	}else{
		draw_set_color(c_white)
	}
	//escreve qual player que esta mostrando as teclas
	draw_text(room_width/4, room_height/7, opcoes2[sel_p]);
	draw_set_color(c_white)
	
	//mudando as cores para saber  que estou selecionando
	for(var i=0; i<array_length(opcoes3); i++){
		if(sel_c == i and not topo){
			if(escolha_t){
				draw_set_color(c_lime)
			}else{
				draw_set_color(c_red)
			}
		}else{
			draw_set_color(c_white)
		}
		//escrevendo qual tecla em ordem
		draw_text(room_width/1.75, (room_height/3.3) + (i*60), opcoes3[i])
	}	
	
	//draw_set_halign(-1)
	//draw_set_font(-1)
	
}

if(room == Room1){
	//fazendo o pause
	if(pause){
		
		//checando se a surface existe
		if(!surface_exists(surf)){
			//recriando a surface
			surf = surface_create(view_get_wport(view_camera[0]), view_get_hport(view_camera[0]));
			surface_set_target(surf)
			draw_clear_alpha(c_black, 0)
			surface_reset_target()
		}else{
			//se existe
			draw_surface_stretched(surf,0,0,room_width, room_height)
			
			//desenhando um retangulo escuro na frente dela
			draw_set_alpha(.5)
			draw_set_color(c_black)
			draw_rectangle(0,0, room_width, room_height, false)
			draw_set_alpha(1)
			draw_set_color(c_white)
		}
		
		var n = array_length(opcoes_pause)
		if(keyboard_check_pressed(vk_down)) sel_pause ++;
		if(keyboard_check_pressed(vk_up)) sel_pause --;
		if(sel_pause > n-1) sel_pause = 0;
		if(sel_pause < 0) sel_pause = array_length(opcoes_pause)-1;
	
		if(keyboard_check_pressed(vk_enter)){
			switch(sel_pause){
				case 0:
					pause = false
					sel_pause = 0
				break;
				case 1:
					pause = false
					sel_pause = 0
					room_restart()
				break;
				case 2:
					//reseta as variaveis para poder voltar a selecionar quando na room inicio
					pause = false
					sel_pause = 0
					escolha = false
					sel = 0
					var trans = instance_create_layer(x,y, "Transition", obj_tran)	
					trans.destino = rm_inicio
				break;
			}
		}		
		
	}
	//nao ta pausado
}