:- include('./FactualBackground.pl').
:- include('./CodeFdcpa1692g.pl').
:- include('./PollardVLawOfficeOfMandyLSpaulding.pl').

somewhere(india).

something(somewhere(COUNTRY)) :- 
    format("Country is ~p", COUNTRY).
     