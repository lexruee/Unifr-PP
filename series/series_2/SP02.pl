
%***********************************************************************
% fibonacci(N,F)

fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,F) :-
  N>1,
  N1 is N-1,
  fibonacci(N1,F1),
  N2 is N-2,
  fibonacci(N2,F2),
  F is F1+F2.

%**********************************************************************
% myLength(N,L).

myLength(0,[]).
myLength(N,[_|Tail]) :-
  myLength(M,Tail),
  N is M+1.
	
%**********************************************************************
% myAppend(L1,L2,L3).

myAppend([],L,L).
myAppend([Head1|Tail1], L2,[Head1|Tail3]) :- myAppend(Tail1,L2,Tail3).

%**********************************************************************
% myLast(E,L).

myLast(E,[E]).
myLast(E,[_|Tail]) :- myLast(E,Tail).

%**********************************************************************
% myReverse(L1,L2).

myReverse([],[]).
myReverse([H|T],R) :- myReverse(T,TR), append(TR,[H],R).

%**********************************************************************
% mySelect(E,L1,L2).

mySelect(E,[E|T],T).
mySelect(E,[H|T],[H|TR]) :- mySelect(E,T,TR).

%**********************************************************************
% atoms(L).

atoms([X]) :- atom(X).
atoms([H|T]) :- atom(H), atoms(T).
