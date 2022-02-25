% Sistema Experto para Psicología Deportiva

% Logica General 
ask(Attr, Val):-
  write(Attr:Val),
  write('? '),
  read(si).

manifiesta(X):-ask(manifiesta,X).

% Base de Conocimiento 
% Hechos y reglas (Diagnosticos)

diagnostico(transtorno_estado_animo | problemas_estres):-
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

diagnostico(falta_motivacion | insatisfaccion_laboral):-
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
solucion(transtorno_animo-problemas_estres,equilibrio_obligaciones).
solucion(transtorno_animo-problemas_estres,acudir_profesional).
solucion(transtorno_animo-problemas_estres,aplicar_tecnica_relajacion).
solucion(transtorno_animo-problemas_estres,realizar_terapia_ocupacional).
solucion(transtorno_animo-problemas_estres,aplicar_tecnicas_cognitivo-conductuales).
solucion(transtorno_animo-problemas_estres,aplicar_tecnicas_desviacion_atencion).

solucion(problemas_estres,equilibrio_obligaciones).
solucion(problemas_estres,acudir_profesional).
solucion(problemas_estres,aplicar_tecnica_relajacion).
solucion(problemas_estres,realizar_terapia_ocupacional).
solucion(problemas_estres,aplicar_tecnicas_cognitivo-conductuales).
solucion(problemas_estres,aplicar_tecnicas_desviacion_atencion).

solucion(discriminacion,equilibrio_obligaciones).
solucion(discriminacion,acudir_profesional).
solucion(discriminacion,aplicar_tecnica_relajacion).
solucion(discriminacion,realizar_terapia_ocupacional).
solucion(discriminacion,aplicar_tecnicas_cognitivo-conductuales).
solucion(discriminacion,aplicar_tecnicas_desviacion_atencion).

solucion(falta_motivacion-insatisfaccion_laboral,aplicar_tecnicas_motivacion).
solucion(falta_motivacion-insatisfaccion_laboral,tener_buena_psicoeducacion).

solucion(problemas_autoestima,preparacion_ante_fracasos_futbolisticos).
solucion(problemas_autoestima,preparacion_manejo_emociones).

solucion(incapacidad_afrontar_adversidad,preparacion_ante_fracasos_futbolisticos).
solucion(incapacidad_afrontar_adversidad,preparacion_manejo_emociones).

solucion(crisis_panico,felicitar_luego_corregir).
solucion(crisis_panico,preparacion_afrontar_situaciones_externas).
solucion(crisis_panico,reorganizacion_cognitiva).

solucion(problemas_conducta,establecer_codigos_etica).
solucion(problemas_conducta,establecer_sanciones).
solucion(problemas_conducta,trabajar_habilidades_sociales).

recomendaciones(X,Y):- solucion(X,Y).