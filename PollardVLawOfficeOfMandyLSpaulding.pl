% The First Circuit recently held that,
% "for FDCPA purposes, a collection letter is to be viewed from the perspective of the hypothetical unsophisticated consumer" Pollard, 2014 WL 4402213 at *4.
% Thus, as the First Circuit explained, a communication overshadow or contradicts the validation notice if it "would confuse the [hypothetical] unsophisticated consumer". id.

% From Pollard v. Law Office of Mandy L. Spaulding 766 F.3d 98 (1st Circuite 2014)




% Whether the controversy centers on overshadowing or inconsistency, 
% the inquiry reduces to whether a particular collection letter would confuse the unsophisticated consumer. See Bartlett, 128 F.3d at 500–01. 

overshadow(communication(DEBT_COLLECTOR, CONSUMER, MEDIUM, MESSAGE), disclosure(consumer_right_to_dispute)) :-
    communication(DEBT_COLLECTOR, CONSUMER,MEDIUM,MESSAGE),
    confuse_hypothetical_unsophisticated_consumer(
        MESSAGE,
        disclosure(consumer_right_to_dispute)
    ).


% This inquiry is to be conducted with a recognition that confusion can occur in a myriad of ways, such as when a letter visually buries the required validation notice,
% contains logical inconsistencies, fails to explain an apparent inconsistency, 
% or presents some combination of these (or similar) vices. See id. 


% In the last analysis, a collection letter is confusing if, after reading it, 
% the unsophisticated consumer would be left unsure of her right to dispute the debt and request information concerning the original creditor. 

confuse_hypothetical_unsophisticated_consumer(communication(DEBT_COLLECTOR, CONSUMER, MEDIUM, MESSAGE), disclosure(consumer_right_to_dispute)) :- 
    makes_hypothetical_unsophisticated_consumer_unsure(
        communication(DEBT_COLLECTOR, CONSUMER, MEDIUM, MESSAGE),
        disclosure(consumer_right_to_dispute)
    ).

confuse_hypothetical_unsophisticated_consumer(MEDIUM, request_original_creditor_information) :- 
    unsure_hypothetical_unsophisticated_consumer(MEDIUM, request_original_creditor_information).

% See Russell v. Equifax A.R.S., 74 F.3d 30, 35 (2d Cir.1996). 
% The emphasis, then, is on practical effect. 
% See Graziano v. Harrison, 950 F.2d 107, 111 (3d Cir.1991) (explaining that “statutory notice must not only explicate a debtor's rights; it must do so effectively”).    
