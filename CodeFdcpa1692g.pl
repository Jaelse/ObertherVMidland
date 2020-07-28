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
% debt collector will assume the debt is valid 



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






