/// @description criando o mapa caso estea na room correta
if(room == Room1){
	if(!instance_exists(obj_mapa)){
		instance_create_layer(0,0, "Instances", obj_mapa)
	}else{
		//instance_destroy(obj_mapa)
		//instance_create_layer(0,0, "Instances", obj_mapa)
	}
}