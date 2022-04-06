% Deduced clauses are listed via the lemma predicate.
type lemma int -> form -> o.
% Label of clauses which are never literals.
type idx int -> index.
% Labels for literals that enter the side context.
type lit index.
% Label for the stored pivot literal.
type pivot index.
% Used in small proofs
type immediate index.
% Needed just for the initial clerks.
type start int -> list cert -> cert.
% List of resolution triples.
type rlist list cert -> cert.
% Temporary linkage to share an index.
type rlisti int -> list cert -> cert.
% Introduce a resolvent subproof.
type resolve int -> cert -> cert.
% Introduce an order-ambiguous resolvent subproof.
type resolveX int -> cert -> cert.
% First index in resolvent
type res int -> cert -> cert.
% Second index in resolvent
type rex int -> cert -> cert.
type small cert.
type nsmall cert.
type ismall cert.
% Must do an initial rule immediately.
type rdone cert.
% End of the left premise of cut.
type done cert.