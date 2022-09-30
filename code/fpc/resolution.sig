% Deduced clauses
type lemma int -> form -> o.
% Label of clauses
type idx int -> index.
% Label for stored literals
type lit index.
% Needed just for the initial clerks
type start int -> list cert -> cert.
% List of resolution triples
kind triple type.
type rlist list triple -> cert.
% Extract the index of the new clause
type rlisti int -> list triple -> cert.
% Introduce a resolvent subproof
type resolve int -> int -> int -> triple.
% Check resolution step
type dlist list int -> cert.
% Must do an initial immediately
type rdone cert.
% End of the left premise of cut
type done cert.
