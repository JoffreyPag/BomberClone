/// @description gerando o mapa
var grid_size = 32
var largura_sala = room_width
var altura_sala = room_height
var xx = 0
var yy = 0

//geração da linha superior
while(xx <= largura_sala){
	var bloco = instance_create_layer(xx, 0, "Level", obj_bloco)
	bloco.destroi = false
	
	xx+=grid_size
}
//coluna da esq
while(yy <= altura_sala){
	var bloco = instance_create_layer(0, yy, "Level", obj_bloco)
	bloco.destroi = false
	yy+=grid_size
}
//linha inferior
while(xx >= 0){
	var bloco = instance_create_layer(xx, altura_sala-grid_size, "Level", obj_bloco)
	bloco.destroi = false
	xx-=grid_size
}
//linha da direita
while(yy >= 0){
	var bloco = instance_create_layer(largura_sala-grid_size, yy, "Level", obj_bloco)
	bloco.destroi = false
	yy-=grid_size
}
