grid_size = 32
morto = false

alpha = 1
vel = .5
velh = 0
velv = 0
face = 3
avisar = true

//checando se ha uma parede na frente
if(!place_meeting(x+ grid_size, y, obj_bloco)){
	// nao ha um bloco ha frente
	velh = vel
}else if(!place_meeting(x - grid_size, y, obj_bloco)){
	// nao ha um bloco atras
	velh = -vel
}else if(!place_meeting(x, y+grid_size, obj_bloco)){
	//nao ha um bloco abaixo
	velv = vel
}else if(!place_meeting(x, y - grid_size, obj_bloco)){
	// nao ha umbloco acima
	velv = -vel
}