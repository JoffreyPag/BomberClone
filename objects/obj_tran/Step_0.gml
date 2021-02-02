/// @description Insert description here
// You can write your code in this editor
if(not escuro){
	alpha += .02
}else{
	alpha -= .02
}

if(alpha >= 1 and not escuro){
	room_goto(destino)
}