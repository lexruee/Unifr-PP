%
% @author		Alexander Rüedlinger
% @matrikel-nr		08-129-710
% @date			2014
% @description		Mini project: regular expression analyzer
%

% first part
% DCG grammar
exp --> sub_exp, ['|'], exp.

exp --> sub_exp.

sub_exp --> term, sub_exp | term.

term --> sub_term, ['*'] | sub_term.

sub_term --> char | ['.'] | ['('], exp, [')'].

char --> [X], {X\=='.',X\=='*',
            X\=='(',X\==')',X\=='|',
            char_type(X,ascii)}.
