orC      (start Ct Certs) (start Ct Certs).
falseC   (start Ct Certs) (start Ct Certs).
storeC   (start Ct Certs) (start Ct’ Certs) (idx Ct) :-
         inc Ct Ct’.
cutE     (start _ Certs) C1 C2 Cut :-
         cutE (rlist Certs) C1 C2 Cut.

cutE     (rlist (resolve I J K ::Certs))
         (dlist [I,J]) (rlisti K Certs) Cut :-
         lemma K Cut.
falseC   (rlist Rs) (rlist Rs).
storeC   (rlisti K Rs) (rlist Rs) (idx K).
decideE  (rlist []) rdone (idx I).
trueE    rdone.

% Left premise
allC     (dlist L) (x\ dlist L).
orC      (dlist L) (dlist L).
falseC   (dlist L) (dlist L).
storeC   (dlist L) (dlist L) lit.
decideE  (dlist L) (dlist [J]) (idx I) :- L = [I,J] ; L = [J,I].
decideE  (dlist [I]) (dlist []) (idx I).
decideE  (dlist L) (dlist []) lit :- L = [I] ; L = [].
initialE (dlist L) lit.
trueE    (dlist _L).
andE     (dlist L) (dlist L) (dlist L).
someE    (dlist L) (dlist L) T.
releaseE (dlist L) (dlist L).
