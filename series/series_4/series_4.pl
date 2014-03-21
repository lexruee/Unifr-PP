%
% @author		Alexander Rüedlinger
% @matrikel-nr		08-129-710
% @date			2014
% @description		Exercise Series 4
%
% 1) Lists



% sameIndex

% iterate
sameIndex(A,[X|Xs],B,[Y|Ys]) :-
	A \= X,
	sameIndex(A,Xs,B,Ys).

sameIndex(A,[X|Xs],B,[Y|Ys]) :-
	B \= Y,
	sameIndex(A,Xs,B,Ys).

sameIndex(A,[A|_],Y,[Y|_]).


%deleteAll

% if lists is empty the result is empty as well.
deleteAll(X,[],[]).

% if head is equals to X then remove it.
deleteAll(X,[Head|Tail],R) :-
	Head == X,
	deleteAll(X,Tail,R).

% if head is not equals to X then add it to result.
deleteAll(X,[Head|Tail],[Head|R]) :-
	deleteAll(X,Tail,R).	

% string_toChars
string_toChars([],[]).
string_toChars([H|T],[Atom|R]) :-
	atom_char(Atom,H),
	string_toChars(T,R).


% 2. Syntax analyzer
% 2.1)
% production rules:	S -> BB, B -> 0B | 1
%
% DCG grammar:	
%		s1 --> s1_b, s1_b.
%		s1_b --> s1_t, s1_b.
%		s1_b --> [1].
%		s1_t --> [0].
%
% E.g.:		BB -> OB0B -> 0101 ok
%		BB -> 0BB -> 011	

% equivalent grammar in pure prolog:
s1_b(A, C) :-
	s1_t(A, B),
	s1_b(B, C).
s1_b([1|A], A).

s1_t([0|A], A).
s1(A, C) :-
	s1_b(A, B),
	s1_b(B, C).

%2.2)
% production rules:	S -> a S b, S -> epsilon
% 
% DCG grammar:
% s2 --> [a], s2, [b].
% s2 --> [].
%
% in pure prolog:
s2([a|A], C) :-
	s2(A, B),
	B=[b|C].
s2(A, A).


%2.3)
% DCG grammar:
e	--> t, ['+'], e.
t 	--> f, ['*'], t.
t 	--> f.
f 	--> [0].
f 	--> [1].
f 	--> [2].
f 	--> [3].
f 	--> [4].
f 	--> [5].
f 	--> [6].
f 	--> [7].
f 	--> [8].
f 	--> [9].
f	--> ['('],e,[')'].
e	--> t.			% Must be the last line!!

% equivalent grammar in pure prolog
%e(A, D) :-
%	t(A, B),
%	B=[+|C],
%	e(C, D).

%f([0|A], A).
%f([1|A], A).
%f([2|A], A).
%f([3|A], A).
%f([4|A], A).
%f([5|A], A).
%f([6|A], A).
%f([7|A], A).
%f([8|A], A).
%f([9|A], A).
%f(['('|A], C) :-
%	e(A, B),
%	B=[')'|C].

%e(A, B) :-
%	t(A, B).
