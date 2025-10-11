% persona(Nombre, Sexo, Pareja, Padres)
persona(abraham,hombre,mona,[]).
persona(mona,mujer,abraham,[]).
persona(clancy,hombre,jacqueline,[]).
persona(jacqueline,mujer,clancy,[]).
persona(herbert,hombre,_,[abraham,mona]).
persona(homero,hombre,marge,[abraham,mona]).
persona(marge,mujer,homero,[clancy,jacqueline]).
persona(patty,mujer,_,[clancy,jacqueline]).
persona(selma,mujer,_,[clancy,jacqueline]).
persona(bart,hombre,_,[homero,marge]).
persona(lisa,mujer,_,[homero,marge]).
persona(maggie,mujer,_,[homero,marge]).
persona(ling,mujer,_,[selma]).

% reglas
hombre(X):-persona(X,hombre,_,_).
mujer(X):-persona(X,mujer,_,_).
es_progenitor(P,H):-persona(H,_,_,L),member(P,L).
es_padre(P,H):-es_progenitor(P,H),hombre(P).
es_madre(M,H):-es_progenitor(M,H),mujer(M).
es_hijo(H,P):-es_progenitor(P,H),hombre(H).
es_hija(H,P):-es_progenitor(P,H),mujer(H).

es_hermano(H,X):-persona(X,_,_,L),member(P,L),es_progenitor(P,H),X\==H,hombre(H).
es_hermana(H,X):-persona(X,_,_,L),member(P,L),es_progenitor(P,H),X\==H,mujer(H).

es_abuelo(A,N):-es_progenitor(A,X),es_progenitor(X,N),hombre(A).
es_abuela(A,N):-es_progenitor(A,X),es_progenitor(X,N),mujer(A).

es_tio(T,S):-es_progenitor(P,S),es_hermano(T,P),hombre(T).
es_tia(T,S):-es_progenitor(P,S),es_hermana(T,P),mujer(T).

es_sobrino(S,T):-es_progenitor(P,S),(es_hermano(P,T);es_hermana(P,T)),hombre(S).
es_sobrina(S,T):-es_progenitor(P,S),(es_hermano(P,T);es_hermana(P,T)),mujer(S).


es_nieto(N,A):-es_progenitor(A,X),es_progenitor(X,N),hombre(N).
es_nieta(N,A):-es_progenitor(A,X),es_progenitor(X,N),mujer(N).