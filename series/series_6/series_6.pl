%
% @author			Alexander Rüedlinger
% @matrikel-nr		08-129-710
% @date				2014
% @description		Solutions for Exercise Series 6
%


%	Remark: 
%	Too many exercises in this series. Some students also take other courses.


% 1. Predicates using DCG
% myLast(?X,+L)
myLast(X,L) :- myLastDCG(X,L,[]).
myLastDCG(X) --> [_],myLastDCG(X).
myLastDCG(X) --> [Y],{X = Y}. %if we use == we cannot call myLast(X,[a,b])

% alternative way
myLastAlt(X,[_|T]) :- myLastAlt(X,T).
myLastAlt(X,[X|[]]).


% convertToDec(X,L)
% i could not find a better solution, see extra argument [R,Pos]
convertToDec(R,L) :- convertToDecHelper([R,_],L,[]).

convertToDecHelper([R,Pos]) --> [X],convertToDecHelper([Sum,RPos]), 
								{Pos is RPos + 1,R is X*2^Pos + Sum}.	% 2^Pos, Pos>0
convertToDecHelper([X,0]) --> [X].									% 2^0, Pos = 0

% alternative way
convertToDecAlt(R,[X|Xs],Pos) :- convertToDecAlt(Sum,Xs,RPos), 
								Pos is RPos + 1,R is X*2^Pos + Sum.
convertToDecAlt(0,[0],0).
convertToDecAlt(1,[1],0).



% 2. Search tree
% See pdf file

% 4.
myMax(X,Y,Y).
myMax(X,Y,X) :- X>=Y,!.

myMax2(X,Y,Z) :- X>=Y, Z is X. 
myMax2(X,Y,Y) :- X<Y, Z is Y.


% 3. Predicates using cut

% separate(+X,+L,?L1,?L2)
%without cut
separate(Pivot,[X|Xs],[X|L1],L2) :- X =< Pivot,
									separate(Pivot,Xs,L1,L2).
separate(Pivot,[X|Xs],L1,[X|L2]) :- X > Pivot,
									separate(Pivot,Xs,L1,L2).
separate(_,[],[],[]).

% with cut
separateC(Pivot,[X|Xs],[X|L1],L2) :- X =< Pivot,!,
										separateC(Pivot,Xs,L1,L2).
separateC(Pivot,[X|Xs],L1,[X|L2]) :- 	separateC(Pivot,Xs,L1,L2).
separateC(_,[],[],[]).



% myUnion(+E1,+E2,?E3)
% without cut
myUnionC([],Res,Res).
myUnionC([X|Xs],Ys,[X|Res]) :- not(member(X,Ys)), myUnionC(Xs,Ys,Res).
myUnionC([X|Xs],Ys,Res) :- member(X,Ys), myUnionC(Xs,Ys,Res).

% with cut
myUnion([X|Xs], Ys, Res) :- member(X,Ys), !, myUnion(Xs,Ys,Res).
myUnion([X|Xs], Ys, [X|Res]) :- myUnion(Xs,Ys,Res).
myUnion([],Res,Res).


% myIntersection(+E1,+E2,?E3)
% without cut
myIntersection([],_,[]).
myIntersection(_,[],[]).
myIntersection([X|Xs],Ys,[X|Res]) :- member(X,Ys),myIntersection(Xs,Ys,Res).
myIntersection([X|Xs],Ys,Res) :- myIntersection(Xs,Ys,Res).

% with cut
myIntersectionC([],_,[]).
myIntersectionC(_,[],[]).
myIntersectionC([X|Xs],Ys,[X|Res]) :- member(X,Ys),!,myIntersection(Xs,Ys,Res).

% maxmin(+L,?Max,?Min)

% using pseudo "tail recursion" without a cut
% i know i could combine comparisons in one maxMinList....
maxmin(X,Min,Max) :- minList(X,Min),maxList(X,Max).


minList([H|T], Min) :- minList(T, H, Min). 
minList([], Min, Min).
minList([H|T], MinCand, Min) :-
    Min1 is MinCand, H >= MinCand,
    minList(T, Min1, Min).

minList([H|T], MinCand, Min) :-
    Min1 is H, H < MinCand,
    minList(T, Min1, Min).


maxList([H|T], Max) :- maxList(T, H, Max).
maxList([], Max, Max).
maxList([H|T], MaxCand, Max) :-
    Max1 is MaxCand, H =< MaxCand,
    maxList(T, Max1, Max).

maxList([H|T], MaxCand, Max) :-
    Max1 is H, H > MaxCand,
    maxList(T, Max1, Max).


% using pseudo "tail recursion" without a cut
% doesn't change anything
maxminC(X,Min,Max) :- minListC(X,Min),maxList(X,Max).

minListC([H|T], Min) :- minListC(T, H, Min). 
minListC([], Min, Min).
minListC([H|T], MinCand, Min) :-
    Min1 is MinCand, H >= MinCand, !,
    minListC(T, Min1, Min).

minListC([H|T], MinCand, Min) :-
    Min1 is H, H < MinCand, !,
    minListC(T, Min1, Min).


maxListC([H|T], Max) :- maxListC(T, H, Max).
maxListC([], Max, Max).
maxListC([H|T], MaxCand, Max) :-
    Max1 is MaxCand, H =< MaxCand, !,
    maxListC(T, Max1, Max).

maxListC([H|T], MaxCand, Max) :-
    Max1 is H, H > MaxCand, !,
    maxListC(T, Max1, Max).


