plaintiff("Oberther").

defendant("Midland").

% Prior to October of 2013, Plaintiff opened a credit account with capital One, N.A.
opened("Oberther",
    date("October 2013"),
    account("credit"),
    creditor("Capital One")).

% She used the account to acquire personal household items and, therefore,
% she is a "consumer" under 15 U.S.C sec. 1692a(3)
consumer("Oberther", according_to_code("15 U.S.C sec. 1692a(3)")).

% She incurred "debt" under 15 U.S.C. sec. 1692a(5).
incured_debt("Oberther",
    according_to_code("15 U.S.C. sec. 1692a(5)")).

% At some point, the account went into arrears and Capital One, N.A. sold the account to Midland Funding
account_arrears("Oberther").
sold("Capital One").

debt_collector("Midland").


do(debt_collector, send_collection_letter, consumer, t_e).