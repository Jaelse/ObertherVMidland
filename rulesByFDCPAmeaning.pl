% The term “communication” means 
% the conveying of information regarding 
% a debt directly or indirectly to any person through any medium.

% TODO: test communication and refactor accordingly
communication(debt_collector(DC), consumer(C), collection_letter(INFORMATION), DATE) :-
    sent(DEBT_COLLECTOR, collection_letter(INFORMATION), _),
    received(CONSUMER, collection_letter(INFORMATION), DATE).    
     

