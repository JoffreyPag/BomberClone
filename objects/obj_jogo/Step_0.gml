/// @description Insert description here
// You can write your code in this editor
var enter = keyboard_check_released(vk_enter)

if(enter){
	switch(sel){
		case 0:
			global.jogadores = [true, false, false, false]
			alarm[0] = room_speed
		break;
		case 1:
			global.jogadores = [true, true, false, false]
			alarm[0] = room_speed		
		break;
		case 2:
			global.jogadores = [true, true, true, false]
			alarm[0] = room_speed		
		break;
		case 3:
			global.jogadores = [true, true, true, true]
			alarm[0] = room_speed		
		break;
		case 4:
		
		break;
	}
	
}