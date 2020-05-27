# Oberther v. Midland Credit Management, INC.

Prolog code for the case Mary Oberther V. Midland Credit Management, INC.

## Rules by FDCP Act meaning

### Communication

The term “[communication](https://www.law.cornell.edu/definitions/uscode.php?width=840&height=800&iframe=true&def_id=15-USC-1035284522-644019129&term_occur=999&term_src=title:15:chapter:41:subchapter:V:section:1692g)” means the conveying of information
regarding a debt directly or indirectly to any person through any medium.

Explanation: \
Generally, in a communication, there is at least a person who sends some message through some medium
and there needs to be a person who receives the same message through the same medium. The information must have the information regarding the debt in order to qualify as a collection letter for FDCPA purpose.

There can be many variations in who the SENDER and RECEIVER can be and there can be many different MEDIUM. Although, this particular rule is for a communication where the sender is a debt collector, the receiver is a consumer, the medium is a collection letter.
communication(SENDER, RECEIVER,  INFORMATION)
RULE INTERPRETATION:

```IF-THEN
IF
DEBT_COLLECTOR is a debt collector
AND
CONSUMER is a consumer
AND
DEBT_COLLECTOR sent INFORMATION through MEDIUM
AND
CONSUMER received INFORMATION throught MEDIUM
AND
MEDIUM is a collection letter having INFORMATION
THEN
DEBT_COLLECTOR had communication with CONSUMER through MEDIUM having INFORMATION
```
