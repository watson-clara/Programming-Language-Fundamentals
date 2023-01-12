
/***************************************/
%     CS 381 - Programming Lab #5       %
%                                       %
%  < Clara Watson >						%
%  < watsoncl@oregonstate.edu >	        %
%                                       %
/***************************************/

% load family tree
:- consult('royal.pl').

% enables piping in tests
portray(Term) :- atom(Term), format("~s", Term).
% P----PARENT       M-----MOTHER       F-----FATHER
% SO---SPOUCE1      SOS---SPOUCE2
% C----CHILD        S-----SON          D-----DAUGHTER
% SIB--SIBLING      FSIB--SIBLING1     SSIB--SIBLING2
% BRO--BROTHER      SIS---SISTER
% CSN--COUSIN
% UN---UNCLE        ANT---AUNT
% GP---GRANDPARENT  GF----GRANDFATHER  GM----GRANDMOTHER
% GC---GRANDCHILD
% AC---ANCESTOR     DC----DESCENDANT
% O----OLDER        Y-----YOUNGER

% Parents
mother(M,C):- parent(M,C), female(M). 
father(F,C):- parent(F,C), male(F). 

spouse(SO,SOS):- married(SO,SOS); married(SOS,SO).  

% Immediate Family
child(C,P):- parent(P,C).
son(S,P):- child(S,P), male(S).
daughter(D,P):- child(D,P), female(D).

sibling(FSIB,SSIB):- child(FSIB,P), child(SSIB,P), FSIB\=SSIB.
brother(BRO,SIB):- sibling(BRO,SIB), male(BRO).
sister(SIS,SIB):- sibling(SIS,SIB), female(SIS).

% Extended Family
uncle(UN,C):- parent(P,C), brother(UN,P). % brother of parent 
uncle(UN,C):- parent(P,C), sister(SIS,P), spouse(UN,SIS). % spouce of aunt
aunt(ANT,C):- parent(P,C), sister(ANT,P). % sister of parent 
aunt(ANT,C):- parent(P,C), brother(BRO,P), spouse(ANT,BRO). % spouce of uncle

grandparent(GP,C):- parent(P,C), parent(GP,P).
grandfather(GF,C):- parent(P,C), father(GF,P).
grandmother(GM,C):- parent(P,C), mother(GM,P).
grandchild(GC,C):- child(GC,P), child(P,C).

% Ancestors
ancestor(AC,C) :- parent(AC,C). % one generation back
ancestor(AC,P) :- parent(AC,C), ancestor(C,P). % if multiple generations back 
descendant(DC,P) :- child(DC,P). % one generation forward
descendant(DC,C) :- child(DC,P), descendant(P,C). % if multiple generations forward 

% Numeric Comparisons
older(O,Y) :- born(O,A), born(Y,B), A<B.
younger(Y,O) :- born(Y,A), born(O,B), A>B.
regentWhenBorn(R,Y):- born(Y,A), reigned(R, SRT, END), A > SRT, A < END.

% EXTRA 
cousin(CSN,C):- uncle(UN,C), child(CSN,UN). % child of sibling of parent -- uncle 
cousin(CSN,C):- aunt(ANT,C), child(CSN,ANT). % child of sibling of parent -- aunt
