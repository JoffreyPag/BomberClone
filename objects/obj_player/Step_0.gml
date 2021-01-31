var up, down, left, right, solta_bomba

if(vel>4) vel = 4

//movimentação em grid
//checando se o x e y sao multiplos de 32
if(round(x) mod grid_size == 0 and round(y) mod grid_size == 0){
	left = keyboard_check(vk_left)
	right = keyboard_check(vk_right)
	up = keyboard_check(vk_up)
	down = keyboard_check(vk_down)
	
	if(left) face = 2
	if(right) face = 0
	if(up) face = 1
	if(down) face = 3
	
	velh = (right-left)*vel
	velv = (down-up)*vel
	
}

solta_bomba = keyboard_check_released(vk_space)

if(solta_bomba && bombas > 0){
	var bomba = instance_create_layer((round(x) div grid_size)*grid_size,
							(round(y) div grid_size)*grid_size, 
							"Instances", obj_bomba);
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