%
% @author			Alexander Rüedlinger
% @matrikel-nr		08-129-710
% @date				2014
% @description		Mini project: regular expression analyzer
%

% warm up example
s(s(a,SA,b)) --> [a],s(SA),[b].
s(s(epsilon)) --> [].
% example call: s(L,['a','a','b','b'],S).
% L = s(a, s(a, s(epsilon), b), b),
% S = [] 


% DCG grammar from the first part of the project

exp(exp(or(exp(R,L)))) --> sub_exp(R), ['|'], exp(L).

exp(exp(X)) --> sub_exp(X).


sub_exp([X|Xs]) --> term(X), sub_exp(Xs).	% ok
sub_exp([X|[]]) --> term(X).				% ok

term(iter(X)) --> sub_term(X), ['*'].		% ok
term(X) --> sub_term(X).					% ok

sub_term(char(X)) --> char(X). 				% ok
sub_term(point) --> ['.']. 					% ok

sub_term(X) --> ['('], exp(X), [')'].

char(X) --> [X], {X\=='.',X\=='*', 			% ok
            X\=='(',X\==')',X\=='|',
            char_type(X,ascii)}.
            
            
  


