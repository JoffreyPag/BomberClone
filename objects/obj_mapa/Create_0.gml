/// @description gerando o mapa

numero_de_jogadores = 0
for(var i=0; i<array_length(global.jogadores);i++){
	if(global.jogadores[i]) numero_de_jogadores++
}

grid_size = 32
randomise()

var tam = irandom_range(16,24)

//aterando o tamnho da sala
room_width = tam*grid_size
room_height = tam*grid_size

//alterando o tamanho da view
camera_set_view_size(view_camera[0], room_width, room_height)

var largura_sala = room_width
var altura_sala = room_height

for(var i=0; i<largura_sala; i+=grid_size){
	for(var j=0; j<altura_sala; j+=grid_size){
		//players initial position
		var player1 = !((i == grid_size and j == grid_size) or (i == grid_size*2 and j == grid_size) or (i == grid_size and j == grid_size*2));
		var player2 = !((i == grid_size and j == largura_sala-(grid_size*2)) or (i == grid_size and j == altura_sala-(grid_size*3)) or (i == grid_size*2 and j == largura_sala-(grid_size*2)));
		var player3 = !((i==largura_sala-(grid_size*3) and j == grid_size) or (i == largura_sala-(grid_size*2) and j == grid_size) or (i == largura_sala-(grid_size*2) and j==grid_size*2));
		var player4 = !((i == largura_sala-(grid_size*2) and j == altura_sala-(grid_size*2)) or (i == largura_sala-(grid_size*2) and j == altura_sala-(grid_size*3)) or (i == largura_sala-(grid_size*3) and j == altura_sala-(grid_size*2)));
		
		var borders = j == 0 or j == altura_sala-grid_size or i == 0 or i==altura_sala-grid_size
		var middle = (i mod 1.5 == 0 and j mod 1.5 == 0)
		var not_a_player_place = (player1 and player2 and player3 and player4)
		
		//creating borders on map
		if(borders or (middle and not_a_player_place)){
			var bloco = instance_create_layer(i,j, "Level", obj_bloco)
			bloco.destroi = false
		}
		else if(not_a_player_place){
			//creating blocks where is not a player initial place
			var chance = irandom(100)
			if(chance > 30){
				instance_create_layer(i,j, "Level", obj_bloco)
			}
		}
	}
}

if(!instance_exists(obj_player)){
	var p1 = instance_create_layer(grid_size, grid_size, "Player", obj_player)
	scr_define_controle(p1, players.p1)
}

//criando o segundo player
if(global.jogadores[1]){
	var p2 = instance_create_layer(largura_sala-(grid_size*2), altura_sala-(grid_size*2), "Player", obj_player)
	scr_define_controle(p2, players.p2)
	p2.image_blend = c_yellow
}

if(global.jogadores[2]){
	var p3 = instance_create_layer(grid_size, altura_sala-(grid_size*2), "Player", obj_player)
	scr_define_controle(p3, players.p2)
	p3.image_blend = c_aqua
}

if(global.jogadores[3]){
	var p4 = instance_create_layer(largura_sala-(grid_size*2), grid_size, "Player", obj_player)
	scr_define_controle(p4, players.p2)
	p4.image_blend = c_fuchsia
}