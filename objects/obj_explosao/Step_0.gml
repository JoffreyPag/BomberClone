//destuindo no fim da animacao
if(image_index > image_number-1) instance_destroy()

//colidindo com outra bomba
var bombcol = instance_place(x,y, obj_bomba)
if(bombcol){
	if(bombcol.alarm[0] >= 2){
		bombcol.alarm[0] = 1
	}
}

//checando colisao com parede
var col = instance_place(x,y, obj_bloco)

if(col){
	if(col.destroi){
		instance_destroy(col)
	}else{
		instance_destroy()
		part = false
	}
	potencia = -1
}

if(part){
	part_emitter_region(global.part_sys, global.em, x+sprite_width/2, x+sprite_width/2, y+sprite_height/2, y+sprite_height/2,0,0)
	part_emitter_burst(global.part_sys, global.em, global.particula, 2)
}

//colidindo com o player
if(instance_place(x,y,obj_player)){
	game_restart()
}
