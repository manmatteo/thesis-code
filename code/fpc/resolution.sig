% Deduced clauses
type lemma int -> form -> o.
% Stored clauses
type idx int -> index.
% Stored literals
type lit index.
% Initial indexing
type start int -> list cert -> cert.
% List of resolution triples
kind triple type.
type rlist list triple -> cert.
% Extract index of new clause
type rlisti int -> list triple -> cert.
% Resolvent triple
type resolve int -> int -> int -> triple.
% Check resolution step
type dlist list int -> cert.
% End with initial
type rdone cert.
% End of left cut premise
type done cert.
