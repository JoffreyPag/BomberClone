//criando a aestrutura de dados para os controles
enum players{p1,p2,p3,p4}
enum p_control{up, down, left, right, bomb}
global.controle_players = ds_grid_create(4,5)
ds_grid_clear(global.controle_players, 0)

//controles playr 1
global.controle_players[# players.p1, p_control.up] = vk_up
global.controle_players[# players.p1, p_control.down] = vk_down
global.controle_players[# players.p1, p_control.left] = vk_left
global.controle_players[# players.p1, p_control.right] = vk_right
global.controle_players[# players.p1, p_control.bomb] = vk_space
//controles playr 2
global.controle_players[# players.p2, p_control.up] = ord("W")
global.controle_players[# players.p2, p_control.down] = ord("S")
global.controle_players[# players.p2, p_control.left] = ord("A")
global.controle_players[# players.p2, p_control.right] = ord("D")
global.controle_players[# players.p2, p_control.bomb] = ord("E")
//controles playr 3
//controles playr 4

//criando o mapa caso estea na room correta
if(room == Room1){
	if(!instance_exists(obj_mapa)){
		instance_create_layer(0,0, "Instances", obj_mapa)
	}
}
