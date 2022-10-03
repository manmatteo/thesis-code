module ljf-polarize.

polarize tt t+.
polarize tt t-.
polarize ff f.
polarize (and B C) (B' &&- C') :- polarize B B', polarize C C'.
polarize (and B C) (B' &&+ C') :- polarize B B', polarize C C'.
polarize (or  B C) (B' ||+ C') :- polarize B B', polarize C C'.
polarize (imp B C) (B' ==> C') :- polarize B B', polarize C C'.
polarize (forall B)(all B')  :- pi x\ polarize (B x) (B' x).
polarize (exists B)(some B') :- pi x\ polarize (B x) (B' x).
polarize A (n A) :- atomic A.
polarize A (p A) :- atomic A.

polarize+ A          (p A)     :- atomic A.
polarize+ (imp T S)  (A ==> B) :- polarize+ T A, polarize+ S B.
polarize+ (forall T) (all B)   :- pi x\ polarize+ (T x) (B x).

polarize- A (n A) :- atomic A.
polarize- (imp T S)  (A ==> B) :- polarize- T A, polarize- S B.
polarize- (or  T S)   (A ||+ B) :- polarize- T A, polarize- S B.
polarize- (and T S)  (A &&- B) :- polarize- T A, polarize- S B.
polarize- (forall B) (all B')  :- pi x\ polarize- (B x) (B' x).
polarize- (exists B) (some B') :- pi x\ polarize- (B x) (B' x).

polarizeP A (n A) :- atomic A.
polarizeN A (n A) :- atomic A.
polarizeP (imp T S) ((A ==> B) &&+ t+) :- polarizeN T A, polarizeP S B.
polarizeN (imp T S) (A ==> B)          :- polarizeP T A, polarizeN S B.
