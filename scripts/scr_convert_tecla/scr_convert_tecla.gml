///@function scr_convert_tecla(_tecla)
///@param _tecla
function scr_convert_tecla(_tecla){
	
	var texto = ""
	
	switch(_tecla){
		case vk_up: texto = "Up" break;
		case vk_down: texto = "Down" break;
		case vk_left: texto = "Left" break;
		case vk_right: texto = "Right" break;
		case vk_space: texto = "Space" break;
		case ord("W"): texto = "W" break;
		case ord("S"): texto = "S" break;
		case ord("A"): texto = "A" break;
		case ord("D"): texto = "D" break;
		case ord("E"): texto = "E" break;
		case 0: texto = "Nulo" break;
		default: texto = "Nulo"
	}
	
	return texto
}