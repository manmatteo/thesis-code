accumulate mimic-lkf-fpc.

release_ke C1 C2 :-
  release_tke C1 C2.

decide_ke C C3 J :-
  decide_tke C C1 _I,
  % print "if",
  andPos_tke C1 C2 C3,
  initial_tke C2 J,
  J = (idx _),
  print "Tseitin decision on" J, wait.

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
% release_ke C (aphase I [] [I]) :-
%   initial_tke C I.
  % print "Found initial on" I ", should mimic with cert" C,
  % read X, X, read _Y.

orNeg_kc C1 C2 :-
  orNeg_tkc C1 C2.
orPos_ke C C _Choice.

cut_ke C1 C2 C3 F' :-
  cut_tke C1 C2 C3 F,
  print "Retrieved" F "for resolution cut",
  detseitin F F', print "detseitin!" F'.

detseitin (A ||- B) (A' ||- B') :- detseitin A A', detseitin B B'.
detseitin (A ||+ B) (A' ||+ B') :- detseitin A A', detseitin B B'.
detseitin (A &&- B) (A' &&- B') :- detseitin A A', detseitin B B'.
detseitin (A &&+ B) (A' &&+ B') :- detseitin A A', detseitin B B'.
detseitin (d+ A) (d+ A') :- detseitin A A'.