/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

// Puede escribir su código en este editor
global.preguntas_respuestas = [
    ["¿Cuál es la capital de Francia?", "a", ["Paris", "Bogota", "Buenos Aires", "Millonarios"]],
    ["¿Cuál es el equipo de fútbol más ganador en Colombia?", "b", ["Bogota", "Paris", "Buenos Aires", "Millonarios"]],
    ["¿Cuál es la capital de Argentina?", "c", ["Buenos Aires", "Paris", "Bogota", "Millonarios"]],
    ["¿Cuál es el equipo de fútbol más ganador en Colombia?", "d", ["Millonarios", "Paris", "Bogota", "Buenos Aires"]]
];

// Inicializar variables de juego
var datos_fin = global.preguntas;
global.preguntas_correctas = 0;
global.pregunta_actual = 0;



// Función para mostrar la pregunta y las opciones de respuesta
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

// Mostrar la primera pregunta
mostrarPregunta();

// Comprobar si se ha seleccionado una respuesta
if (mouse_check_button_released(mb_left)) {
    var respuesta_seleccionada = chr(97 + floor((mouse_y - (y - 180)) / 20));
    if (string_length(respuesta_seleccionada) > 0 && ord(respuesta_seleccionada) >= 97 && ord(respuesta_seleccionada) < 97 + array_length_1d(global.opciones_respuesta)) {
        if (respuesta_seleccionada == global.respuesta_correcta) {
            show_message("¡Respuesta correcta!");
            global.preguntas_correctas++;
			datos_fin = 2;
        } else {
            show_message("Respuesta incorrecta");
        }
        global.pregunta_actual++;
        mostrarPregunta();
    } else {
        show_message("Selecciona una respuesta");
    }
}