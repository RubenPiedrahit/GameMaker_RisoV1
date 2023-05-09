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
    
    var max_width = 400;
    var text_width = string_width(global.pregunta); 
    var text_x = clamp(x - 250, x - max_width / 2, x + max_width / 2 - text_width); 
    var text_y = y - 250; 

    draw_set_font(fntPreguntas); 
    
    draw_text(text_x, text_y, global.pregunta);
    
    // Inicializar la variable que almacena el índice de la respuesta señalada
    var respuesta_senalada = -1;
    
    for (var i = 0; i < array_length_1d(global.opciones_respuesta); i++) {
        // Comprobar si el cursor está sobre la respuesta actual
        if (mouse_x > x - 250 && mouse_x < x + 250 && mouse_y > y - 220 + i * 20 && mouse_y < y - 200 + i * 20) {
            respuesta_senalada = i;
        }
        // Establecer el color de la respuesta actual (señalada o no señalada)
        if (respuesta_senalada == i) {
            draw_set_color(c_blue);
        } else {
            draw_set_color(c_black);
        }
        // Dibujar la respuesta actual
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
			global.pregunta_actual++;
			fondo_musical = audio_play_sound(sndBien, true, false);
			audio_sound_gain(fondo_musical,1, 0.5); // ajustar el volumen a 50%
		} else {
			//instance_change(objCaraTriste, true);
			//depth = -10000;  
			global.pregunta_actual++;
			fondo_musical = audio_play_sound(sndMal, true, false);
			audio_sound_gain(fondo_musical,1, 0.5); // ajustar el volumen a 50%
			iniciar();
		}
		
		if (global.pregunta_actual >= array_length_1d(global.preguntas_respuestas)) {
			show_message("¡Juego terminado! Respondiste " + string(global.preguntas_correctas) + " preguntas");
			audio_stop_sound(global.fondo_musical);
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
    
    // Mostrar un mensaje de error en la pregunta con la opción de volver a intentarlo
    var eleccion = show_question("Error en la Pregunta ¿Deseas volverlo a intentar?");
	
	   // Reiniciar las variables del juego a su estado inicial
	global.pregunta_actual = 0;
    global.preguntas_correctas = 0;
	
    
    if (eleccion == 1) {
        // El jugador eligió continuar, mostrar la siguiente pregunta
        mostrarPregunta();
    } else {
        // El jugador eligió no continuar, mostrar un mensaje de despedida
        show_message("¡Gracias por jugar!");
		instance_destroy();
		audio_stop_sound(global.fondo_musical);
    }
}



