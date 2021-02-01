///@function scr_insere_controle(_n_player, _up, _down, _left, _right, _bomb)
///@param _n_player
///@param _up
///@param _down
///@param _left
///@param _right
///@param _bomb

function scr_insere_controle(_n_player, _up, _down, _left, _right, _bomb){
	var con = [_up, _down, _left, _right, _bomb]
	
	for(var i=0; i<5; i++){
		global.controle_players[# _n_player, i] = con[i]	
	}
	
}