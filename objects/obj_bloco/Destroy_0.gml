if(destroi){
	var chance = irandom_range(1,100)
	if(chance > 1){
		show_debug_message("criou")
		instance_create_layer(x,y, "Powerup", obj_power_up)
	}
}