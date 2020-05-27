% The term “communication” means 
% the conveying of information regarding 
% a debt directly or indirectly to any person through any medium.

% TODO: test communication and refactor accordingly
communication( debt_collector(DC), consumer(C), collection_letter(INFORMATION)) :-
    sent(DEBT_COLLECTOR, collection_letter(INFORMATION)),
    received(CONSUMER, collection_letter(INFORMATION)),
    contains(
        collect(
            debt_collector(DC),
            credit_account(C)
        ),
        INFORMATION
    ).

contains(
    statement('collection letter', STATEMENTS),
    collect(
        debt_collector(DC),
        credit_account(C)
    )
) :-
    member(
        collect(
            debt_collector(DC),
            credit_account(C)
        ), STATEMENTS).
    
     

