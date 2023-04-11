/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Puede escribir su código en este editor

// Comprobar si se ha seleccionado una respuesta

global.preguntas_respuestas = [
    ["¿Que es la norma ISO 9001?", "b", ["Una norma de seguridad alimentaria.", "Una norma de gestión de calidad.", "Una norma de seguridad en el trabajo."]],
    ["¿Para que sirve la norma ISO 9001?", "b", ["Para garantizar la seguridad del producto.", "Para mejorar la satisfacción del cliente.", "Para reducir costos de producción."]],
    ["¿Tipo de organizaciones se aplica la norma ISO 9001?", "c", ["Solo a organizaciones grandes", "Solo a organizaciones pequeñas.", "A cualquier tipo de organización."]],
    ["¿Cual es el objetivo principal de la norma ISO 9001?", "c", ["Mejorar la eficiencia de la organización.", "Aumentar las ventas de la organización.", "Mejorar la satisfacción del cliente."]]
];
global.opciones_respuesta = [];
	
function mostrarPregunta() {

    // Dibuja un fondo blanco en forma de elipse detrás del texto
    draw_set_color(c_white);
    draw_ellipse(x - 500, y - 400, x + 300, y - 140, false);
	
    global.opciones_respuesta = global.preguntas_respuestas[global.pregunta_actual][2];
    global.respuesta_correcta = global.preguntas_respuestas[global.pregunta_actual][1];
    global.pregunta = global.preguntas_respuestas[global.pregunta_actual][0];

    draw_set_color(c_black);
    
    var max_width = 400; // Ancho máximo del texto de la pregunta
    var text_width = string_width(global.pregunta); // Ancho del texto de la pregunta
    var text_x = clamp(x - 250, x - max_width / 2, x + max_width / 2 - text_width); // Calcula la posición x del texto
    var text_y = y - 250; // Posición y del texto
    
    draw_text(text_x, text_y, global.pregunta);
    
    for (var i = 0; i < array_length_1d(global.opciones_respuesta); i++) {
        draw_text(x - 250, y - 220 + i * 20, chr(97+i) + ") " + global.opciones_respuesta[i]);
    }
    
    if (global.pregunta_actual >= array_length_1d(global.preguntas_respuestas)) {
        show_message("¡Juego terminado! Respondiste " + string(global.preguntas_correctas) + " preguntas correctamente.");
    }
}
mostrarPregunta();

if (mouse_check_button_released(mb_left)) {
	var respuesta_seleccionada = chr(97 + floor((mouse_y - (y - 220)) / 20));
	if (string_length(respuesta_seleccionada) > 0 && ord(respuesta_seleccionada) >= 97 && ord(respuesta_seleccionada) < 97 + array_length_1d(global.opciones_respuesta)) {
		if (respuesta_seleccionada == global.respuesta_correcta) {
			global.preguntas_correctas++;
		} else {
			//instance_change(objCaraTriste, true);
			//depth = -10000;  
			iniciar();
		}
		global.pregunta_actual++;
		if (global.pregunta_actual >= array_length_1d(global.preguntas_respuestas)) {
			show_message("¡Juego terminado! Respondiste " + string(global.preguntas_correctas) + " preguntas");
			instance_change(objCertifi, true);
			depth = -10000; 
			instance_destroy(objJugadorIdle);
			instance_destroy(objAuditor);
		} else {
			// Mostrar la siguiente pregunta
			mostrarPregunta();
		}
	} else {
		show_message("Selecciona una respuesta");
	}
}
function iniciar(){
    // Reiniciar las variables del juego a su estado inicial
    global.pregunta_actual = 0;
    global.preguntas_correctas = 0;
    
    // Mostrar un mensaje de error en la pregunta con la opción de volver a intentarlo
    var eleccion = show_question("Error en la Pregunta ¿Deseas volverlo a intentar?");
    
    if (eleccion == 1) {
        // El jugador eligió continuar, mostrar la siguiente pregunta
        mostrarPregunta();
    } else {
        // El jugador eligió no continuar, mostrar un mensaje de despedida
        show_message("¡Gracias por jugar!");
		instance_destroy();
    }
}



