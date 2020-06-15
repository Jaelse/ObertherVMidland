obtain_and_mail_verification(debt_collector('Midland'), consumer('Oberther'), debt('the debt')) :- false.

notifies(
        consumer('Oberther'), 
        debt_collector('Midland'), 
        dispute(consumer('Oberther'),debt('the debt')), 
        date('some day')
        ).


shall(debt_collector(DC), cease_collection(debt(D), consumer(C)), according('FDCPA 1692(b)')) :- 
    notifies(
        consumer(C), 
        debt_collector(DC), 
        dispute(consumer(C),debt(D)), 
        date(_)
        ),
    not(obtain_and_mail_verification(debt_collector(DC), consumer(C), debt(D))).

duty(X, Y, cease_collection(debt(D), Y)) :- 
    shall(X, 
          cease_collection(
              debt(D), 
              Y
              ),
          according(_)
          ).

right(Y,X, cease_collection(debt(D), Y)) :- 
    duty(X, Y, cease_collection(debt(D), Y)).

