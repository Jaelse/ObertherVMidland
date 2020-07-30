:- module(collection_letter, [statement/4, communication_medium/2]).

statement("collection letter", 
    1, 
    notice('collection letter', 'new ownership'), 
    []
).

statement("collection letter", 
    2, 
    notice('collection letter', 'pre-legal review'), 
    []
).
statement("collection letter", 
    3, 
    do(
        creditor,
        sold_credit_account,
        debt_collector, 
        t_2013_10_21
    ),
    []
).

statement("collection letter", 
    4, 
    do(
        debt_collector, 
        service_credit_account,
        consumer,
        t_1
    ),
    []
).

statement("collection letter", 
    5, 
    do(
        debt_collector,
        collect_credit_account,
        consumer,
        t_1
    ),
    []
).


statement("collection letter", 
    6, 
    do(
        debt_collector, 
        considering_forwarding_for_credit_account,
        attorney,
        t_1 
    ),
    []
).

statement("collection letter",
    7,
    do(
        debt_collector, 
        forwarding_credit_account,
        attorney,
        t_1
    ),
    [after(t_1, t_thirty)]
).


statement("collection letter", 
    8, 
    do(
        debt_collector, 
        stop_process_forwarding_credit_account,
        attorney,
        t_a
    ),
    [ 
        do(consumer, pay_500, debt_collector, t_d),
        do(consumer, call_debt_collector, debt_collector, t_e),
        before(t_d, t_thirty),
        before(t_e, t_thirty),
        after(t_a,t_d),
        after(t_a,t_e)
    ]
).

statement("collection letter",
    9, 
    assume_valid(debt_collector, debt, consumer, t_w), 
    [
        not_do(
            consumer,
            dispute_debt,
            debt_collector,
            t_w
        ), 
        before(t_w, t_thirty)
    ]
).

statement("collection letter",
    10, 
    do(
        debt_collector,
        obtain_and_mail_verification_of_debt,
        consumer, 
        t_s
    ),
    [
        do(
            consumer, 
            notifies_dispute_debt,
            debt_collector, 
            t_y
        ),
        before(t_y, t_thirty),
        after(t_s, t_y)
    ]
).

statements([1,2,3,4,5,6,7,8,9,10]).

communication_medium("collection letter", INFORMATION) :-
    statements(No_of_statements),
    helpers:getStatements("collection letter", No_of_statements, [], INFORMATION),!.


% obtain("Midland", judgment_of_the_debt) :-
%     notifies("Oberther",
%            "Midland",
%            dispute("Oberther", part_of_the_debt(_))),
%     thirty_day_time_period.

% mail("Midland", verification_of_the_debt) :-
%     notifies("Oberther",
%            "Midland",
%            dispute("Oberther", part_of_the_debt(_))),
%     thirty_day_time_period.

% mail("Midland", judgment_of_the_debt) :-
%     notifies("Oberther",
%            "Midland",
%            dispute("Oberther", part_of_the_debt(_))),
%     thirty_day_time_period.

% If you request, in writing, within thirty (30) days after receiving this notice,
%  MCM will provide you with the name and address of the original creditor.
% provide("Midland", name_of_original_creditor, address_of_original_creditor) :-
%     notifies("Oberther",
%            "Midland",
%            dispute("Oberther", part_of_the_debt(_))),
%     thirty_day_time_period.

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