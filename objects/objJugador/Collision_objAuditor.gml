/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var old_x = x - 50; 
if (place_meeting(x + move_speed, y, objAuditor)) {
    instance_change(objJugadorIdle, true);
    layer_hspeed("Fondo", 0);
    layer_hspeed("Piso", 0);
    x = lerp(old_x, x, 0.5);
	
}

