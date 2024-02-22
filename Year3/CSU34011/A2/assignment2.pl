% Question 1
s--> [0].
s--> {member(X,[1,2,3])}, [X], s, [X].

% Question 2
nbd --> h(Col1,Nat1,Pet1), h(Col2,Nat2,Pet2), h(Col3,Nat3,Pet3), {
        Col1\==Col2, Col2\==Col3, Col1\==Col3,
        Nat1\==Nat2, Nat2\==Nat3, Nat1\==Nat3,
        Pet1\==Pet2, Pet2\==Pet3, Pet1\==Pet3
    }.

h(Col,Nat,Pet) --> [h(Col,Nat,Pet)], {col(Col), nat(Nat), pet(Pet)}.

col(red).
col(blue).
col(green).

nat(english).
nat(spanish).
nat(japanese).

pet(jaguar).
pet(snail).
pet(zebra).

% Question 3
fib --> [0,1], fib(0,1).
fib(_,_) --> [].
fib(X,Y) --> {Z is X+Y}, [Z], fib(Y,Z).


% Question 4

tran(q0,1,q1).
tran(q0,0,q0).
tran(q0,1,q0).
tran(q1,0,q2).
tran(q1,1,q2).
tran(q2,0,q3).
tran(q2,1,q3).

final(q3).

accept(L) :- steps(q0,L,F), final(F).
steps(Q,[],Q).
steps(Q,[H|T],Q2) :- tran(Q,H,Qn), steps(Qn,T,Q2).

q0 --> [1], q1.
q0 --> [1], q0.
q0 --> [0], q0.
q1 --> [0], q2.
q1 --> [1], q2.
q2 --> [0], q3.
q2 --> [1], q3.

q3 --> [].

numeral(0).
numeral(succ(X)) :- numeral(X).

convert(0,0).
convert(succ(X),R) :-
    convert(X,Y),
    R is Y+1.

l3(String, Numeral) :-
    numeral(Numeral),
    convert(Numeral, Int),length(String, Int),
    accept(String). 

% Test Cases 
s(X,[]). 

accept(X).
