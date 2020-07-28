% IF
% on date D initial communication was made between debt collector DC and consumer C in connection with the collection of any debt
% AND
% STATEMENT is not contained in initial communication
% AND
% D_send is the date before D+5 days
% AND
% STATEMENT is a list containing rules a1, a2, a3, a4
% THEN
% debt collector shall send the consumer a written notice with STATEMENT for the initial communication made on D 

shall(
    debt_collector(DC),
    send("written notice", D_send),
    contain("written notice", STATEMENT),
    consumer(C) 
    ) :-
        initial_communication(
            debt_collector(DC), 
            consumer(C), 
            contain("collection letter", connection_with_debt_collection(X)),
            D_1
        ),
        not(
            contain("collection letter", STATEMENT)
        ),
        add_day(D_1, 5, D_5),
        before(D_send, D_5),
        STATEMENT = [
            rule("validation notice statement 1", H1,B1),
            rule("validation notice statement 2", H2, B2) 
        ].



valid(debt(D)) :- 
    not(dispute(consumer(C), debt(DEBT), D1)), 
    before(D1, thirty_day_time_period).


obtain_and_mail_verification_of_debt(debt_collector(DC), consumer(C)) :- 
    notifies(
        consumer(C), 
        debt_collector(DC), 
        dispute(C, the_debt),
        D
    ),
    before(D, thirty_day_time_period).

rule("validation notice statement 1", 
    valid(debt(consumer(C))), 
    (
        not(dispute(consumer(C), debt(DEBT), D1)), 
        before(D1, thirty_day_time_period)
    )
    ).

rule("validation notice statement 2", 
    obtain_and_mail_verification_of_debt(debt_collector(DC), consumer(C)),
    (
        notifies(
            consumer(C), 
            debt_collector(DC), 
            dispute(C, the_debt),
            D
        ),
        before(D, thirty_day_time_period)
    )
    ).