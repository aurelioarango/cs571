%  This Mini Expert System advises on what to wear.

% By saying top, the system begins.
%  It will ask for hair, skin, weight and height information.
% choose will bind a value to the variable Dress.
%  You must press a period after your input.
%  Weight and Height should be given in terms of Kg and Cm.

top :- write('Hair color?'), read(Hair), write('Skin Tone?'), read(Skin),
       write('Weight?'), read(W), write('Height?'), read(H),
       choose(Hair, Skin, W, H , Dress),
       write('You should wear '), write(Dress), nl.

% Confidence Factor of choose rules are all 60 percent.

% choose rules follow ...

% simple black dress is chosen if person is brunnete and slender
choose(Hair, Skin, W, H, 'a simple black dress') :-
       brunette(Hair), slender(W, H).

% Laura Askley is chosen if girl has red or black hair, freckles
% or fair skin, and fuller
choose(Hair, Skin, W, H, 'Laura Ashley type') :-
       reddish(Hair, Skin), fuller(W, H).

% pastel is chosen if she is skinny
choose(Hair, Skin, W, H, 'a pastel dress') :-
       Hair = blonde, slender(W, H).

% *****  Add two more choose rules here

% red Dress if girl is blond, slender and tall
choose(Hair, Skin, W, H, 'red dress') :- Hair = blonde, slender(W,H) ,H > 170.

% If girl is tall, slander, and reddish
choose(Hair, Skin, W, H, 'lavender night dress') :-
  reddish(Hair, Skin), slender(W,H), H > 170.

% T shirt is chosen if all of the above failed
choose(Hair, Skin, W, H, 'a T-shirt and jeans').

% CF for these rules is 100 because they are definitions.
brunette(Hair) :- Hair = black.
brunette(Hair) :- Hair = dark_brown.

% CF for these rules is 90.
reddish(Hair, Skin)   :- Hair = red, Skin = freckles.
reddish(Hair, Skin)   :- Hair = red.
reddish(Hair, Skin)   :- Hair = brown, Skin = fair.
reddish(Hair, Skin)   :- Skin = freckles.

% CF for these rules is 70.
slender(W, H) :- H - 100 > W.
fuller(W, H) :- H - 100 < W.

% This system uses no facts.
