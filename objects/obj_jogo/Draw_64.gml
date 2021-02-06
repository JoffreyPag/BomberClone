var w = sprite_get_width(spr_pause)
var h = sprite_get_height(spr_pause)

//dimensao da janela/viewport
var posx = view_get_wport(view_camera[0])/2
var posy = view_get_hport(view_camera[0])/2

//desenhando o pause
if(pause){
	
//----------------  EXIBICAO ---------------------------	
	draw_set_font(fnt_inicio)
	draw_sprite(spr_pause,0,posx- w/2, posy-h*2)
	
	for(var i=0; i<array_length(opcoes_pause);i++){
		if(sel_pause == i){ 
			draw_set_color(c_red) 
		}else{
			draw_set_color(c_white)
		}
		var sep = string_height(opcoes_pause[i])
		draw_text(posx, posy+(sep*i), opcoes_pause[i])
	}
	draw_set_color(c_white)
	draw_set_font(-1)	
}