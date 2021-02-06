
opcoes = ["1 Player", "2 Players", "3 Players", "4 Players", "Controles", "Fechar"]
cor = c_white
cor2 = c_black
escolha = false
sel = 0
espaco = 0

global.jogadores = [true, false, false, false]

//criando a aestrutura de dados para os controles
enum players{p1,p2,p3,p4}
enum p_control{up, down, left, right, bomb}
global.controle_players = ds_grid_create(4,5)
ds_grid_clear(global.controle_players, 0)

//controles playr 1
scr_insere_controle(players.p1, vk_up, vk_down, vk_left, vk_right, vk_space)

//controles playr 2
scr_insere_controle(players.p2, ord("W"), ord("S"), ord("A"),  ord("D"), ord("E"))

//controles playr 3
//TODO
//controles playr 4
//TODO

//variaveis de selecao ao player
opcoes2 = ["1 Player", "2 Players", "3 Players", "4 Players"]
topo = true
sel_p = 0

//variaveis de selecao dos controles dos players
opcoes3 = ["UP", "DOWN", "LEFT", "RIGHT", "BOMB", "OK"]
sel_c = 0
escolha_t = false
teclas = [0,0,0,0,0,0]
cor3 = c_white

pause = false
//superficie quando pausa o jogo
surf = 0

opcoes_pause = ["Voltar", "Reiniciar", "Sair"]
sel_pause = 0