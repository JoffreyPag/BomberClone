///@function scr_define_controle(_player, _n_player)
///@param _player
///@param _n_player
function scr_define_controle(_player, _n_player){
	for(var i=0; i<5; i++){
		_player.controles[i] = global.controle_players[# _n_player, i]
	}
}