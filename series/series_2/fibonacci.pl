%
% @author		Alexander Rüedlinger
% @matrikel-nr		08-129-710
% @date			2014
% @description		Solves exercise 2.
%

fib(0,0).							% base case
fib(1,1).							% base case
fib(N,F) :- N >= 0, 				% check cond.
			N1 is N-1, N2 is N-2, 	% recursion part
			fib(N1,X), fib(N2,Z), 
			F is X + Z.
