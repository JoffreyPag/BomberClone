/// @description desenhando grid do jogo

var col = room_width div grid_size
var lin = room_height div grid_size

//desenhando colunas
for(var i = 0; i<col; i++){
	draw_line_width(i*grid_size,0,i*grid_size,room_height,1)
}
//desnehando linhas
for(var j = 0; j<lin; j++){
	draw_line_width(0,j*grid_size,room_width,j*grid_size,1)
}