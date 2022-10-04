module iforms.

non_atomic tt         & non_atomic ff.
non_atomic (and _ _)  & non_atomic (or _ _)  &  non_atomic (imp _ _).
non_atomic (forall _) & non_atomic (exists _).

atomic A :- non_atomic A, !, fail.  % NAF here.
atomic _A.

