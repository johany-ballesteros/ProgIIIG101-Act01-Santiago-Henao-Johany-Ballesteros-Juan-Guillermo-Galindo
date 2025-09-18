% HECHOS
progenitor(clara, jose).
progenitor(tomas, jose).
progenitor(tomas, isabel).
progenitor(jose, ana).
progenitor(jose, patricia).
progenitor(patricia, jaime).


hombre(tomas).
hombre(jose).
hombre(jaime).
mujer(clara).
mujer(isabel).
mujer(ana).
mujer(patricia).

% diferencia
dif(X, Y) :- X \= Y.

% Reglas 
es_madre(X) :-
    mujer(X),
    progenitor(X,_).

es_padre(X) :-
    hombre(X),
    progenitor(X,_).

es_hijo(X) :-
    hombre(X),
    progenitor(_,X).

hermana_de(X,Y) :-
    mujer(X),
    progenitor(P,X),
    progenitor(P,Y),
    dif(X,Y).

abuelo_de(X,Y) :-
    hombre(X),
    progenitor(X,Z),
    progenitor(Z,Y).

abuela_de(X,Y) :-
    mujer(X),
    progenitor(X,Z),
    progenitor(Z,Y).

hermanos(X,Y) :-
    progenitor(P,X),
    progenitor(P,Y),
    dif(X,Y).

 tia(X,Y) :-
    mujer(X),
    progenitor(P,Y),
    hermanos(X,P).
