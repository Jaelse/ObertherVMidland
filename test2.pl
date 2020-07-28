:- use_module(library(date_time)).

within(T, TS, _) :- 
    T = TS,
    !.

within(T, _, TE) :- 
    T = TE,
    !.

within(T, TS, TE) :- 
    after(T, TS),
    before(T, TE),
    !.

after(A, B) :-
    date_difference(
        A,
        B,
        [Y years, M months, D days]
    ),
    Y >= 0,
    M >= 0, 
    D >= 0,
    (Y > 0, !; M > 0, !; D > 0, !).

before(A, B) :-
    date_difference(
        B,
        A,
        [Y years, M months, D days]
    ),
    Y >= 0,
    M >= 0, 
    D >= 0,
    (Y > 0, !; M > 0, !; D > 0, !).


initial(
    communication(
        debt_collector(DC), consumer(C), collection_letter(INFORMATION), DATE
        )
    ) :- 
    communication(debt_collector(DC), consumer(C), collection_letter(INFORMATION), DATE),
    communication(debt_collector(DC), consumer(C), collection_letter(INFORMATION), DATE_1),
    not(before(DATE_1, DATE)).

paid(consumer(C), debt(consumer(C), money(M), owe(OWNER))).

notice(debt_collector(DC), consumer(C), inform(FACTS)) :- .



% debt
% (5) The term “debt” means 
% any obligation 
% or 
% alleged obligation 
% of a consumer to pay money 
% arising out of a transaction in which 
% the money, 
% property, 
% insurance, 
% or 
% services 
% which are the 
% subject of the transaction are primarily for personal, 
% family, or household purposes, whether or not such obligation 
% has been reduced to judgment.

% the term "debt" means any obligation 
% of a consumer to pay money
% arising out of a transaction in which
% the money,
% which are the part oof the transaction are primarily for personal purposes/

% TODO: improve this rule
debt(consumer(C), money(M), owe(OWNER)) :- 
    obligation(consumer(C), creditor(OWNER), pay(money(M))).

written_notice()


a letter contains statements
a statement contains notice
notice contains statements
statements contains information
