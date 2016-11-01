
% cs571 Yoshii - HW5 program
% By Reordering Fly(Y) :- bird(Y) and rewriting it on top of fly(mary).
% We can have it output as the first one.

% gprolog requires the same predicates to be grouped together
% the top level goal is find


find(Who) :- wings(Who), write('The answer is: '), write(Who).

wings(X) :- fly(X).

airplane(dc10).
eagle(bill).

fly(mary).
fly(X) :- airplane(X).
fly(Y) :- bird(Y).


bird(Z) :- eagle(Z).
