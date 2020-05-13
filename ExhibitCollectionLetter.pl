% In pertinent part, the front page of the Letter set forth

% Call (800) 265-8825
call_('(800) 265-8825').

%NOTICE OF NEW OWNERSHIP AND PRE-LEGAL REBVIEW%
notice('new ownership').
notice('pre-legal review').

% Dear Mary
recipient('Oberther').

% On 10-21-2013, your Capital One, N.A. account was sold to Midland Funding LLC and Midland Credit Management, Inc. (MCM), 
% a debt collection company
sold(creditor("Capital One"), credit_account("Oberther"), debt_collector("Midland"), date('10-21-2013')).

% Midland Funding LLC and Midland Credit Management, Inc. (MCM),
% will be collecting on,
% and servicing your account.
collect(debt_collector("Midland"), credit_account("Oberther")).
service(debt_collector("Midland"), credit_account("Oberther")).

% Midland Credit Management, Inc. is considering forwarding this account to
% an attorney in your state for possible litigation.
% However, such forwarding will not occur until after the expiration of the time period described on the back of the letter. 

not(forward(consider("Midland"), credit_account("Oberther"), attorney(_))) :-
    not(expiry(thirty_day_time_period)).

% Upon receipt of this notice, please call to discuss your options.
encourages("Midland", "Oberther", to_call, receipt_of_the_letter).


% What do you need to do to stop this process from continuing?
% 1) Mail in $500.00 and call to setup your remaining payments.
% 2) Call us to see how to qualify for discounts and payment plans.
options(stop(forwarding_process), "Oberther", ["Mail in $500.00 and call to setup your remaining payments.", "Call us to see how to qualify for discounts and payment plans."]).

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

% notify("Oberther", "Midland", dispute("Oberther", part_of_the_debt("a")))).
not_assume_debt_valid :-
    notifies("Oberther", "Midland", dispute("Oberther", validity_of_debt)),
    thirty_day_time_period.

not_assume_debt_valid :-
    notifies("Oberther",
           "Midland",
           dispute("Oberther", part_of_the_debt(_))),
    thirty_day_time_period.

% If you notify MCM, in writing, 
% within thirty (30) days after receiving this notice that the debt, 
% or any portion thereof, is disputed, 
% MCM will obtain verification of the debt or a copy of a judgment (if there is a judgment) 
% and MCM will mail you a copy of such verification or Judgment.
obtain("Midland", verification_of_the_debt) :-
    notifies("Oberther",
           "Midland",
           dispute("Oberther", part_of_the_debt(_))),
    thirty_day_time_period.


obtain("Midland", judgment_of_the_debt) :-
    notifies("Oberther",
           "Midland",
           dispute("Oberther", part_of_the_debt(_))),
    thirty_day_time_period.

mail("Midland", verification_of_the_debt) :-
    notifies("Oberther",
           "Midland",
           dispute("Oberther", part_of_the_debt(_))),
    thirty_day_time_period.

mail("Midland", judgment_of_the_debt) :-
    notifies("Oberther",
           "Midland",
           dispute("Oberther", part_of_the_debt(_))),
    thirty_day_time_period.

% If you request, in writing, within thirty (30) days after receiving this notice,
%  MCM will provide you with the name and address of the original creditor.
provide("Midland", name_of_original_creditor, address_of_original_creditor) :-
    notifies("Oberther",
           "Midland",
           dispute("Oberther", part_of_the_debt(_))),
    thirty_day_time_period.

% On the bottom of the reverse side, the Letter concluded:
% IF YOU LIVE IN MASSACHUSETTS, THIS APPLIES TO YOU:
% NOTICE OF IMPORTANT RIGHTS:
% YOU HAVE THE RIGHT TO MAKE A WRITTEN 
% OR ORAL REQUEST THAT TELEPHONE CALLS 
% REGARDING YOUR DEBT NOT BE MADE TO YOU AT YOUR PLACE OF EMPLOYMENT.


% ANY SUCH ORAL REQUEST WILL BE VALID FOR ONLY TEN (10) DAYS 
% UNLESS YOU PROVIDE WRITTEN CONFIRMATION OF THE REQUEST POST MARKED OR 
% DELIVERED WITHIN SEVEN (7) DAYS OF SUCH REQUEST.


% YOU MAY TERMINATE THIS REQUEST BY WRITING TO MIDLAND CREDIT MANAGEMENT, INC.
