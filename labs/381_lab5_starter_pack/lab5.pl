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
% daughter/2
% sibling/2
% brother/2
% sister/2
% uncle/2       
% aunt/2
% grandparent/2
% grandfather/2
% grandmother/2
% grandchild/2
% ancestor/2
% descendant/2
% older/2
% younger/2
% regentWhenBorn/2
% cousin/2