/***************************************/
%     CS 381 - Programming Lab #5       %
%                                       %
%  < Bennett Hamilton >                 %
%  < hamibenn@oregonstate.edu >         %
%                                       %
/***************************************/

% load family tree
:- consult('royal.pl').

% enables piping in tests
portray(Term) :- atom(Term), format("~s", Term).


% mother/2
mother(M,C):- parent(M,C), female(M).

% father/2
father(F,C):- parent(F,C), male(F).

% spouse/2
spouse(X,Y):- married(X,Y).
spouse(X,Y):- married(Y,X).

% child/2
child(C,P):- parent(P,C).

% son/2
son(S,P):- child(S,P), male(S).

% daughter/2
daughter(D,P):- child(D,P), female(D).

% sibling/2
sibling(X,Y):- parent(P,X), parent(P,Y), X \= Y.

% brother/2
brother(B,X):- sibling(B,X), male(B).

% sister/2
sister(S,X):- sibling(S,X), female(S).

% aunt/2
aunt(A,N):- parent(P,N), sister(A,P).
aunt(A,N):- parent(P,N), spouse(A,S), brother(S,P).

% uncle/2 
uncle(U,N):- parent(P,N), brother(U,P).
uncle(U,N):- parent(P,N), spouse(U,S), sister(S,P)

% grandparent/2
grandparent(GP,GC):- parent(P,GC), parent(GP,P).

% grandfather/2
grandfather(GF,GC):- grandparent(GF,GC), male(GF).

% grandmother/2
grandmother(GM,GC):- grandparent(GM,GC), female(GM).

% grandchild/2
grandchild(GC,GP):- grandparent(GP,GC).

% ancestor/2
% descendant/2
% older/2
% younger/2
% regentWhenBorn/2
% cousin/2