%HECHOS
nacionalidad_estadounidense(coronel_west).
es_enemigo_de(corea_del_sur,estados_unidos).
son_armas(misiles).
tienen(corea_del_sur,misiles).

%RELACION
vende(coronel_west,corea_del_sur,misiles).

%REGLA

es_criminal(Persona):-
    nacionalidad_estadounidense(Persona),
    es_enemigo_de(Pais,estados_unidos),
    son_armas(Armas),
    vende(Persona,Pais,Armas).