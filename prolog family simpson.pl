%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% HECHOS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Hombres
hombre(abraham).
hombre(clancy).
hombre(herbert).
hombre(homero).
hombre(bart).

% Mujeres
mujer(mona).
mujer(jacqueline).
mujer(marge).
mujer(patty).
mujer(selma).
mujer(lisa).
mujer(maggie).
mujer(ling).

% Relaciones de parentesco
es_progenitor(abraham, homero).
es_progenitor(abraham, herbert).
es_progenitor(mona, homero).
es_progenitor(mona, herbert).
es_progenitor(clancy, marge).
es_progenitor(clancy, selma).
es_progenitor(clancy, patty).
es_progenitor(jacqueline, marge).
es_progenitor(jacqueline, selma).
es_progenitor(jacqueline, patty).
es_progenitor(homero, bart).
es_progenitor(homero, lisa).
es_progenitor(homero, maggie).
es_progenitor(marge, bart).
es_progenitor(marge, lisa).
es_progenitor(marge, maggie).
es_progenitor(selma, ling).

% Relaciones de pareja
es_pareja(abraham, mona).
es_pareja(mona, abraham).
es_pareja(clancy, jacqueline).
es_pareja(jacqueline, clancy).
es_pareja(homero, marge).
es_pareja(marge, homero).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% REGLAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Padre
es_padre(Padre, Hijo) :- 
    es_progenitor(Padre, Hijo), 
    hombre(Padre).

% Madre
es_madre(Madre, Hijo) :- 
    es_progenitor(Madre, Hijo), 
    mujer(Madre).

% Esposo
es_esposo(Esposo, Esposa) :- 
    es_pareja(Esposo, Esposa), 
    hombre(Esposo).

% Esposa
es_esposa(Esposa, Esposo) :- 
    es_pareja(Esposo, Esposa), 
    mujer(Esposa).

% Hijo
es_hijo(Hijo, Progenitor) :- 
    es_progenitor(Progenitor, Hijo), 
    hombre(Hijo).

% Hija
es_hija(Hija, Progenitor) :- 
    es_progenitor(Progenitor, Hija), 
    mujer(Hija).

% Hermano
es_hermano(Hermano, Persona) :- 
    es_progenitor(Padre, Persona), 
    es_progenitor(Padre, Hermano), 
    Persona \== Hermano, 
    hombre(Hermano).

% Hermana
es_hermana(Hermana, Persona) :- 
    es_progenitor(Padre, Persona), 
    es_progenitor(Padre, Hermana), 
    Persona \== Hermana, 
    mujer(Hermana).

% Sobrino
es_sobrino(Sobrino, Tio) :- 
    es_progenitor(Padre, Sobrino),
    (es_hermano(Padre, Tio); es_hermana(Padre, Tio)),
    hombre(Sobrino).

% Sobrina
es_sobrina(Sobrina, Tio) :- 
    es_progenitor(Padre, Sobrina),
    (es_hermano(Padre, Tio); es_hermana(Padre, Tio)),
    mujer(Sobrina).

% Tío
es_tio(Tio, Sobrino) :- 
    es_progenitor(Padre, Sobrino),
    es_hermano(Padre, Tio),
    hombre(Tio).

% Tía
es_tia(Tia, Sobrino) :- 
    es_progenitor(Padre, Sobrino),
    es_hermana(Padre, Tia),
    mujer(Tia).

% Abuelo
es_abuelo(Abuelo, Nieto) :- 
    es_progenitor(Abuelo, Persona), 
    es_progenitor(Persona, Nieto), 
    hombre(Abuelo).

% Abuela
es_abuela(Abuela, Nieto) :- 
    es_progenitor(Abuela, Persona),
    es_progenitor(Persona, Nieto),
    mujer(Abuela).

% Nieto
es_nieto(Nieto, Abuelo) :- 
    es_progenitor(Persona, Nieto),
    es_progenitor(Abuelo, Persona),
    hombre(Nieto).

% Nieta
es_nieta(Nieta, Abuelo) :- 
    es_progenitor(Persona, Nieta),
    es_progenitor(Abuelo, Persona),
    mujer(Nieta).

