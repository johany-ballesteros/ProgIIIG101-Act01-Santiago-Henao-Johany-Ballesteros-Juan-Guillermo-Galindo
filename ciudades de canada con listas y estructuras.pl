% ============================================
% RUTAS ENTRE CIUDADES DE CANADÁ
% ============================================

ciudad(vancouver, [conexion(edmoton,16), conexion(calgary,13)]).
ciudad(edmoton, [conexion(saskatoon,12), conexion(calgary,4)]).
ciudad(calgary, [conexion(regina,14), conexion(edmoton,4)]).
ciudad(saskatoon, [conexion(calgary,9), conexion(winnipeg,20)]).
ciudad(regina, [conexion(winnipeg,4), conexion(saskatoon,7)]).
ciudad(winnipeg, []).


%reglas
existe_conexion(O,D):- ciudad(O,L),member(conexion(D,_),L).
valor(O,D,C):- ciudad(O,L),member(conexion(D,C),L).
existe_arista(A,B):- existe_conexion(A,B);existe_conexion(B,A).
costo_intermedio(A,C,T):- valor(A,B,C1),valor(B,C,C2),T is C1+C2.
es_posible_viajar(A,C):- existe_conexion(A,B),existe_conexion(B,C).
costo_viaje(O,D,C):- valor(O,D,C).
costo_viaje(O,D,C):- valor(O,X,C1),costo_viaje(X,D,C2),C is C1+C2.
