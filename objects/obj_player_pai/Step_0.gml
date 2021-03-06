if(!morto){
	var up, down, left, right, solta_bomba

	if(vel>4) vel = 4
	if(potencia>6) potencia = 6

	//movimentação em grid
	//checando se o x e y sao multiplos de 32
	if(round(x) mod grid_size == 0 and round(y) mod grid_size == 0){
		up = keyboard_check(controles[0])
		down = keyboard_check(controles[1])
		left = keyboard_check(controles[2])
		right = keyboard_check(controles[3])
	
		if(left) face = 2
		if(right) face = 0
		if(up) face = 1
		if(down) face = 3
	
		velh = (right-left)*vel
		velv = (down-up)*vel
	
	}

	solta_bomba = keyboard_check_pressed(controles[4])

	if(solta_bomba && bombas > 0){
		var bomba = instance_create_layer((round(x) div grid_size)*grid_size,
								(round(y) div grid_size)*grid_size, 
								"Level", obj_bomba);
		bomba.potencia = potencia
		bomba.pai = self
		bombas--
	}


	//impedindo movimento diagonal
	if(velh != 0 and velv !=0){
		velv = 0
	}

	//colisao horizontal
	if(place_meeting(x+sign(velh), y, obj_bloco)){
		velh =0
	}
	//colisao vertical
	if(place_meeting(x, y+sign(velv), obj_bloco)){
		velv =0
	}

	/*
	//colisao horizontal bomba
	if(place_meeting(x+(sign(velh)*grid_size), y, obj_bomba)){
		velh =0
	}
	//colisao vertical bomba
	if(place_meeting(x, y+(sign(velv)*grid_size), obj_bomba)){
		velv =0
	}*/

	//animacao
	if(velh + velv == 0){
		image_index = 0
		image_speed = 0
	}else{
		image_speed = 1
	}

	if(face == 0) sprite_index = spr_player_dir
	if(face == 2) sprite_index = spr_player_esq
	if(face == 1) sprite_index = spr_player_up
	if(face == 3) sprite_index = spr_player_down


	x += velh
	y += velv
}else{
	//is dead
	image_speed = 0
	image_blend = c_red
	alpha = lerp(alpha, .3, .01)
	image_alpha = alpha	
	if(avisar){
		avisar = false
		alarm[0] = room_speed*2
	}
}