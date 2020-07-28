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

shall(debt_collector(DC), cease_collection(debt(D), consumer(C)), according('FDCPA 1692(b)')) :- 
    notifies(
        consumer(C), 
        debt_collector(DC), 
        dispute(consumer(C),debt(C)), 
        date(D)
        ),
    not(obtain_and_mail_verification(debt_collector(DC), consumer(C), debt(D))).

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


violates(
    debt_collector(DC),
    "15 U.S.C sec. 1692g(b)",
    communication(debt_collector(DC), consumer(C), collection_letter(INFORMATION), Date)
    ) :-
    communication(debt_collector(DC), consumer(C), collection_letter(INFORMATION), Date),
    disclosure_of_rtd(DISCLOSURE, debt_collector(DC), consumer(C)),
    overshadow(
        INFORMATION,
        DISCLOSURE
    ),
    before(
        Date,
        expiry(thirty_day_time_period)
    ).

%  TODO: finish this rule later
% violates(debt_collector(DC), "15 U.S.C sec. 1692g(b)") :-
%     overshadow(
%         collection_activity(DEBT_COLLECTOR),
%         disclosure(_, _, debt_collector(DC), consumer(C))
%     ),
%     during(communication(DEBT_COLLECTOR, CONSUMER, MEDIUM,CONTENT), before(expiry(thirty_day_time_period))).
