% New Oxford American Dictionary: 
% communication is the imparting or exchanging of information or news;
% a letter or message containing information or news;
% the successful conveying or sharing of ideas and feelings;
% Explanation:
% In a communication at least there needs to be a person who sends some message through some medium
% and there needs to be a person who receives the same message through the same medium 
% communication(SENDER, RECEIVER,  INFORMATION)
% RULE INTERPRETATION:
% IF 
% SENDER sent MESSAGE through MEDIUM
% AND
% RECEIVER received MESSAGE throught MEDIUM
% THEN
% SENDER communication with RECEIVER through MEDIUM had MESSAGE  




% The term “communication” means the conveying of information regarding a debt directly or indirectly to any person through any medium.
% https://www.law.cornell.edu/definitions/uscode.php?width=840&height=800&iframe=true&def_id=15-USC-1035284522-644019129&term_occur=999&term_src=title:15:chapter:41:subchapter:V:section:1692g
communication(DEBT_COLLECTOR, CONSUMER, MEDIUM, MESSAGE) :-
    debt_collector(DEBT_COLLECTOR),
    debtor(CONSUMER),
    sent(DEBT_COLLECTOR, MESSAGE, MEDIUM),
    received(CONSUMER, MESSAGE, MEDIUM).

% New Oxford American Dictionary: 
% disclose
% make (secret or new information) known:

