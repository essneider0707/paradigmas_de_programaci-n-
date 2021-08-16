hombre(geovany).
hombre(andres).
hombre(sandro).
hombre(pedro).
hombre(eduardo).
hombre(jhon).
hombre(cesar).
hombre(david).
hombre(stiven).
hombre(juan).

mujer(michel).
mujer(nicol).
mujer(diana).
mujer(laura).
mujer(lucy).
mujer(olga).
mujer(nubia).
mujer(mariana).
mujer(sofia).
mujer(daniela).
mujer(evelia).


hijo(sandro,geovany).
hijo(olga,geovany).
hijo(sandro,cesar).
hijo(olga,cesar).
hijo(sandro,laura).
hijo(olga,laura).
hijo(pedro,nubia).
hijo(evelia,nubia).
hijo(pedro,lucy).
hijo(evelia,lucy).
hijo(geovany,andres).
hijo(nubia,andres).
hijo(geovany,mariana).
hijo(nubia,mariana).
hijo(geovany,sofia).
hijo(nubia,sofia).
hijo(geovany,daniela).
hijo(nubia,daniela).
hijo(jhon,juan).
hijo(laura,juan).
hijo(cesar,stiven).
hijo(diana,stiven).
hijo(cesar,michel).
hijo(diana,michel).
hijo(eduardo,david).
hijo(lucy,david).
hijo(eduardo,nicol).
hijo(lucy,nicol).


pareja(pedro,evelia).
pareja(evelia,pedro).
pareja(sandro,olga).
pareja(olga,sandro).
pareja(geovany,nubia).
pareja(nubia,geovany).
pareja(eduardo,lucy).
pareja(lucy,eduardo).
pareja(jhon,laura).
pareja(laura,jhon).
pareja(cesar,diana).
pareja(diana,cesar).

/* Reglas */
padre(X,Y):-hombre(X),hijo(X,Y).
madre(X,Y):-mujer(X),hijo(X,Y).
hermanos(X,Y):-hijo(Z,X),hijo(Z,Y), not(X==Y).
hermano(X,Y):-hombre(X),hermanos(X,Y).
hermana(X,Y):-mujer(X),hermanos(X,Y).
esposo(X,Y):-pareja(X,Y),hombre(X).
esposa(X,Y):-pareja(X,Y),mujer(X).
suegro(X,Y):-padre(X,Z),pareja(Y,Z).
suegra(X,Y):-madre(X,Z),esposos(Y,Z).
cunados(X,Y):-((pareja(X,Z),hermanos(Z,Y));(pareja(Y,Z),hermanos(Z,X))).
cunado(X,Y):-cunados(X,Y),hombre(X).
cunada(X,Y):-cunados(X,Y),mujer(X).
abuelo(X,Y):-hijo(Z,Y),padre(X,Z).
abuela(X,Y):-hijo(Z,Y),madre(X,Z).
nieto(X,Y):-hijo(Y,Z),hijo(Z,X),hombre(X).
nieta(X,Y):-hijo(Y,Z),hijo(Z,X),mujer(X).
tio(X,Y):-hijo(Z,Y),(hermano(X,Z);cunado(X,Z)).
tia(X,Y):-hijo(Z,Y),(hermana(X,Z);cunada(X,Z)).
primo(X,Y):-hijo(Z,X),hijo(W,Y),hermanos(Z,W),hombre(X).
prima(X,Y):-hijo(Z,X),hijo(W,Y),hermanos(Z,W),mujer(X).
antepasado(X,Z):-padre(X,Z).
ancestro(Z,X):- padre(X,Y),antepasado(Y,Z).
sobrino(X,Y):-tio(Y,X),hombre(X).
sobrina(X,Y):-tio(Y,X),mujer(X).
tia_politica(X,Y):-esposo(Z,X),tio(Z,Y).
tio_politico(X,Y):-esposa(Z,X),tia(Z,Y).