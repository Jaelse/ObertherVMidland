% (a) Notice of debt; 
% contents 
% Within five days after the initial communication
% with a consumer in connection with the collection of any debt, 
% a debt collector shall, 
% unless the following information is contained in the initial communication 
% or the consumer has paid the debt, send the consumer a written notice containing—

% SIMPLIFIED RULE 1
% IF
% initial communication is made from the debt collector to the consumer in conection with the collection of any debt on date D
% and
% STATEMENT was not contained in initial communication
% and
% D_five is the date on D+5 days
% and 
% FDCPA 1692g states written notice X contains STATEMENT
% THEN
% FDCAP states that debt collector should send the consumer a written notice with STATEMENT for the initial communication made on D 

% TODO: do one dispute clause
states('FDCPA 1692g', 'a', R).

% TODO: finish this rule    
R = obtain_and_mail_verification(
    debt_collector(DC), 
    consumer(C), 
    dispute(consumer(C), the_debt) 
    ).

obtain_and_mail(
    debt_collector(DC), 
    consumer(C), 
    verification(dispute(consumer(C), debt_collector(DC), the_debt)) 
    ) :-
    notifies(
        consumer(C), 
        debt_collector(DC), 
        dispute(consumer(C), 
                the_debt
        ), 
        still_in_effect(thirty_day_time_period)).


% IF
% FDCPA 1692g states that debt collector will assume the debt is valid
% 
% THEN 

% (1) the amount of the debt;
% (2) the name of the creditor to whom the debt is owed;



% (3) a statement that unless the consumer, 
% within thirty days after receipt of the notice, 
% disputes the validity of the debt, 
% or any portion thereof, 
% the debt will be assumed to be valid by the debt collector;

% SIMPLIFIED RULE
% IF
% it's thirty day time period
% AND
% debt not disputed 
% THEN
% FDCPA states that debt collector will assume the debt is valid 



% (4) a statement that 
% if the consumer notifies the debt collector in writing 
% within the thirty-day period that the debt, 
% or any portion thereof, is disputed, 
% the debt collector will obtain verification of the debt 
% or a copy of a judgment against the consumer 
% and a copy of such verification or judgment will be mailed 
% to the consumer by the debt collector; 




% and
% (5) a statement that, upon the consumer’s written request within the thirty-day period, the debt collector will provide the consumer with the name and address of the original creditor, if different from the current creditor.






% ORIGINAL TEXT from 15 U.S. Code § 1692g. Validation of debts
% (b) Disputed debts
% If the consumer notifies the debt collector in writing within the thirty-day period described in subsection (a) that the debt, 
% or any portion thereof, is disputed, or that the consumer requests the name and address of the original creditor, 
% the debt collector shall cease collection of the debt, 
% or any disputed portion thereof, 
% until the debt collector obtains verification of the debt or a copy of a judgment, 
% or the name and address of the original creditor, and a copy of such verification or judgment, 
% or name and address of the original creditor, is mailed to the consumer by the debt collector. 
% Collection activities and communications that do not otherwise violate this subchapter 
% may continue during the 30-day period referred to in subsection (a) 
% unless the consumer has notified the debt collector in writing that the debt, 
% or any portion of the debt, is disputed or that the consumer requests the name and address of the original creditor. 
% Any collection activities and communication during the 30-day period may not overshadow 
% or be inconsistent with the disclosure of the consumer’s right to dispute the debt or request the name and address of the original creditor.
% ----------------------------------------------------------------------------------------------------------------------------------------------------------

% 1-(2-4)-6-(7)-9-(10)-13-(14)-17.

% SIMPLIFIED RULE 1
% If the consumer notifies the debt collector in writing within the thirty-day period described in subsection (a) that the debt,
% is disputed, the debt collector shall cease collection of the debt,   
% until the debt collector obtains verification of the debt, 
% and a copy of such verification, 
% is mailed to the consumer by the debt collector. 

% NOTE: since the debt collection cannot mail the verficaiton of the debt without obtaining it. We will name the predicate obtain_and_mail_verfication.

% IF
% consumer noties the debt collector in writing
% within the thirty-day period
% that the debt is disputed,
% and debt collector has not obtained and mailed the verification to the consumer.      
% THEN
% Debt collector shall cease collection of debt from the consumer.

cease_collection_of_debt(DEBT_COLLECTOR, CONSUMER) :- 
    notifies(
        CONSUMER, 
        DEBT_COLLECTOR, 
        dispute(CONSUMER, the_debt), 
        still_in_effect(thirty_day_time_period)
        ),
    not(obtain_and_mail_verification_of_debt(DEBT_COLLECTOR, CONSUMER)).

% SIMPLIFIED RULE 2
% If the consumer notifies the debt collector in writing within the thirty-day period described in subsection (a) that any portion thereof,
% is disputed, the debt collector shall cease collection of the debt,   
% until the debt collector obtains verification of the debt, 
% and a copy of such verification, 
% is mailed to the consumer by the debt collector. 

% NOTE: since the debt collection cannot mail the verficaiton of the debt without obtaining it. We will name the predicate obtain_and_mail_verfication.
cease_collection_of_debt(DEBT_COLLECTOR, CONSUMER) :- 
    notifies(CONSUMER, DEBT_COLLECTOR, dispute(CONSUMER, part_of_the_debt(_)),still_in_effect(thirty_day_time_period)),
    not(obtain_and_mail_verification_of_debt(DEBT_COLLECTOR, CONSUMER)).

% SIMPLIFIED RULE 3
% If the consumer notifies the debt collector in writing within the thirty-day period described in subsection (a) that the debt,
% is disputed, the debt collector shall cease collection of the debt,   
% until the debt collector obtains a copy of a judgment, 
% and a copy of such judgment
% is mailed to the consumer by the debt collector. 

% NOTE: since the debt collection cannot mail the copy of judgement without obtaining it. We will name the predicate obtain_and_mail_judgement.

cease_collection_of_debt(DEBT_COLLECTOR, CONSUMER) :- 
    notifies(CONSUMER, DEBT_COLLECTOR, dispute(CONSUMER, the_debt), still_in_effect(thirty_day_time_period)),
    not(obtain_and_mail_judgement_of_debt(DEBT_COLLECTOR, CONSUMER)).

% SIMPLIFIED RULE 4
% If the consumer notifies the debt collector in writing within the thirty-day period described in subsection (a) that any portion thereof,
% is disputed, the debt collector shall cease collection of the debt,   
% until the debt collector obtains a copy of a judgment, 
% and a copy of such judgment,
% is mailed to the consumer by the debt collector. 

% NOTE: since the debt collection cannot mail the copy of judgement without obtaining it. We will name the predicate obtain_and_mail_judgement.

cease_collection_of_debt(DEBT_COLLECTOR, CONSUMER) :- 
    notifies(CONSUMER, DEBT_COLLECTOR, dispute(CONSUMER, part_of_the_debt(_)), still_in_effect(thirty_day_time_period)),
    not(obtain_and_mail_judgement_of_debt(DEBT_COLLECTOR, CONSUMER)).
% --------------------------------------------------------------------------------------------------------------------------------------------------

% SIMPLIFIED RULE 5
% If the consumer notifies the debt collector in writing within the thirty-day period described in subsection (a) that the debt,
% is disputed, the debt collector shall cease collection of the debt,   
% until the debt collector obtains the name and address of the original creditor,
% and name and address of the original creditor,
% is mailed to the consumer by the debt collector. 

% NOTE: since the debt collection cannot mail the name and adress of the original creditor without obtaining it. We will name the predicate obtain_and_mail_original_creditor_info.

cease_collection_of_debt(DEBT_COLLECTOR, CONSUMER) :- 
    notifies(
        CONSUMER,
        DEBT_COLLECTOR, 
        dispute(
            CONSUMER, 
            validity_of_debt
            )
        ),
    not(obtain_and_mail_original_creditor_info(DEBT_COLLECTOR, CONSUMER)),
    thirty_day_time_period.

% SIMPLIFIED RULE 6
% If the consumer notifies the debt collector in writing within the thirty-day period described in subsection (a) that any portion thereof,
% is disputed, the debt collector shall cease collection of the debt,   
% until the debt collector obtains the name and address of the original creditor,
% and name and address of the original creditor,
% is mailed to the consumer by the debt collector. 

% NOTE: since the debt collection cannot mail the name and adress of the original creditor without obtaining it. We will name the predicate obtain_and_mail_original_creditor_info.
cease_collection_of_debt(DEBT_COLLECTOR, CONSUMER) :- 
    notifies(CONSUMER, DEBT_COLLECTOR, dispute(CONSUMER, part_of_the_debt(_))),
    not(obtain_and_mail_original_creditor_info(DEBT_COLLECTOR, CONSUMER)),
    thirty_day_time_period.
% --------------------------------------------------------------------------------------------------------------
% ORIGINAL
% Collection activities and communications that do not otherwise violate this subchapter 
% may continue during the 30-day period referred to in subsection (a) 
% unless the consumer has notified the debt collector in writing that the debt, 
% or any portion of the debt, is disputed or that the consumer requests the name and address of the original creditor.

% Simplified Rule 7
% contintue collection activities that do not otherwise violates this subshapter 
% during the 30-day period referred to in subsection (a)
% unless the consumer has notified the debt collector in writing that the debt,
% is disputed.

% Simplified Rule 8
% contintue collection activities that do not otherwise violates this subshapter 
% during the 30-day period referred to in subsection (a)
% unless the consumer has notified the debt collector in writing that
% any portion of the debt, is disputed.

% Simplified Rule 9
% contintue collection activities that do not otherwise violates this subshapter 
% during the 30-day period referred to in subsection (a)
% unless the consumer has notified the debt collector in writing
% that the consumer requests the name and address of the original creditor.

% Simplified Rule 10
% contintue communications that do not otherwise violates this subshapter 
% during the 30-day period referred to in subsection (a)
% unless the consumer has notified the debt collector in writing that the debt,
% or any portion of the debt, is disputed or that the consumer requiests the name and address of the original creditor


% --------------------------------------------------------------------------------------------------------------
% ORIGINAL
% Any collection activities and communication during the 30-day period may not overshadow 
% or be inconsistent with the disclosure of the consumer’s right to dispute the debt or request the name and address of the original creditor.


% 1. [Any collection activities]
% 2. [and communication]
% 3. [during the 30-day period may not] 
% 4. [overshadow] 
% 6. [the disclosure of the consumer’s right to dispute the debt]

% If
% Any collection activities and communication overhshadow the disclosure of the consumer’s right to dispute the debt during the 30-day period
% THEN
% debt collector violates 15 U.S.C sec. 1692g(b)


violates(debt_collector(DC), "15 U.S.C sec. 1692g(b)", communication(debt_collector(DC), consumer(C), MEDIUM, CONTENT)) :-
    overshadow(
        communication( debt_collector(DC), consumer(C), MEDIUM, CONTENT),
        disclosure(
            INFORMATION, 
            debt_collector(DC), 
            consumer(C), 
            right(R), debt_collector(DC), consumer(C)
        )
    ),
    during(
        communication(debt_collector(DC), consumer(C), MEDIUM, CONTENT), 
        before(
            expiry(thirty_day_time_period)
        )
    ).

%  TODO: finish this rule later
% violates(debt_collector(DC), "15 U.S.C sec. 1692g(b)") :-
%     overshadow(
%         collection_activity(DEBT_COLLECTOR),
%         disclosure(_, _, debt_collector(DC), consumer(C))
%     ),
%     during(communication(DEBT_COLLECTOR, CONSUMER, MEDIUM,CONTENT), before(expiry(thirty_day_time_period))).
