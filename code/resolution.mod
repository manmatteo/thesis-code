orC (start Ct Certs) (start Ct Certs).
falseC (start Ct Certs) (start Ct Certs).
storeC (start Ct Certs) (start Ct’ Certs) (idx Ct) :-
inc Ct Ct’.
cutE (start _ Certs) C1 C2 Cut :-
cutE (rlist Certs) C1 C2 Cut.
cutE (rlist (resolve K Cert::Certs))
Cert (rlisti K Certs) Cut :-
lemma K Cut, Cert = (res _ _).
% Ambiguous order
cutE (rlist (resolveX K (res I (rex J done))::Certs))
(res I (rex J done)) (rlisti K Certs) Cut :-
lemma K Cut.
cutE (rlist (resolveX K (res I (rex J done))::Certs))
(res J (rex I done)) (rlisti K Certs) Cut :-
lemma K Cut.
falseC (rlist Rs) (rlist Rs).
storeC (rlisti K Rs) (rlist Rs) (idx K).
decideE (rlist []) rdone (idx I).
trueE rdone.
% Left premise
allC (res I Cert) (x\ res I Cert).
orC (res I Cert) (res I Cert).
falseC (res I Cert) (res I Cert).
storeC (res I Cert) (res I Cert) lit.
decideE (res I (rex J Cert)) (rex J Cert) (idx I).
decideE (res I (rex J Cert)) (rex I Cert) (idx J).
someE (rex J Cert) (rex J Cert) T.
someE done done T.
andE (rex J Cert) small (rex J Cert).
andE (rex J Cert) (rex J Cert) small.
releaseE (rex J Cert) (rex J Cert).
storeC (rex J Cert) (rex J Cert) pivot.
decideE (rex I Cert) Cert (idx I) :- Cert = done.
andE done small done.
andE done done small.
initialE done pivot.
andE small small small.
trueE small.
initialE small lit.
releaseE small nsmall.
storeC nsmall nsmall immediate.
decideE nsmall ismall lit.
initialE ismall immediate.