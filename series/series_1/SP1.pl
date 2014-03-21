:- ['SP1_02_annex.pl'].

child(X,Y) :- parent(Y,X).

father(X,Y) :- male(X), parent(X,Y).

mother(X,Y) :- female(X), parent(X,Y).

grandparent(X,Y) :- parent(X,Z), parent(Z,Y).

grandfather(X,Y) :- father(X), grandparent(X,Y).

uncle(X,Y) :- male(X), parent(A1,X), parent(A1,A2), parent(A2,Y), A2\==X.

ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,Z), ancestor(Z,Y).

%% Notes sur ancestor
%%		les versions suivantes de ancetre posent problème
%% Version 1 :
%% ancestor(X,Y) :- parent(X,Y).
%% ancestor(X,Y) :- ancestor(X,Z), parent(Z,Y).
%% si un des deux parametre est non instancié, ou si la reponse devrait etre no,
%% la deuxième clause crée une branche infinie
%% ex : la question : ancestor(A1,A2) retourne tous les couples A1 et A2 puis entre dans une branche infinie

%% Version 2 :
%% ancestor(X,Y) :- ancestor(X,Z), parent(Z,Y).
%% ancestor(X,Y) :- parent(X,Y).
%% Quelle que soit la question, ancestor entre dans une branche infinie



%***********************************************************************
% factorial(N,FN)

factorial(0,1).
factorial(N,FN):-
  N>0,             % this is needed!
  PN is N-1,
  factorial(PN,FPN),
  FN is FPN*N.

%**********************************************************************
% hanoi(ND,P1,P2,P3).

hanoi(1,D,I,G) :- writef("dep from %q to %q \n",[D,G]).
hanoi(N,D,I,G) :-
	N > 1,
	PN is N-1,
	hanoi(PN,D,G,I),
	hanoi(1,D,I,G),
	hanoi(PN,I,D,G).
	
	