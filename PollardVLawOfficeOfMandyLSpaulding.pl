% TODO: connect these to the FDCPA RULES and the Collection letter

% The First Circuit recently held that,
% "for FDCPA purposes, a collection letter is to be viewed from the perspective of the hypothetical unsophisticated consumer" Pollard, 2014 WL 4402213 at *4.
% Thus, as the First Circuit explained, a communication overshadow or contradicts the validation notice if it "would confuse the [hypothetical] unsophisticated consumer". id.

% From Pollard v. Law Office of Mandy L. Spaulding 766 F.3d 98 (1st Circuite 2014)




% Whether the controversy centers on overshadowing or inconsistency, 
% the inquiry reduces to whether a particular collection letter would confuse the unsophisticated consumer. See Bartlett, 128 F.3d at 500–01. 

overshadow(
    communication(debt_collector(DC), consumer(C), collection_letter(INFORMATION)), 
    disclosure(INFORMATION, right(R), debt_collector(DC), consumer(C))
    ) :-
    confuse_hypothetical_unsophisticated_consumer(
        collection_letter(INFORMATION),
        disclosure(INFORMATION, right(R), debt_collector(DC), consumer(C))
    ).


% This inquiry is to be conducted with a recognition that confusion can occur in a myriad of ways, such as when a letter visually buries the required validation notice,
% contains logical inconsistencies, fails to explain an apparent inconsistency, 
% or presents some combination of these (or similar) vices. See id. 


% In the last analysis, a collection letter is confusing if, after reading it, 
% the unsophisticated consumer would be left unsure of her right to dispute the debt and request information concerning the original creditor. 

confuse_hypothetical_unsophisticated_consumer(
    collection_letter(INFORMATION),
    disclosure(INFORMATION, right(R), debt_collector(DC), consumer(C))
    ) :- 
    makes_hypothetical_unsophisticated_consumer_unsure(
        collection_letter(INFORMATION),
        right(R)
    ).

% See Russell v. Equifax A.R.S., 74 F.3d 30, 35 (2d Cir.1996). 
% The emphasis, then, is on practical effect. 
% See Graziano v. Harrison, 950 F.2d 107, 111 (3d Cir.1991) (explaining that “statutory notice must not only explicate a debtor's rights; it must do so effectively”).    

makes_hypothetical_unsophisticated_consumer_unsure(
    collection_letter(INFORMATION),
    right(R)
) :- 
    makes_hypothetical_unsophisticated_consumer_unsure( 
        collection_letter(INFORMATION), 
        practical_effect(
            right(R)
        )
    ).


% to give the required notice of a right to dispute the debt
% while simultaneously and inaccurately disparaging the benefit of the right 
% is to cause the consumer to think that the right to dispute has less benefit than is actually the case.
% Disparage means regard or represent as being of little worth


% IF
% consumer find benefit of right to dispute less than what the FDCPA tells
% THEN
% makes_hypothetical_unsophisticated_consumer_unsure
% 

% IF
% disparage
% THEN
% consumer finds the benefit of right to dispute less




makes_hypothetical_unsophisticated_consumer_unsure( 
    collection_letter(INFORMATION), 
    practical_effect(
        right(R)
    )
) :- 
    makes_hypothetical_unsophisticated_consumer_think(
        collection_letter(INFORMATION), 
        less_than_fdcpa(
            benefit(
                practical_effect(
                    right(
                        consumer(C),
                        dispute(consumer(C), the_debt ,debt_collector(C))    
                    )
                )
            )
        )
    ).

makes_hypothetical_unsophisticated_consumer_think(
    statement(
        'collection letter', 
        INFORMATION
    ), 
    less_than_fdcpa(
        benefit(
            right(
                consumer(C),
                dispute(consumer(C), the_debt ,debt_collector(DC))    
            ),
        consumer(C),
        BENEFIT
        )
    )
) :- 
    fdcpa_notice(_, INFORMATION),
    disparage( 
        INFORMATION, 
        benefit(
            right(
                consumer(C),
                dispute(consumer(C), the_debt ,debt_collector(DC))    
            ),
            cease_collection_of_debt(_, debt_collector(DC), consumer(C))
        )
    ).