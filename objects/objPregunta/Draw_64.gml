/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var opciones_respuesta = ["Paris", "Bogota", "Buenos Aires", "Millonarios"]; // Definir las opciones de respuesta
var respuesta_correcta = global.respuesta_actual; // Obtener la respuesta correcta de la variable global
var pregunta = global.pregunta_actual;

// Mostrar la pregunta y las opciones de respuesta
draw_set_color(c_black);
draw_text(x - 150, y - 250, pregunta);
for (var i = 0; i < array_length_1d(opciones_respuesta); i++) {
	draw_text(x - 250, y - 180 + i * 20, chr(97+i) + ") " + opciones_respuesta[i]);
}

// Comprobar si se ha seleccionado una respuesta
if (mouse_check_button_released(mb_left)) {
    var respuesta_seleccionada = chr(97 + floor((mouse_y - (y - 180)) / 20)); // Obtener la letra de la respuesta seleccionada
    if (string_length(respuesta_seleccionada) > 0 && ord(respuesta_seleccionada) >= 97 && ord(respuesta_seleccionada) < 97 + array_length_1d(opciones_respuesta)) {
        if (opciones_respuesta[ord(respuesta_seleccionada) - 97] == respuesta_correcta) {
            show_message("¡Respuesta correcta!");
        } else {
            show_message("Respuesta incorrecta");
        }
    } else {
        show_message("Selecciona una respuesta");
    }
}
