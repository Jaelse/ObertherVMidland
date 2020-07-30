:- module(helpers, [getRules/4, getActions/3, getStatements/4, contains/4, disclosure_of_rtd/3, disparage/2]).

% --------------------------------------------- findRulesWithSimilarEffect ------------------------------
findRulesWithSimilarEffect([], _, R, R).
findRulesWithSimilarEffect([H|T], INFORMATION, WR, R) :-
    H = pe(_, E),
    getSimilar(INFORMATION, E, Statement, Effect),
    append(WR, [(Statement, Effect)], NWR),
    findRulesWithSimilarEffect(T, INFORMATION, NWR, R).



getSimilar([], _, _, _) :- fail.
getSimilar([H|T], Effects, S, E) :-
    (H = statement(N,M,do(Doer,Action,Doee,Time),Conditions) ->
        (checkEachEffect(Action, Effects, Similar) ->
            S = statement(N,M,do(Doer,Action,Doee,Time),Conditions),
            E = Similar;
            getSimilar(T, Effects, S, E)
        );
        getSimilar(T, Effects, S,E)
    ).


checkEachEffect(_, [], _) :- fail.
checkEachEffect(Action, [H|T], Similar) :-
    ( similar(Action, H) ->
        Similar = similar(Action, H);
        (similar(H,Action) ->
            Similar = similar(H,Action);
            checkEachEffect(Action, T, Similar)
        )
    ).    


similar(cease_collection_debt, stop_process_forwarding_credit_account).
% --------------------------------------------- getStatements ------------------------------
getStatements(_, [], WL, WL).
getStatements(A, [H|T], WL, Statements) :-
    statement(A, H, Head, Body),
    append(WL, [statement(A,H, Head, Body)], NWL),
    getStatements(A, T, NWL, Statements),!.

% --------------------------------------------- getRules ------------------------------------------------

getRules(_, [], R,R).
getRules(A, [H|T], WR, Rules) :-
    fdcpa1692g:rule(A, H, Head, Body),
    append(WR, [rule(A, H, Head, Body)], NWR),
    getRules(A, T, NWR, Rules).
% --------------------------------------------- practical effect ---------------------------------------

practicalEffectAccordingToFDCPA([], PE,PE).
practicalEffectAccordingToFDCPA([H|T], WPE, PE) :- 
    H = statement(_, _, _, Body),
    getActions(Body, [], Action),

    (\+(Action = []) ->
        fdcpa1692g:rules(List),
        getRules("fdcpa 1692g", List, [], Rules),
        rulesWithActionInHead(Rules, [], ActionRules),

        getEffects(ActionRules, Action, [],  Effects),
        getActions(Effects, [], Effect),
        AE = pe(Action, Effect),
        append(WPE, [AE], NWPE),
        practicalEffectAccordingToFDCPA(T, NWPE, PE);
        practicalEffectAccordingToFDCPA(T,WPE,PE)
    ),!.

% --------------------------------------------- getAllRulesWithAction ------------------------------------------------

getEffects([], _, L,L).
getEffects([H|T], Action, WL, ActionRules) :-
    H = rule(_,_, Head, Body),
    (getActions(Body, [], Action) -> 
        append(WL, [Head], NWL),
        getEffects(T, Action, NWL, ActionRules);
        getEffects(T, Action, WL, ActionRules)
    ).

% --------------------------------------------- getAllRulesWithAction ---------------------------------------

rulesWithActionInHead([], WL, WL).
rulesWithActionInHead([H|T], WL, ActionRules) :-
    ((H = rule(_, _, do(_,_,_,_), _)) ->
        append(WL, [H], NWL),
        rulesWithActionInHead(T, NWL, ActionRules);
        rulesWithActionInHead(T, WL, ActionRules)
    ).


% --------------------------------------------- getActions ------------------------------------------------

getActions([], Actions, Actions).
getActions([H|T], WA, Actions) :-
    (actionIs(H, Action) ->
        append(WA, [Action], NWA),
        getActions(T, NWA, Actions);
        getActions(T, WA, Actions)     
    ).

actionIs(do(_,Action,_,_), Action).
% --------------------------------------------- actions ------------------------------------------------
actions(
    [
        dispute_debt, 
        notifies_dispute_debt, 
        cease_collection_debt,
        obtain_and_mail_verification_of_debt,
        sold_credit_account,
        service_credit_account,
        collect_credit_account,
        considering_forwarding_for_credit_account,
        forwarding_credit_account,
        stop_process_forwarding_credit_account,
        pay_500,
        call_debt_collector
    ]
).
% --------------------------------------------- contains -----------------------------------------------
contains([], _, L, L).
contains([H|T], (Mod, List), WL, L) :-
    getRules(Mod, List, [], Rules),
    ( statementMatchRule(H, Rules) ->
        append(WL, [H], NWL),
        contains(T, (Mod, List), NWL, L);
        contains(T, (Mod, List), WL, L)
    ),!.
% --------------------------------------------- statementMatchRule -----------------------------------------------

statementMatchRule(statement(_,_, _, _), []) :- fail.
statementMatchRule(statement(_,_, Head, Body), [rule(_,_,H1,B1)|T]) :- 
    (\+((H1 = Head, B1 = Body)) ->
        statementMatchRule(statement(_,_, Head, Body), T);
        true,!
    ),!.
% --------------------------------------------- disclosure_of_rtd -----------------------------------------------
disclosure_of_rtd(DISCLOSURE, debt_collector, consumer) :-
    communication_medium(_, INFORMATION),
    contains(
        INFORMATION, 
        ("fdcpa 1692g",
        [
            "a1", 
            "a2"
        ]),
        [],
        DISCLOSURE
    ).
% --------------------------------------------- disclosure_of_rtd -----------------------------------------------

disparage( 
    INFORMATION,
    PE
) :- 
    findRulesWithSimilarEffect(PE, INFORMATION, [], [H|_]),
    H = (Statement, Similar),
    findPEWithSimilar(PE, Similar, Action),
    Statement = statement(_,_, _, Bodies),
    (member(do(_, Action, _,_), Bodies) ->
        print("no");
        print("Yes")
    ),!.

    % ( Statement = statement(_,_, A, Body) ->

    %     (Statement  = statement(_,_,B,Body) ->
    
    % ).


    

findPEWithSimilar([H|T], similar(A,B), Action) :-
    H = pe([L], Effects),
    ( (member(A, Effects); member(B, Effects))->
        Action = L;
        findPEWithSimilar(T, similar(A,B), Action)
    ).