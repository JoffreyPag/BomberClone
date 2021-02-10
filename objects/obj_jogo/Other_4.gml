/// @description criando o mapa caso estea na room correta
if(room == Room1){
	if(!instance_exists(obj_mapa)){
		instance_create_layer(0,0, "Instances", obj_mapa)
	}else{
		//instance_destroy(obj_mapa)
		//instance_create_layer(0,0, "Instances", obj_mapa)
	}
	
	//tocando a musica
	if(musica == 0){
		musica = audio_play_sound(snd_Zazie, 5, true)
	}
}
else{
	if(musica != 0){
		audio_stop_all()
//		audio_stop_sound(musica)
		musica = 0
	}
}