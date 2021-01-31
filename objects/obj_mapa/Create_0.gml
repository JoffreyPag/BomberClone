/// @description gerando o mapa
grid_size = 32
var largura_sala = room_width
var altura_sala = room_height

for(var i=0; i<largura_sala; i+=grid_size){
	for(var j=0; j<altura_sala; j+=grid_size){
		if(j == 0 or j == altura_sala-grid_size or 
			i == 0 or i==altura_sala-grid_size){
			var bloco = instance_create_layer(i,j, "Level", obj_bloco)
			bloco.destroi = false
		}
		//primeiro player
		if!(
			((i == grid_size and j == grid_size) or (i == grid_size*2 and j == grid_size) or (i == grid_size and j == grid_size*2)) or
			((i==largura_sala-(grid_size*3) and j == grid_size) or (i == largura_sala-(grid_size*2) and j == grid_size) or (i == largura_sala-(grid_size*2) and j==grid_size*2)) or
			((i == grid_size and j == largura_sala-(grid_size*2)) or (i == grid_size and j == altura_sala-(grid_size*3)) or (i == grid_size*2 and j == largura_sala-(grid_size*2))) or 
			((i == largura_sala-(grid_size*2) and j == altura_sala-(grid_size*2)) or (i == largura_sala-(grid_size*2) and j == altura_sala-(grid_size*3)) or (i == largura_sala-(grid_size*3) and j == altura_sala-(grid_size*2)))
			){
			var bloco = instance_create_layer(i,j, "Level", obj_bloco)
		}
		
	}
}

if(!instance_exists(obj_player)){
	instance_create_layer(grid_size, grid_size, "Player", obj_player)
}