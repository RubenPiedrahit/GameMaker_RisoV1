/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Puede escribir su código en este editor

// Comprobar si se ha seleccionado una respuesta

global.preguntas_respuestas = [
    ["¿Qué es la norma ISO 9001?", "b", ["Una norma de seguridad alimentaria.", "Una norma de gestión de calidad.", "Una norma de seguridad en el trabajo."]],
    ["¿Para qué sirve la norma ISO 9001?", "b", ["Para garantizar la seguridad del producto.", "Para mejorar la satisfacción del cliente.", "Para reducir costos de producción."]],
    ["¿A qué tipo de organizaciones se aplica la norma ISO 9001?", "c", ["Solo a organizaciones grandes", "Solo a organizaciones pequeñas.", "A cualquier tipo de organización."]],
    ["¿Cuál es el objetivo principal de la norma ISO 9001?", "c", ["Mejorar la eficiencia de la organización.", "Aumentar las ventas de la organización.", "Mejorar la satisfacción del cliente."]]
];
	
function mostrarPregunta() {
	
    global.opciones_respuesta = global.preguntas_respuestas[global.pregunta_actual][2];
    global.respuesta_correcta = global.preguntas_respuestas[global.pregunta_actual][1];
    global.pregunta = global.preguntas_respuestas[global.pregunta_actual][0];

    draw_set_color(c_black);
    draw_text(x - 150, y - 250, global.pregunta);
    for (var i = 0; i < array_length_1d(global.opciones_respuesta); i++) {
        draw_text(x - 250, y - 180 + i * 20, chr(97+i) + ") " + global.opciones_respuesta[i]);
    }
    
    if (global.pregunta_actual >= array_length_1d(global.preguntas_respuestas)) {
        show_message("¡Juego terminado! Respondiste " + string(global.preguntas_correctas) + " preguntas correctamente.");
    }
}
mostrarPregunta();

if (mouse_check_button_released(mb_left)) {
	var respuesta_seleccionada = chr(97 + floor((mouse_y - (y - 180)) / 20));
	if (string_length(respuesta_seleccionada) > 0 && ord(respuesta_seleccionada) >= 97 && ord(respuesta_seleccionada) < 97 + array_length_1d(global.opciones_respuesta)) {
		if (respuesta_seleccionada == global.respuesta_correcta) {
			global.preguntas_correctas++;
		} else {
			instance_change(objCaraTriste, true);
			depth = -10000;    
		}

		// Actualizar pregunta actual y verificar si se ha completado el juego
		global.pregunta_actual++;
		if (global.pregunta_actual >= array_length_1d(global.preguntas_respuestas)) {
			show_message("¡Juego terminado! Respondiste " + string(global.preguntas_correctas) + " preguntas correctamente.");
		} else {
			// Mostrar la siguiente pregunta
			mostrarPregunta();
		}
	} else {
		show_message("Selecciona una respuesta");
	}
}

