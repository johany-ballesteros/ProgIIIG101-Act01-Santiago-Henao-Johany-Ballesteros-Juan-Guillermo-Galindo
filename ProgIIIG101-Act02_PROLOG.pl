%HECHOS
% conexión(Ciudad, Destino, Costo).

conexión(vancouver, edmoton, 16).
conexión(vancouver, calgary, 13).

conexión(edmoton, saskatoon, 12).

conexión(calgary, regina, 14).
conexión(calgary, edmoton, 4).

conexión(saskatoon, calgary, 9).
conexión(saskatoon, winnipeg, 20).

conexión(regina, winnipeg, 4).
conexión(regina, saskatoon, 7).

existe_conexión(Ciudad, Destino) :-
    conexión(Ciudad, Destino, _).

valor(Ciudad, Destino, Costo) :-
    conexión(Ciudad, Destino, Costo).

% aristas en ambos sentidos
existe_arista(Ciudad, Existe) :-
    conexión(Ciudad, Existe, _).

existe_arista(Ciudad, Existe) :-
    conexión(Existe, Ciudad, _).
% costo para ir de una ciudad inicial a una ciudad final pasando por una ciudad intermedia. 
costo_para_ir_desde(Ciudad_i, Ciudad_m, Ciudad_f, CostoTotal) :-
    conexión(Ciudad_i, Ciudad_m, Costo1),
    conexión(Ciudad_m, Ciudad_f, Costo2),
    CostoTotal is Costo1 + Costo2.
% Es posible viajar de Ciudad_i a Ciudad_f pasando por Ciudad_m
es_posible_viajar(Ciudad_i, Ciudad_m, Ciudad_f) :-
    conexión(Ciudad_i, Ciudad_m, _),
    conexión(Ciudad_m, Ciudad_f, _).
/*
-Santiago Henao
-Johany Ballesteros
-Juan Guillermo Galindo
*/