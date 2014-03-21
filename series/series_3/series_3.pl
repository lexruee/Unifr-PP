%
% @author		Alexander Rüedlinger
% @matrikel-nr		08-129-710
% @date			2014
% @description		Exercise Series 3
%


% Ex. 1

% insert
% without append!!!! :-)
insert(E,[],R)	:- 	[E|[]]=R.
insert(E,Xs,[E|Xs]) 	:- [H|T] = Xs, E =< H.
insert(E,[H|T],[H|R]) 	:- E > H, insert(E,T,R).


% merge lists
% question how can I combine both branches X =< Y, and X > Y
% into a single mergeLists predicate?
mergeLists(R,[],R).
mergeLists([],R,R).
mergeLists(Left,Right,R) :- 	[X|Xs]=Left,	%if X =< Y,
				[Y|Ys]=Right,
				X =< Y,
				mergeLists(Xs,Right,Z),
				append([X],Z,R).

mergeLists(Left,Right,R) :- 	[X|Xs]=Left, %if X > Y,
				[Y|Ys]=Right,
				X > Y,
				mergeLists(Ys,Left,Z),
				append([Y],Z,R).

% mergeSort
mergeSort([],[]).
mergeSort([X],[X]).
mergeSort(List,R) :-	
			split(List,Lp,Rp),
			mergeSort(Lp,Left),
			mergeSort(Rp,Right),
			mergeLists(Left,Right,R).

% split list into two parts
split([],[],[]).
split([X],[X],[]).
split([X,Y|L],[X|Lx],[Y|Ly]) :-  split(L,Lx,Ly).

%reverse with accumulator
myReverse(X,R)		:- myReverse(X,[],R).
myReverse([],R,R).
myReverse([X|Xs],Z,R)	:- myReverse(Xs,[X|Z],R).

% recursive reverse using an accumulator!
reverseRec(L,Y) :- reverseRec(L,[],Y).

reverseRec([],Y,Y).
reverseRec([X|Xs],Z,Y) :-
	is_list(X),!,
	myReverse(X,R),
	reverseRec(Xs,[R|Z],Y).
	
reverseRec([X|Xs],Y,Z)	:- reverseRec(Xs,[X|Y],Z).

% myMin using an accumulator!
myMin([Y|Ys],Min)  :- myMin(Ys,Y,Min). 	% 
myMin([],Min, Min). % if list is empty we've found the minimum
myMin([Y|Ys],CurrentMin,Min)  :-	
		NewMin is min(Y,CurrentMin), % determine new min
		myMin(Ys,NewMin,Min).	% propogate new min


% Ex. 2

% sum
sum_list([],Acc,Acc).
sum_list([X|Xs],Acc,Sum) :- 	Acc2 is Acc + X,
				sum_list(Xs,Acc2,Sum).

%reverseRec see Ex.1 reverseRec
% nothing todo.


%myMin see Ex.1 myMin
% nothing todo.


%fibonacci(N,F)
fibonacci(0,0).
fibonacci(1,1).
fibonacci(N,F)	:-	N > 1,
			fibonacci(N,1,0,F).
%fibonacci using an accumulator
fibonacci(2,F1,F2,F) :- F is F1 + F2. 
fibonacci(N,F1,F2,F) :- N1 is N-1,
			FN is F1 + F2,
			fibonacci(N1,FN,F1,F).

% quickSort
quickSort([],[]).
quickSort([Pivot|Xs],Sorted) :-	
			partition(Pivot,Xs,Left,Right),
			quickSort(Left,LeftSorted),
			quickSort(Right,RightSorted),
			append(LeftSorted,[Pivot|RightSorted],Sorted).

% quickSort partiton
partition(Pivot,[],[],[]).
	
partition(P,[X|Xs],[X|Left],Right) :-
		X < P,
		partition(P,Xs,Left,Right).

partition(P,[X|Xs],Left,[X|Right]) :-
		X >= P,
		partition(P,Xs,Left,Right).

