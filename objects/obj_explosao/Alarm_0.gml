//criar pros 4 lados
if(mae){
	//tocando o som da explosao
	var snd = audio_play_sound(snd_explo, 5, false)
	audio_sound_pitch(snd, random_range(.5, 2))
	if(potencia > 0){
		repeat(4){
			var xx = lengthdir_x(grid_size, sentido)
			var yy = lengthdir_y(grid_size, sentido)
			
			var filha = instance_create_layer(x + xx, y+yy, "Efeitos", obj_explosao)
			filha.mae = false
			filha.sentido = sentido
			filha.potencia = potencia
			sentido += 90
		}
		potencia --
	}
}else{
	//so cria para o sentido que foi criado
	if(--potencia > 0){
		//criando as proximas explosoes
		var xx = lengthdir_x(grid_size, sentido)
		var yy = lengthdir_y(grid_size, sentido)
			
		var filha = instance_create_layer(x + xx, y+yy, "Efeitos", obj_explosao)
		filha.mae = false
		filha.sentido = sentido
		filha.potencia = potencia
	}
}