% TODO:
% replace event('collection activity') by event('proceed to pay') when you
% figure how to check if an event is a collection activity.

% In pertinent part, the front page of the Letter set forth

% Call (800) 265-8825
%NOTICE OF NEW OWNERSHIP AND PRE-LEGAL REBVIEW%
% Dear Mary
% On 10-21-2013, your Capital One, N.A. account was sold to Midland Funding LLC and Midland Credit Management, Inc. (MCM), 
% a debt collection company
% Midland Funding LLC and Midland Credit Management, Inc. (MCM),
% will be collecting on,
% and servicing your account.
% Midland Credit Management, Inc. is considering forwarding this account to
% an attorney in your state for possible litigation.
% However, such forwarding will not occur until after the expiration of the time period described on the back of the letter. 
% TODO: Upon receipt of this notice, please call to discuss your options.
% TODO: If we don’t hear from you or receive payment by 12∙15∙2013, we may proceed with forwarding this account to an attorney.
% What do you need to do to stop this process from continuing?
% 1) Mail in $500.00 and call to setup your remaining payments.
% 2) Call us to see how to qualify for discounts and payment plans.

notice('collection letter', 'new ownership').
notice('collection letter', 'pre-legal review').

sold(
    credit_account("Capital One", "Oberther"),
    debt_collector("Midland"), 
    date(2013, 10, 21)
).

will_be_collecting(
    debt_collector("Midland"),
    credit_account("Oberther")
).


service(
    debt_collector("Midland"), 
    credit_account("Oberther")
).

considering(
    debt_collector("Midland"), 
    forwarding(
        debt_collector("Midland"), 
        credit_account("Oberther"), 
        attorney
    ),
    possible_litigation
).

not_forward(
    debt_collector("Midland"), 
    credit_account("Oberther"), 
    attorney,
    D
) :-
    within(D, thirty_day_time_period).


stop_process(
    debt_collector("Midland"), 
    forwarding(
        debt_collector("Midland"), 
        credit_account("Oberther"), 
        attorney
    ),
    D
) :-
    not_forward(
        debt_collector("Midland"), 
        credit_account("Oberther"), 
        attorney,
        D
    ), 
    pay(consumer("Oberther"), debt_collector("Midland"), amount(500), D),
    call(consumer("Oberther"), debt_collector("Midland"), D). 

% LET US HELP YOU! If the account goes to an attorney, 
% our flexible options may no longer be available to you. 
% There still is an opportunity to make arrangements with us. 
% We encourage you to call us: (800) 265‐8825.
% Sincerely,
% Hector Torres. Division Manager
% (800) 265‐8825
% This account may still be reported on your credit report as unpaid.


% BENEFITS OF PAYING
%  - This may be your last chance to work with us before the account goes to an attorney
%  - Get rid of this debt and get on with your life
%  Once your account is paid.
% - All collection calls and letters on this account will stop!
% After receiving your final payment, we will consider the account PAID IN FULL and the three major credit reporting agencies will be updated accordingly.


% CALL US TODAY! 
% (800) 265-8825

% On its reverse side, the Letter set forth the notifications required by 15 U.S.C. §1692g(a):

% Unless you notify MCM within thirty (30) days after receiving this notice 
% that you dispute the validity of the debt or any portion thereof, 
% MCM will assume this debt to be valid.

valid(debt) :- 
    not(dispute(consumer("Oberther"), debt("Oberther"), D1)), 
    before(D1, thirty_day_time_period).

% If you notify MCM, in writing, 
% within thirty (30) days after receiving this notice that the debt, 
% or any portion thereof, is disputed, 
% MCM will obtain verification of the debt or a copy of a judgment (if there is a judgment) 
% and MCM will mail you a copy of such verification or Judgment.

obtain_and_mail_verification_of_debt(debt_collector("Midland"), consumer("Oberther")) :- 
    notifies(
        consumer("Oberther"), 
        debt_collector("Midland"), 
        dispute("Oberther", debt("Oberther")),
        D
    ),
    before(D, thirty_day_time_period).