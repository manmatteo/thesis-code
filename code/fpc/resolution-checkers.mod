kind rstep type.
kind resolv type.
kind rclause type.
kind state type. % additional information which might be required by implementing fpcs.

type estate state. %empty state
type istate list int -> state. %state of input formula operands indices

type res_step resolv -> index -> index -> index -> o.
type resolv index -> index -> index -> resolv.
type rsteps list resolv -> state -> cert. % sequence of steps and a state
type rstepsi index -> list resolv -> state -> cert. % sequence of steps and a state

% type dlist rclause -> rclause -> cert.
type dlist index -> index -> cert.

% type rid index -> rclause.
type dlist2 index -> cert.
type dlist3 cert.

type idx      int -> index.  % These label clauses which are never literals.
type lit      index. % These label literals that enter the context.
type tlit      index. % index t+

type done cert.
type mapsto index -> cform -> o.
% Proving the sequent can be proved by deciding clauses C1, C2 and some other clause.

store_kc (dlist C1 C2) (dlist C1 C2) lit.
store_kc (dlist2 C1) (dlist2 C1) lit.
store_kc dlist3 dlist3 lit.
andPos_ke (dlist C1 C2) (dlist C1 C2) (dlist C1 C2).
andPos_ke (dlist2 C1) (dlist2 C1) (dlist2 C1).
andPos_ke dlist3 dlist3 dlist3.
orNeg_kc (dlist C1 C2) (dlist C1 C2).
orNeg_kc (dlist2 C1) (dlist2 C1).
orNeg_kc dlist3 dlist3.
initial_ke (dlist _ _) lit.
initial_ke (dlist2 I) L :- (L = lit; L = I).
initial_ke dlist3 lit.
initial_ke done lit.
release_ke (dlist C1 C2) (dlist C1 C2).
release_ke (dlist2 C1) (dlist2 C1).
release_ke dlist3 dlist3.
% here we decide the clauses for proving -C1,-C2,C3 of decide depth 3.
% Note that since they might be negative, we will need sometimes to decide on the cut formula
% This cut formula is indexed by lit but all other resolvents from previous
% steps are indexed by idx, so we need to either decide on C1, C2 or lit
decide_ke (dlist I C2) (dlist2 C2) I.
decide_ke (dlist C1 I) (dlist2 C1) I.
decide_ke (dlist C1 _C2) (dlist2 C1) lit.
decide_ke (dlist _C1 C2) (dlist2 C2) lit.
decide_ke (dlist2 I) dlist3 I.
decide_ke (dlist2 _) dlist3 lit.
decide_ke dlist3 done lit.
% the last cut is over t+ and we need to eliminate its negation
false_kc (dlist C1 C2) (dlist C1 C2).
true_ke _List.

%% Main backbone
% gets a sequent |- A &+& B, C, D &+& E, etc.

% here (resolution) we dont care about eigenvariables so we must add that.
% eigencopy A A.

% do we need it here?
release_ke (rsteps A B) (rsteps A B).
% breaking the !-! in the formula
orNeg_kc (rsteps A B) (rsteps A B).
% storing when the index is not given and therefore, not used by experts
% storing true (last cut)
store_kc (rsteps [] B) (rsteps [] B) tlit.
% storing the operands of the !-!
store_kc (rsteps A estate) (rsteps A estate) (idx I):-
  mapsto (idx I) _C.
% the same but using given indices for storing the operands
store_kc (rsteps A (istate [I|IL])) (rsteps A (istate IL)) (idx I).
store_kc (rstepsi K A B) (rsteps A B) K. % storing all other none-indexed formulas

cut_ke (rsteps [R] B) (dlist I J) (rsteps [] B) f- :-
  res_step R I J K,
  mapsto K ff.
% Cuts correspond to resolve steps except for the last resolve
cut_ke (rsteps [R,R1 | RR] B) (dlist I J) (rstepsi K [R1|RR] B) NC :-
  res_step R I J K,
  mapsto K CutForm,
  polarize_res (CutForm) NC.%  print "Let's cut with" NC "at" K, input_line std_in _X.
res_step (resolv I J K) I J K.

% this decide is being called after the last cut
decide_ke (rsteps [] _B) done tlit.
true_ke (done).
