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



% your code here...