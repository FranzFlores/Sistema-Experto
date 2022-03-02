% *****************************************************************************
% SISTEMA EXPERTO PARA LA PSICOLOGIA DEPORTIVA
% *****************************************************************************
:- set_prolog_flag(unknown,fail).

% =============================================================================
% Logica General 
% =============================================================================

% Pregunta al usuario
pregunta(Attr, Val):-
  conocido(si, Attr, Val), % recuerda las respuestas
  !.

pregunta(Attr, Val):-
  conocido(_, Attr, Val), % recuerda las respuestas
  !,
  fail.

pregunta(Attr, Val):-
  write(Attr), write(': '), write(Val),
  write('? (si/no): '),
  read(S),
  asserta(known(Y, Attr, Val)),
  S == si.

% Preguntas
manifiesta(X):-
  pregunta(manifiesta, X).

% Procesa el resultado
recomendaciones(X):- 
  solucion(X, P),
  procesar(P, 1).

procesar([], N).
procesar([H|T], N):-
  imprimir(H, N),
  R is N+1,
  procesar(T, R).

imprimir(E, N):-
  write('Recomendacion #'), write(N), write(': '),
  obtener_txt(E, T),
  write(T), nl.

% Principal
iniciar:-
  writeln('=============================================================='),
  writeln('OBTENER DIAGNOSTICO'),
  writeln('=============================================================='),
  diagnostico(X), nl,
  obtener_txt(X, T),
  write('DIAGNOSTICO ===> '), write(T), nl, nl,
  writeln('=============================================================='),
  writeln('RECOMENDACIONES'),
  writeln('=============================================================='),  
  recomendaciones(X).

% =============================================================================
% Base de Conocimiento 
% =============================================================================

% Hechos y reglas (Diagnosticos)
diagnostico(transtorno_animo-problemas_estres):-
  manifiesta(falta_concentracion);
  manifiesta(impaciencia),
  manifiesta(alta_irritibilidad),
  manifiesta(temor_perder_control);
  manifiesta(tension_elevada).

diagnostico(problemas_estres):- 
  manifiesta(presion_familiar); 
  manifiesta(problemas_sociales);
  manifiesta(problemas_economicos);
  manifiesta(problemas_academicos).

diagnostico(discriminacion):-
  manifiesta(conflictos_culturales);
  manifiesta(conflictos_religiosos);
  manifiesta(conflictos_etnicos);
  manifiesta(conflictos_sexualidad).

diagnostico(falta_motivacion-insatisfaccion_laboral):-
  manifiesta(poco_interes_actividades),
  manifiesta(poco_esfuerzo);
  manifiesta(falta_confianza);
  manifiesta(exceso_confianza),
  manifiesta(no_aceptar_errores).

diagnostico(problemas_autoestima):-
  manifiesta(no_establece_objetivos);
  manifiesta(alteraciones_sueno);
  manifiesta(dificultad_concentracion).
 
 diagnostico(incapacidad_afrontar_adversidad):-
  manifiesta(baja_tolerancia_frustracion);
  manifiesta(falta_preparacion_cognitiva);
  manifiesta(pensamientos_recurrentes);
  manifiesta(critica_entrenador);
  manifiesta(afectacion_redes_sociales).

diagnostico(crisis_panico):-
  manifiesta(perdida_concentracion);
  manifiesta(sensacion_ahogo);
  manifiesta(temblores);
  manifiesta(ansiedad);
  manifiesta(miedo_extremo);
  manifiesta(inseguridad);
  manifiesta(sentimiento_culpa).

diagnostico(problemas_conducta):-
  manifiesta(rebeldia),
  manifiesta(indisciplina);
  manifiesta(falta_comunicacion_asertiva_equipo),
  manifiesta(falta_sentido_pertenencia).

% Hechos y Reglas (Recomendaciones)
solucion(
  transtorno_animo-problemas_estres,
  [
    equilibrio_obligaciones, 
    acudir_profesional, 
    aplicar_tecnica_relajacion, 
    realizar_terapia_ocupacional, 
    aplicar_tecnicas_cognitivo-conductuales,
    aplicar_tecnicas_desviacion_atencion
  ]
).

solucion(
  problemas_estres,
  [
    equilibrio_obligaciones,
    acudir_profesional,
    aplicar_tecnica_relajacion,
    realizar_terapia_ocupacional,
    aplicar_tecnicas_cognitivo-conductuales,
    aplicar_tecnicas_desviacion_atencion
  ]
).

solucion(
  discriminacion,
  [
    equilibrio_obligaciones,
    acudir_profesional,
    aplicar_tecnica_relajacion,
    realizar_terapia_ocupacional,
    aplicar_tecnicas_cognitivo-conductuales,
    aplicar_tecnicas_desviacion_atencion
  ]
).

solucion(
  falta_motivacion-insatisfaccion_laboral,
  [
    aplicar_tecnicas_motivacion,
    tener_buena_psicoeducacion
  ]
).

solucion(
  problemas_autoestima,
  [
    preparacion_ante_fracasos_futbolisticos,
    preparacion_manejo_emociones
  ]
).

solucion(
  incapacidad_afrontar_adversidad,
  [
    preparacion_ante_fracasos_futbolisticos,
    preparacion_manejo_emociones
  ]
).

solucion(
  crisis_panico,
  [
    felicitar_luego_corregir,
    preparacion_afrontar_situaciones_externas,
    reorganizacion_cognitiva
  ]
).

solucion(
  problemas_conducta,
  [
    establecer_codigos_etica,
    establecer_sanciones,
    trabajar_habilidades_sociales
  ]
).

% =============================================================================
% Textos para impresion
% =============================================================================
obtener_txt(transtorno_animo-problemas_estres, "Transtorno de animo y/o problemas de estres").
obtener_txt(problemas_estres, "Problemas de estres").
obtener_txt(discriminacion, "Discriminacion").
obtener_txt(falta_motivacion-insatisfaccion_laboral, "Falta de motivacion y/o insatisfaccion laboral").
obtener_txt(problemas_autoestima, "Problemas de autoestima").
obtener_txt(incapacidad_afrontar_adversidad, "Incapacidad para afrontar adversidades").
obtener_txt(crisis_panico, "Crisis de panico").
obtener_txt(problemas_conducta, "Problemas de conducta").

obtener_txt(equilibrio_obligaciones, "Equilibrio de obligaciones").
obtener_txt(acudir_profesional, "Acudir a un profesional").
obtener_txt(aplicar_tecnica_relajacion, "Aplicar tecnicas de relajacion").
obtener_txt(realizar_terapia_ocupacional, "Realizar terapia ocupacional").
obtener_txt(aplicar_tecnicas_cognitivo-conductuales, "Aplicar tecnicas cognitivo-conductuales").
obtener_txt(aplicar_tecnicas_desviacion_atencion, "Aplicar tecnicas de desviacion de atencion").
obtener_txt(aplicar_tecnicas_motivacion, "Aplicar tecnicas de motivacion").
obtener_txt(tener_buena_psicoeducacion, "Tener buena psicoeducacion").
obtener_txt(preparacion_ante_fracasos_futbolisticos, "Preparacion ante fracasos futbolisticos").
obtener_txt(preparacion_manejo_emociones, "Preparacion para el manejo de emociones").
obtener_txt(felicitar_luego_corregir, "Felicitar y luego corregir al jugador").
obtener_txt(preparacion_afrontar_situaciones_externas, "Preparacion para afrontar situaciones externas").
obtener_txt(reorganizacion_cognitiva, "Reorganizacion cognitiva").
obtener_txt(establecer_codigos_etica, "Establecer codigos de etica").
obtener_txt(establecer_sanciones, "Establecer sanciones").
obtener_txt(trabajar_habilidades_sociales, "Trabajar habilidades sociales").
obtener_txt(N, "No definido").