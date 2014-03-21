%
% @author		Alexander Rüedlinger
% @matrikel-nr		08-129-710
% @date			2014
% @description		Solves exercise 3.
%


% --------------------------------------------------------------------
% myLength predicate
%
myLength(0,[]).							% base case
myLength(N,[_|Tail]) :- 		myLength(M,Tail),	% recursion
					N is M+1.
% --------------------------------------------------------------------



% --------------------------------------------------------------------
% myAppend predicate
%
myAppend([],L,L). 							% edge case
myAppend([X|T],L,[X|R]) :- myAppend(T,L,R).
% --------------------------------------------------------------------


% --------------------------------------------------------------------
% myLast predicate
% I wonder if there is a soltion without the member function 
% or myLength function...
%
myLast(E,L) :-  	myLength(1,L), member(E,L). 			% check that L is of length one, that E is member of L.
myLast(E,L) :- 		L = [Head | Tail] , myLast(E,Tail).
% --------------------------------------------------------------------

% --------------------------------------------------------------------
% myReverse predicate
myReverse([],[]).
myReverse([H|T],R) :- myReverse(T,RevT), myAppend(RevT,[H],R).
% --------------------------------------------------------------------


% --------------------------------------------------------------------
% mySelect predicate
mySelect(X,[X|Xs],Xs).
mySelect(X,[Y|Ys],[Y|Zs]) :-	X\=Y, mySelect(X,Ys,Zs).
% --------------------------------------------------------------------



% ---------------------------------------s-----------------------------
% atoms
atoms([]).
atoms([H|T]) :- atom(H),atoms(T).
% --------------------------------------------------------------------

