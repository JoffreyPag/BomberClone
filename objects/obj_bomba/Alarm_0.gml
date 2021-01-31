/// @description Insert description here
// You can write your code in this editor
var explosion = instance_create_layer(x,y, "Efeitos", obj_explosao)
explosion.mae = true
explosion.potencia = potencia
if(pai != noone) pai.bombas++
instance_destroy();
