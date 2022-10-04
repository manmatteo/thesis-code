module cforms.

non_atomic tt         & non_atomic ff.
non_atomic (neg _).
non_atomic (and _ _)  & non_atomic (or _ _).
non_atomic (imp _ _)  & non_atomic (equiv _ _).
non_atomic (forall _) & non_atomic (exists _).

atomic A :- non_atomic A, !, fail.  % NAF here.
atomic _A.

literal A       :- atomic A.
literal (neg A) :- atomic A.

% Negation normal form.

nnf tt tt.
nnf ff ff.
nnf (and B C) (and B' C') :- nnf B B', nnf C C'.
nnf (or  B C) (or  B' C') :- nnf B B', nnf C C'.
nnf (forall B) (forall B') :- pi x\ nnf (B x) (B' x).
nnf (exists B) (exists B') :- pi x\ nnf (B x) (B' x).
nnf (imp B C)   D :- nnf (or (neg B) C) D.
nnf (equiv B C) D :- nnf (and (imp B C) (imp C B)) D.
nnf A A :- atomic A.

nnf (neg tt) ff.
nnf (neg ff) tt.
nnf (neg (neg A)) B :- nnf A B.
nnf (neg (and B C)) (or  B' C') :- nnf (neg B) B', nnf (neg C) C'.
nnf (neg (or B  C)) (and B' C') :- nnf (neg B) B', nnf (neg C) C'.
nnf (neg (forall B)) (exists B') :- pi x\ nnf (neg (B x)) (B' x).
nnf (neg (exists B)) (forall B') :- pi x\ nnf (neg (B x)) (B' x).
nnf (neg (imp B C))   D :- nnf (and B (neg C)) D.
nnf (neg (equiv B C)) D :- nnf (neg (and (imp B C) (imp C B))) D.
nnf (neg A) (neg A) :- atomic A.
