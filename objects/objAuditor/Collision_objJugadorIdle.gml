/// @description Inserte aquí la descripción
// Puede escribir su código en este editor


	preguntas = [   ["¿Cuál es la capital de Francia?", "Paris", "Opción A"],
   ["¿Cuál es el océano más grande?", "Pacifico", "Opción B"],
   ["¿Cuál es el país más poblado del mundo?", "China", "Opción C"]
];
var opciones_respuesta = ["Opción A", "Opción B", "Opción C", "Opción D"];

	var pregunta_aleatoria = preguntas[irandom(array_length_1d(preguntas))];
	global.pregunta_actual = pregunta_aleatoria[0];
	global.respuesta_actual = pregunta_aleatoria[1];
	 var pregunta_instancia = instance_create_layer(x, y, "Instances", objPregunta);
	
	