/// @description Insert description here
// You can write your code in this editor

if(room = rm_inicio){
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