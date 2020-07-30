:- module(fdcpa1692g, [rule/4, rules/1]).

rule("fdcpa 1692g", 
    "a1",
    assume_valid(debt_collector, debt, consumer, t_w), 
    [
        not_do(
            consumer,
            dispute_debt,
            debt_collector,
            t_w
        ), 
        before(t_w, t_thirty)
    ]
).

rule("fdcpa 1692g", 
    "a2", 
    do(debt_collector, obtain_and_mail_verification_of_debt, consumer, t_s),
    [
        do(
            consumer,
            notifies_dispute_debt,
            debt_collector,
            t_y
        ),
        before(t_y, t_thirty),
        after(t_s, t_y)
    ]
).

rule("fdcpa 1692g", 
    "b1",
    do(debt_collector, cease_collection_debt, consumer, t_d),
    [
        do(
            consumer, 
            notifies_dispute_debt,
            debt_collector,
            t_e
        ),
        not_do(debt_collector, obtain_and_mail_verification_of_debt, consumer, t_e),
        before(t_e, t_thirty),
        after(t_d, t_e)
    ]
).

rule("fdcpa 1692g", 
    "b2", 
    violates(
        debt_collector,
        "15 U.S.C sec. 1692g(b)"
    ),
    [
        do(debt_collector, consumer, communication, t_d),
        helpers:disclosure_of_rtd(DISCLOSURE, debt_collector, consumer),
        communication_medium(_, INFORMATION),
        overshadow(
            INFORMATION,
            DISCLOSURE
        ),
        before(
            t_d,
            t_thirty
        )
    ]
).


% The term “communication” means 
% the conveying of information regarding 
% a debt directly or indirectly to any person through any medium.

% TODO: test communication and refactor accordingly
do(debt_collector, consumer, communication, t_d) :-
    do(debt_collector, send_collection_letter, consumer, t_e),
    do(debt_collector, received_collection_letter, consumer, t_d),
    before(t_e, t_d).



before(t_e, t_d).
rules(["a1", "a2", "b1", "b2"]).