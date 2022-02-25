% Sistema Experto para Psicología Deportiva
% Base de Conocimiento 
% Reglas
ask(Attr, Val):-
  write(Attr:Val),
  write('? '),
  read(si).

manifiesta(X):-ask(manifiesta,X).

diagnostico(insatisfaccion_laboral):-
    manifiesta(poco_interes_actividades),
    manifiesta(no_esfuerzo),
    manifiesta(exceso_confianza),
    manifiesta(falta_confianza),
    manifiesta(no_acepta_errores),
    manifiesta(no_establece_objetivos).

diagnostico(posible_insatisfaccion_laboral):-
    manifiesta(poco_interes_actividades),
    manifiesta(no_esfuerzo),
    manifiesta(exceso_confianza).


