% CSU34011 Symbolic Programming

% Helper functions

pos(s(0)).
pos(s(X)) :- pos(X).
neg(p(0)).
neg(p(X)):- neg(X).

simplify(0,0).
simplify(s(0),s(0)).
simplify(p(0), p(0)).
simplify(s(X),s(X)) :- pos(X).
simplify(p(X), p(X)) :- neg(X).
simplify(s(p(X)),X).
simplify(p(s(X)),X).

% Question 1

add2(0,0,0).
add2(0,s(X), s(X)) :- add2(0,X,X).
add2(X+R, Y, Z) :- add2(X,R,P), add2(P,Y,Z).
add2(0, Y+S, Z) :- add2(Y+S, 0, Z).
add2(s(X), Y, s(Z)):- add2(X,Y,Z).

% Question 2
 
% Will not solve s(+s(…), assumed as error as not seen in notes or LPN. 
% Confirmed with tutor from lab.

add3(0,0,0).
add3(0,X,X) :- pos(X);neg(X).

add3(0, Y+S, Z) :- add3(Y+S, 0, Z).
add3(X+R, Y, Z) :- add3(X,R,P), add3(P,Y,Z).

add3(0,p(s(X)),Z):- add3(X, 0, Z).
add3(0,s(p(X)),Z):- add3(X, 0,Z).

add3(p(X), Y, U) :- add3(X,Y,Z), simplify(p(Z),U).
add3(s(X), Y, U) :- add3(X,Y,Z), simplify(s(Z), U).

% Question 3

minus(0,0).
minus(s(p(X)), Z) :- minus(X,Z).
minus(p(s(X)), Z):- minus(X,Z).
minus(p(X), s(Z)):- minus(X,Z), X\=s(_).
minus(s(X), p(Z)) :- minus(X,Z), X\=p(_).

% The following two lines are needed for Q6
minus(-Y,X):- minus(Y,U), minus(U,X).
minus(X-Y,Z) :- add4(X,-Y,U), minus(U,Z).


% Question 4

add4(0,0,0).
add4(0,X,X) :- pos(X);neg(X).

add4(0, Y+S, Z) :- add4(Y+S, 0, Z).
add4(X+R, Y, Z) :- add4(X,R,P), add4(P,Y,Z).
add4(0, -S, Z) :- minus(S,R), add4(0,R,Z).
add4(-S, Y, Z) :- minus(S,R), add4(R,Y,Z).

add4(0,p(s(X)),Z):- add4(X, 0, Z).
add4(0,s(p(X)),Z):- add4(X, 0,Z).

add4(p(X), Y, U) :- add4(X,Y,Z), simplify(p(Z),U).
add4(s(X), Y, U) :- add4(X,Y,Z), simplify(s(Z), U).

% Question 5

subtract(X,Y,Z) :- minus(Y,W), add4(X,W,Z).

% Question 6

add5(0,0,0).
add5(0,X,X) :- pos(X);neg(X).

add5(0, Y+S, Z) :- add5(Y+S, 0, Z).
add5(X+R, Y, Z) :- add5(X,R,P), add5(P,Y,Z).
add5(0, -S, Z) :- minus(S,R), add5(0,R,Z).
add5(-S, Y, Z) :- minus(S,R), add5(R,Y,Z).
add5(0, Y-S, Z) :- add5(Y-S,0,Z).
add5(X-R,Y,Z) :- minus(R,S), add5(X+S, Y,Z).

add5(0,p(s(X)),Z):- add5(X, 0, Z).
add5(0,s(p(X)),Z):- add5(X, 0,Z).

add5(p(X), Y, U) :- add5(X,Y,Z), simplify(p(Z),U).
add5(s(X), Y, U) :- add5(X,Y,Z), simplify(s(Z), U).


subtract2(X,Y,Z) :- minus(Y,W), add5(X,W,Z).
