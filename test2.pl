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