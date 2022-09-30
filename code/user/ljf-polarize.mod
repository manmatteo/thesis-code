module ljf-polarize.

polarize tt t+.
polarize tt t-.
polarize ff f.
polarize (B and C) (B' -&- C') :- polarize B B', polarize C C'.
polarize (B and C) (B' +&+ C') :- polarize B B', polarize C C'.
polarize (B or  C) (B' -!- C') :- polarize B B', polarize C C'.
polarize (B imp C) (B' ==> C') :- polarize B B', polarize C C'.
polarize (forall B)(all B')  :- pi x\ polarize (B x) (B' x).
polarize (exists B)(some B') :- pi x\ polarize (B x) (B' x).
polarize A (n A) :- atomic A.
polarize A (p A) :- atomic A.

polarize+ A          (p A)     :- atomic A.
polarize+ (T imp S)  (A ==> B) :- polarize+ T A, polarize+ S B.
polarize+ (forall T) (all B)   :- pi x\ polarize+ (T x) (B x).

polarize- A (n A) :- atomic A.
polarize- (T imp S) (A ==> B) :- polarize- T A, polarize- S B.
polarize- (T or S) (A -!- B) :- polarize- T A, polarize- S B.
polarize- (T and S) (A -&- B) :- polarize- T A, polarize- S B.
polarize- (forall B)(all B')  :- pi x\ polarize- (B x) (B' x).
polarize- (exists B)(some B') :- pi x\ polarize- (B x) (B' x).

polarizeP A (n A) :- atomic A.
polarizeN A (n A) :- atomic A.
polarizeP (T imp S) ((A ==> B) +&+ t+) :- polarizeN T A, polarizeP S B.
polarizeN (T imp S) (A ==> B)          :- polarizeP T A, polarizeN S B.
