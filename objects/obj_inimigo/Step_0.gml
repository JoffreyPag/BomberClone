if(!morto){

	//movimentação em grid
	//checando se o x e y sao multiplos de 32
	if(round(x) mod grid_size == 0 and round(y) mod grid_size == 0){
		//mudando de direcao
		var cha = irandom(100)
		if(cha > 70){
			//checando vertical
			if(velh !=0){
				//checando em cima
				if(!place_meeting(x, y - grid_size, obj_bloco)){
					//nao ha um bloco acima
					velh = 0
					velv = -vel
				}else if(!place_meeting(x, y + grid_size, obj_bloco)){
					//nao ha um bloco abaixo
					velh = 0
					velv = vel
				}
			}else{
				//checando horizontal
				if(!place_meeting(x+ grid_size, y, obj_bloco)){
					// nao ha um bloco na direita
					velv = 0
					velh = vel
				}else if(!place_meeting(x - grid_size, y, obj_bloco)){
					// nao ha um bloco na esquerda
					velv = 0
					velh = -vel
				}
			}
		}
	
	}
	
	//impedindo movimento diagonal
	if(velh != 0 and velv !=0){
		velv = 0
	}

	//colisao horizontal
	if(place_meeting(x+sign(velh), y, obj_bloco)){
		velh *= -1
	}
	//colisao vertical
	if(place_meeting(x, y+sign(velv), obj_bloco)){
		velv *= -1
	}
		
	//colisao horizontal
	if(place_meeting(x+sign(velh), y, obj_bomba)){
		velh *= -1
	}
	//colisao vertical
	if(place_meeting(x, y+sign(velv), obj_bomba)){
		velv *= -1
	}
		
	//colisao horizontal
	if(place_meeting(x+sign(velh), y, obj_inimigo)){
		velh *= -1
	}
	//colisao vertical
	if(place_meeting(x, y+sign(velv), obj_inimigo)){
		velv *= -1
	}	
	

	//animacao
	if(velh + velv == 0){
		image_index = 0
		image_speed = 0
	}else{
		image_speed = 1
	}

	if(velh > 0) sprite_index = spr_inimigo_dir
	if(velh < 0) sprite_index = spr_inimigo_left
	if(velv < 0) sprite_index = spr_inimigo_up
	if(velv > 0) sprite_index = spr_inimigo_down
	
	if(vel>.5) vel = .5

	x += velh
	y += velv
}else{
	//is dead
	image_speed = 0
	image_blend = c_red
	alpha = lerp(alpha, .1, .01)
	image_alpha = alpha	
	if(avisar){
		avisar = false
		alarm[0] = room_speed*5
	}
}

//matando o player
var player_pai = instance_place(x,y, obj_player_pai)
if(player_pai){
	player_pai.morto = true
}

//colidindo com a explosao
if(place_meeting(x,y, obj_explosao)) morto = true