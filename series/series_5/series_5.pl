%
% @author		Alexander Rüedlinger
% @matrikel-nr		08-129-710
% @date			2014
% @description		Exercise Series 5
%

%1)

%predicate: sortedList
sortedList([X|Xs]) :-
	check([X|Xs],X).

check([],_).
check([X|[]],M) :-
	M =< X.

check([X,Y|Xs],M) :-
	X < Y,
	M =< X,
	check(Xs,Y).


% predicate: createLA
% basically this is just a hash map.
% Implemeted as a list containing tuples with key-value.
createLA([],[],[]).
createLA([Key|K],[Val|V],[[Key,Val]|R]) :-
	createLA(K,V,R).

% predicate: valuesLA
valuesLA([],_,[]).
valuesLA([[K,V]|Tail],Key,[V|LV]) :-
	K == Key,
	valuesLA(Tail,Key,LV).
valuesLA([[K,_]|Tail],Key,LV) :-
	K \== Key,
	valuesLA(Tail,Key,LV).


%2)
% DCG grammar for arithmetic expression
%extension: division and power function
f(N) --> ['('], e(N), [')'].
e(N) --> t(L), ['+'], e(R),{N is L + R}.
t(N) --> f(L), ['*'], t(R),{N is L * R}.
t(N) --> f(L), ['/'], t(R),{N is L / R}.
t(N) --> f(L), ['^'], t(R),{N is L ^ R}.
e(N) --> t(N).
t(N) --> f(N).
f(Num) --> [Num], {integer(Num)}.


%3)
% This DCG grammar respects some rules in the french language.
% E.g. les amis racontent. C'est une phrase correct en francais.
% La phrase "les amis raconte" par contre est faux. 
%
%
maPhrase --> groupeNominal(G,S),groupeVerbal(S).

groupeNominal(G,S) --> article(G,S),substantif(G,S)
			|article(G,S),substantif(G,S),adjectif(G,S)
			|prenom(G,S).

groupeVerbal(S) --> verbe(S).
prenom(f,s) --> [ruth].
prenom(m,s) --> [david].

article(m,s) --> [le]|[un].
article(f,s) --> [la]|[une]. 
article(p,p) --> [les]|[des].

substantif(m,s) --> [chien]|[chat].
substantif(f,s) --> [voiture]|[souris].
substantif(p,p) --> [amis].

verbe(s) --> [chante]|[roule]|[marche].
verbe(p) --> [racontent]|[avancent].


adjectif(m,s) --> [blanc]|[rouge].
adjectif(m,p) --> [blancs]|[rouges].
adjectif(f,s) --> [blanche]|[rouge].
adjectif(f,p) --> [blanches]|[rouges].


%
%finally, mergeSort without append statement, yeah.

% predicate: mergeSort
% implement merge sort without append...
mergeSort([X],[X]).
mergeSort(List,R) :-
	split(Left,Right,List),
	mergeSort(Left,SL),
	mergeSort(Right,SR),
	mergeLists(SL,SR,R).

%helper predicate: merge two sorted lists
mergeLists([],R,R).
mergeLists(R,[],R).
mergeLists([X|Xs],[Y|Ys],[X|R]) :-
	X < Y,
	mergeLists(Xs,[Y|Ys],R).

mergeLists([X|Xs],[Y|Ys],[Y|R]) :-
	X >= Y,
	mergeLists([X|Xs],Ys,R).

%helper predicate: split a list into two lists
split([],[],[]).
split([X|Xs],[Y|Ys],[X,Y|RR]) :-
	split(Xs,Ys,RR).

split([X|Xs],[],[X|RR]) :-
	split(Xs,[],RR).

split([],[Y|Ys],[Y|RR]) :-
	split([],Ys,RR).

