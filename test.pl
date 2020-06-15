%fact that the rules exists
states('FDCPA', 
     obtain_and_mail(
            debt_collector(DC), 
            consumer(C), 
            verification(
                dispute(
                    consumer(C), 
                    debt_collector(DC), 
                    the_debt)
                ) 
            ),
     notifies(
         customer(_), 
         debt_collector(_), 
         dispute(
             customer(_), 
             debt,
             debt_collector(_)
             )
         )
     ).

% fact that the consitins where fullfilled
notifies(
         customer(oberther), 
         debt_collector(midland), 
         dispute(customer(oberther), 
                 debt,
                 debt_collector(midland)
                 )
         ).

% action when the conditions are fullfilled and the action is stated 
obtain_and_mail(
            debt_collector(DC), 
            consumer(C), 
            verification(
                dispute(
                    consumer(C), 
                    debt_collector(DC), 
                    the_debt)
                ) 
            ) :- 
    notifies(
         customer(_), 
         debt_collector(_), 
         dispute(customer(_), 
                 debt,
                 debt_collector(_)
                 )
         ), 
    states('FDCPA', 
     obtain_and_mail(
            debt_collector(DC), 
            consumer(C), 
            verification(
                dispute(
                    consumer(C), 
                    debt_collector(DC), 
                    the_debt)
                ) 
            ),
     notifies(
         customer(_), 
         debt_collector(_), 
         dispute(customer(_), 
                 debt,
                 debt_collector(_)
                 )
         )
     ).

%rights
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

right(
    consumer(C),
    dispute(
        consumer(C), 
        the_debt),
        debt_collector(C)
    ),    
    still_in_effect(thirty_day_time_period),
    )) :-
        states('FDCPA 1692g', obtain_and_mail(
            debt_collector(DC), 
            consumer(C), 
            verification(dispute(consumer(C), debt_collector(DC), the_debt)) 
            )). 



% X has Right to dispute the debt to Y
% if 
% X have a claim on Y to dispute the debt
% Y have a duty to let X dispute the debt
 right(X, dispute_debt(Y)) :- 
    claim(X, Y, dispute_debt(Y)),
    duty(Y, X, dispute_debt(Y)).

% duty(Y,X, dispute_debt(Y)) :- 
% claim that X can 
% I have a claim on debt collector 
% to get a verification of the debt
% when I dispute the debt
% then debt collector has a duty
% to get me a verification of the debt 
% when I dispute the debt