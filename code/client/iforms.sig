sig iforms.
accum_sig "../kernel/ljf-formulas".

% The syntactic categories for intuitionistic formulas and for first-order individuals.

/* iformsig */
kind iform, i       type.  
type imp            iform -> iform -> iform.
type forall         (A -> iform) -> iform.
/* end */

type tt, ff         iform.
type and, or        iform -> iform -> iform.
type exists         (A -> iform) -> iform.

type atomic, non_atomic                   iform -> prop.

type polarize_neg, polarize_pos   iform -> prop.
% These later two predicates are expected to divide all atomic 
% formulas into non-overlapping sets of positive and negative atoms.
