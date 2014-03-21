% Exercise 1.3 - relations familiales


% child predicate
% X is child of Y <=> Y is parent of X
child(X,Y) :- parent(Y,X).

% father predicate
% X is father of Y <=> X is parent of Y and X is male
father(X,Y) :- parent(X,Y), male(X).

% mother predicate
% X is mother of Y <=> X is parent of Y and X is female
mother(X,Y) :- parent(X,Y), female(X).

% grand parent predicate
grandparent(X,Y) :- parent(Z,Y), parent(X,Z).

% grandfather
grandfather(X,Y) :- grandparent(X,Y), male(X).

% grandmother
grandmother(X,Y) :- grandparent(X,Y), female(X).

% brother
brother(X,Y) :-  male(X),parent(Somebody,X),parent(Somebody,Y), X \= Y.

% uncle
uncle(X,Y) :- brother(X,Par),parent(Par,Y).

% ancestor
ancestor(X,Y) :- parent(X,Y). % base case
ancestor(X,Y) :- parent(P,Y), ancestor(X,P). % recursion


% Exercise 1.4 - factoriel
factoriel(0,1).
factoriel(X,Y) :- X1 is X - 1, factoriel(X1,Z), Y is Z*X.


% Exercise 1.5 - hanoi

hanoi_sol(N) :- hanoi(N,D,I,G).
 
hanoi(0,_,_,_) :- !.
hanoi(N,D,I,G) :-
    M is N-1,
    hanoi(M,D,G,B),
    inform(D,I),
    hanoi(M,G,I,D).
 
inform(X,Y) :- writef("dep %q vers %q\n",[X,Y]).

