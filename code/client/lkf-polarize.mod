module lkf-polarize.

% Relates cforms to polarized formulas.  Highly non-determinist if first argument only is fixed. 
polarize tt t+  &  polarize tt t-.
polarize ff f+  &  polarize ff f-.
polarize (and B C) (B' &&- C') :- polarize B B', polarize C C'.
polarize (and B C) (B' &&+ C') :- polarize B B', polarize C C'.
polarize (or  B C) (B' ||- C') :- polarize B B', polarize C C'.
polarize (or  B C) (B' ||+ C') :- polarize B B', polarize C C'.
polarize (forall B) (all B')   :- pi x\ polarize (B x) (B' x).
polarize (exists B) (some B')  :- pi x\ polarize (B x) (B' x).
polarize A (n A) :- atomic A, polarize_neg A.
polarize A (p A) :- atomic A, polarize_pos A.
polarize (imp B C)   D :- polarize (or (neg B) C) D.
polarize (equiv B C) D :- polarize (and (imp B C) (imp C B)) D.

polarize (neg tt) f+  &  polarize (neg tt) t-.
polarize (neg ff) f+  &  polarize (neg ff) f-.
polarize (neg (and B C)) (B' ||- C') :- polarize (neg B) B', polarize (neg C) C'.
polarize (neg (and B C)) (B' ||+ C') :- polarize (neg B) B', polarize (neg C) C'.
polarize (neg (or  B C)) (B' &&- C') :- polarize (neg B) B', polarize (neg C) C'.
polarize (neg (or  B C)) (B' &&+ C') :- polarize (neg B) B', polarize (neg C) C'.
polarize (neg (forall B)) (some B')   :- pi x\ polarize (neg (B x)) (B' x).
polarize (neg (exists B)) (all  B')   :- pi x\ polarize (neg (B x)) (B' x).
polarize (neg (neg B)) C     :- polarize B C.
polarize (neg A) (p A)       :- atomic A, polarize_neg A.
polarize (neg A) (n A)       :- atomic A, polarize_pos A.
polarize (neg (imp B C))   D :- polarize (neg (or (neg B) C)) D.
polarize (neg (equiv B C)) D :- polarize (neg (and (imp B C) (imp C B))) D.

% Polarize a cform using all negative connectives when both are available.
polarize- tt t-.
polarize- ff f-.
polarize- (and B C) (B' &&- C') :- polarize- B B', polarize- C C'.
polarize- (or  B C) (B' ||- C') :- polarize- B B', polarize- C C'.
polarize- (forall B) (all B')   :- pi x\ polarize- (B x) (B' x).
polarize- (exists B) (some B')  :- pi x\ polarize- (B x) (B' x).
polarize- A (n A)       :- atomic A, polarize_neg A.
polarize- A (p A)       :- atomic A, polarize_pos A.
polarize- (imp B C)   D :- polarize- (or (neg B) C) D.
polarize- (equiv B C) D :- polarize- (and (imp B C) (imp C B)) D.

polarize- (neg tt) f-.
polarize- (neg ff) t-.
polarize- (neg (and B C)) (B' ||- C') :- polarize- (neg B) B', polarize- (neg C) C'.
polarize- (neg (or  B C)) (B' &&- C') :- polarize- (neg B) B', polarize- (neg C) C'.
polarize- (neg (forall B)) (some B') :- pi x\ polarize- (neg (B x)) (B' x).
polarize- (neg (exists B)) (all  B') :- pi x\ polarize- (neg (B x)) (B' x).
polarize- (neg (neg B)) C :- polarize- B C.
polarize- (neg A) (p A) :- atomic A, polarize_neg A.
polarize- (neg A) (n A) :- atomic A, polarize_pos A.
polarize- (neg (imp B C))   D :- polarize- (neg (or (neg B) C)) D.
polarize- (neg (equiv B C)) D :- polarize- (neg (and (imp B C) (imp C B))) D.

% Polarize a cform using all positive connectives when both are available.
polarize+ tt t+.
polarize+ ff f+.
polarize+ (and B C) (B' &&+ C') :- polarize+ B B', polarize+ C C'.
polarize+ (or  B C) (B' ||+ C') :- polarize+ B B', polarize+ C C'.
polarize+ (forall B) (all B')   :- pi x\ polarize+ (B x) (B' x).
polarize+ (exists B) (some B')  :- pi x\ polarize+ (B x) (B' x).
polarize+ A (n A)       :- atomic A, polarize_neg A.
polarize+ A (p A)       :- atomic A, polarize_pos A.
polarize+ (imp B C)   D :- polarize+ (or (neg B) C) D.
polarize+ (equiv B C) D :- polarize+ (and (imp B C) (imp C B)) D.

polarize+ (neg tt) f+.
polarize+ (neg ff) t+.
polarize+ (neg (and B C)) (B' ||+ C') :- polarize+ (neg B) B', polarize+ (neg C) C'.
polarize+ (neg (or  B C)) (B' &&+ C') :- polarize+ (neg B) B', polarize+ (neg C) C'.
polarize+ (neg (forall B)) (some B') :- pi x\ polarize+ (neg (B x)) (B' x).
polarize+ (neg (exists B)) (all  B') :- pi x\ polarize+ (neg (B x)) (B' x).
polarize+ (neg (neg B)) C :- polarize+ B C.
polarize+ (neg A) (p A) :- atomic A, polarize_neg A.
polarize+ (neg A) (n A) :- atomic A, polarize_pos A.
polarize+ (neg (imp B C))   D :- polarize+ (neg (or (neg B) C)) D.
polarize+ (neg (equiv B C)) D :- polarize+ (neg (and (imp B C) (imp C B))) D.

% Polarization for resolution
polarize_res tt t+.
polarize_res ff f-.
polarize_res (and B C) (B' &&+ C') :- polarize_res B B', polarize_res C C'.
polarize_res (or  B C) (B' ||- C') :- polarize_res B B', polarize_res C C'.
polarize_res (forall B) (all B')   :- pi x\ polarize_res (B x) (B' x).
polarize_res (exists B) (some B')  :- pi x\ polarize_res (B x) (B' x).
polarize_res A (n A) :- atomic A, polarize_neg A.
polarize_res A (p A) :- atomic A, polarize_pos A.
polarize_res (imp B C)   D :- polarize_res (or (neg B) C) D.
polarize_res (equiv B C) D :- polarize_res (and (imp B C) (imp C B)) D.

polarize_res (neg tt) f-.
polarize_res (neg ff) f+  &  polarize_res (neg ff) f-.
polarize_res (neg (and B C)) (B' ||- C') :- polarize_res (neg B) B', polarize_res (neg C) C'.
polarize_res (neg (or  B C)) (B' &&+ C') :- polarize_res (neg B) B', polarize_res (neg C) C'.
polarize_res (neg (forall B)) (some B')   :- pi x\ polarize_res (neg (B x)) (B' x).
polarize_res (neg (exists B)) (all  B')   :- pi x\ polarize_res (neg (B x)) (B' x).
polarize_res (neg (neg B)) C     :- polarize_res B C.
polarize_res (neg A) (p A)       :- atomic A, polarize_neg A.
polarize_res (neg A) (n A)       :- atomic A, polarize_pos A.
polarize_res (neg (imp B C))   D :- polarize_res (neg (or (neg B) C)) D.
polarize_res (neg (equiv B C)) D :- polarize_res (neg (and (imp B C) (imp C B))) D.
