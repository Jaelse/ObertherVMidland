% Disclosure: the action of making new or secret information known: 
% the action of making know 

% A is a disclosure of consumer right 
% if FDCPA says A is a right that debt_collector should 
% tell the consumer.

% TODO: Refactor to make disclosure more practical
% TODO: made known part of the meaning disclosure should be done.
disclosure(INFORMATION, right(R), debt_collector(DC), consumer(C)) :-
    sent(debt_collector(DC), INFORMATION, consumer(C)),
    same(
        INFORMATION, 
        right(R)
    ).


% TODO: test same and refactor accordingly
same(
    A, 
    right(
        R
    )
) :-
A = R.

% TODO: refactor this Rules premises 
right(
    consumer(C),
    dispute(consumer(C), the_debt,debt_collector(DC))    
) :-
    claim(
        consumer(C),
        debt_collector(DC),
        dispute(
            consumer(C), 
            the_debt, 
            debt_collector(DC)
        )
    ),
    duty(
        debt_collector(DC),
        not_stopped(
            dispute(
                consumer(C), 
                the_debt, 
                debt_collector(DC)
            )
        )
    ). 

claim(
    consumer(C),
    debt_collector(DC),
    dispute(
        consumer(C), 
        the_debt, 
        debt_collector(DC)
    )
).

not_stopped(
    dispute(
        consumer(C), 
        the_debt, 
        debt_collector(DC)
    )
).

% for example:
% IF
% FDCPA says to X that
% it's X duty to give INFO to Y in the PERIOD
% if Y ask INFO to X in the PERIOD

% Then
% It's Y right to ask for INFO to X in the PERIOD

% for example:
% IF
% states('FDCPA', mail(X, INFO, Y, notify(Y, INFO, X, PERIOD)))
% Then
% right(Y, ask(Y,INFOR,X, PERIOD).
% 
% IF
% ask(Y, INFO, X, PERIOD)
% THEN
% give(X, INFO, Y, request(Y, INFO, X, PERIOD))

% ------------------------------------------------------------------

% IF
% according to the information in collection letter, right to dispute has benfit B
% and
% according to the information in FDCP Act, right to dispute has benefit A
% and 
% benfit B is less than benfit A
% THEN
% disparage

disparage( 
    INFORMATION, 
    benefit(
        right(
            consumer(C),
            dispute(consumer(C), the_debt ,debt_collector(DC))    
        ),
        cease_collection_of_debt(_, debt_collector(DC), consumer(C))
    )
) :- 
    represents(
        INFORMATION, 
        benefit(
            payment(consumer(C), debt_collector(DC)),
            consumer(C),
            cease_collection_of_debt(_, debt_collector(DC), consumer(C))
        )
    ),
    not(
        represents(
            INFORMATION, 
            benefit(
                right(
                    consumer(C),
                    dispute(consumer(C), the_debt ,debt_collector(DC))    
                ),
                consumer(C),
                cease_collection_of_debt(_, debt_collector(DC), consumer(C))
            )
        )
    ),
    practical_effect(
        right(
            consumer(C),
            dispute(consumer(C), the_debt ,debt_collector(DC))    
        ),
        cease_collection_of_debt(_, debt_collector(DC), consumer(C))
    ).
% --------------------------------------------- REPRESENTS ------------------------------------------------
represents(
    INFORMATION, 
    benefit(
        payment(consumer(C), debt_collector(DC)),
        cease_collection_of_debt(_, debt_collector(DC), consumer(C))
    )
) :- 
    INFORMATION,
    member(
        stops(
            payment(consumer(C), debt_collector(DC)), 
            process(
                considering(
                    debt_collector(DC), 
                    forwarding(
                        debt_collector(DC), 
                        credit_account(_), 
                        attorney(_)
                    )
                )
            )
        ),
        INFORMATION
    ),
    also_means(
        stops(
            payment(consumer(C), debt_collector(DC)), 
            process(
                considering(
                    debt_collector(C), 
                    forwarding(
                        debt_collector(DC), 
                        credit_account(_), 
                        attorney(_)
                    )
                )
            )
        ),
        cease_collection_of_debt(
            payment(consumer(C), debt_collector(DC)),
            debt_collector(DC),
            consumer(C)
        )
    ),
    benefit(
        payment(consumer(C), debt_collector(DC)),
        consumer(C),
        cease_collection_of_debt(
            _,
            debt_collector(DC), 
            consumer(C)
        )
    ).

% --------------------------------------------- ALSO MEANS ------------------------------------------------
also_means(
    stops(
        payment(consumer(C), debt_collector(DC)), 
        process(
            considering(
                debt_collector(DC), 
                forwarding(
                    debt_collector(DC), 
                    credit_account(C), 
                    attorney(_)
                )
            )
        )
    ), 
    cease_collection_of_debt(
        payment(consumer(C), debt_collector(DC)),
        debt_collector(DC), 
        consumer(C)
    )
).
% --------------------------------------------- BENFIT ------------------------------------------------
benefit(
    right(
        consumer(C),
        dispute(consumer(C), the_debt ,debt_collector(DC))    
    ),
    consumer(C),
    BENEFIT
) :- 
    practical_effect(
        right(
        consumer(C),
        dispute(consumer(C), the_debt ,debt_collector(DC))    
    ),
    EFEECT
    ),
    advantage(EFFECT, consumer(C)),
    BENEFIT = EFFECT.


benefit(
    payment(consumer(C), debt_collector(DC)),
    consumer(C),
    BENEFIT
) :- 
    practical_effect(
        payment(consumer(C), debt_collector(DC)),
        EFEECT
    ),
    advantage(EFFECT, consumer(C)),
    BENEFIT = EFFECT.

% --------------------------------------------- PRACTICAL EFFECT ------------------------------------------------
practical_effect(
    payment(consumer(C), debt_collector(DC)),
    EFEECT
) :-
    causes(
        according(_),
        dispute(consumer(C), the_debt, debt_collector(DC)), 
        EFFECT
    ). 

practical_effect(
    right(
    consumer(C),
    dispute(consumer(C), the_debt ,debt_collector(DC))    
    ),
    EFEECT
) :- 
    causes(
        according("FDCPA"),
        dispute(consumer(C), the_debt, debt_collector(DC)), 
        EFFECT
    ).

% --------------------------------------------- causes ------------------------------------------------

causes(
    according("FDCPA"),
    dispute(consumer(C), the_debt, debt_collector(DC)),
    cease_collection_of_debt(
        _,
        debt_collector(DC), 
        consumer(C)
    )
).

causes(
    according(statement('collection letter', _)),
    payment(consumer(C), debt_collector(DC)),
    cease_collection_of_debt(
        _,
        debt_collector(DC), 
        consumer(C)
    )
).

% --------------------------------------------- advantage ------------------------------------------------

advantage(
    cease_collection_of_debt(
        _,
        debt_collector(_), 
        consumer(C)
    ), 
    consumer(C)
).

% --------------------------------------------- contains ------------------------------------------------

contains(
    INFORMATION, 
    ELEMENT
) :-
    member(
        ELEMENT,
        INFORMATION
    ).
        
% --------------------------------------------- fdcpa notice ------------------------------------------------

fdcpa_notice(WRITTEN_NOTICE, [H|T]) :-
    statement('written notice', WRITTEN_NOTICE) = H.

fdcpa_notice(WRITTEN_NOTICE, [H|T]) :-
    fdcpa_notice(WRITTEN_NOTICE, T).

