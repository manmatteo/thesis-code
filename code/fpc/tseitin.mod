accumulate mimic-lkf-fpc.

release_ke C1 C2 :-
  release_tke C1 C2.

decide_ke C C3 J :-
  decide_tke C C1 _I,
  andPos_tke C1 C2 C3,
  initial_tke C2 J,
  J = (idx _).

eta_initial C I :-
  initial_tke C I.

cut_ke C C2 (litcert C3) F' :-
  decide_tke C C1 I,
  andPos_tke C1 C2 C3,
  release_tke C2 _C4,
  mapsto I F, polarize_res F F'.

decide_ke C1 C2 I :-
  decide_tke C1 C2 I.

release_ke (litcert C) (litcert C).
store_kc (litcert C) (litidx C I) I.
decide_ke (litidx C I) C I.

store_kc C1 C2 I :-
  store_tkc C1 C2 I.

initial_ke C I :-
  initial_tke C I.

release_ke C (mimic I) :-
  initial_tke C I.

orNeg_kc C1 C2 :-
  orNeg_tkc C1 C2.

orPos_ke C C _Choice.

cut_ke C1 C2 C3 TF :-
  cut_tke C1 C2 C3 F,
  detseitin F DF, nnf DF PF, polarize_tseitin PF TF.

detseitin (A ||- B) (A' ||- B') :-
  detseitin A A', detseitin B B'.
% Continue similarly with the detseitin clauses
detseitin (A ||+ B) (A' ||+ B') :- detseitin A A', detseitin B B'.
detseitin (A &&- B) (A' &&- B') :- detseitin A A', detseitin B B'.
detseitin (A &&+ B) (A' &&+ B') :- detseitin A A', detseitin B B'.
detseitin (d+ A) (d+ A') :- detseitin A A'.
