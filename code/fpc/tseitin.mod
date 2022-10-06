decideE C1 C2 I :-
  decideTE C1 C2 I.

decideE C C3 J :-
  decideTE C C1 I,
  andTE    C1 C2 C3,
  initTE   C3 J.

cutE C C2 (lit C3) F :-
  decideTE C C1 I,
  andTE    C1 C2 C3,
  tseitin_clause I F,
  releaseTE C2 C4.

releaseE (lit C) (lit C).
storeC (lit C) (litidx C I) I.
decideE (litidx C I) C I.

storeC C1 C2 I :-
  storeTC C1 C2 I.

initE C I :-
  initTE C I.
releaseE C (mimic I) :-
  initTE C I.

releaseE C1 C2 :-
  releaseTE C1 C2.

orC C1 C2 :-
  orTC C1 C2.