//destuindo no fim da animacao
if(image_index > image_number-1) instance_destroy()

//checando colisao com parede
var col = instance_place(x,y, obj_bloco)

if(col){
	if(col.destroi){
		instance_destroy(col)
	}
	potencia = -1
}

//colidindo com o player
if(instance_place(x,y,obj_player)){
	game_restart()
}
