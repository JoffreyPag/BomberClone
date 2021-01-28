//criando o sistema de particula
global.part_sys = part_system_create()
part_system_depth(global.part_sys, -1000)

global.particula = part_type_create()

//configrando a particula
part_type_shape(global.particula, pt_shape_flare)
part_type_color3(global.particula, 8454140, 255, c_gray)
part_type_size(global.particula, .3, 2, 0, .1)
part_type_scale(global.particula, .4, .4)
part_type_alpha3(global.particula, .1,.5,.1)
part_type_speed(global.particula, .3,3,-2,.5)
part_type_direction(global.particula, 0,360, 0,0)
part_type_gravity(global.particula, 0, 270)
part_type_orientation(global.particula, 0,360,0,10,1)
part_type_blend(global.particula, 0)
part_type_life(global.particula, room_speed, room_speed/2)

global.em = part_emitter_create(global.part_sys)
//part_emitter_stream(part_sys, em, particula, 2)