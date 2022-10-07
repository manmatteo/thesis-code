type dd     int -> cert.
type indx   index.
% The decide expert reduces the depth by one
decide_ke (dd D) (dd D') indx :- D > 0, D' is D - 1.
% All other clerks and experts only thread through the certificate in this fashion
andPos_ke  (dd D) (dd D) (dd D).
andNeg_kc  (dd D) (dd D) (dd D).
initial_ke (dd _D) indx.
orNeg_kc   (dd D) (dd D).
orPos_ke   (dd D) (dd D) _Dec.
all_kc     (dd D) (x\ dd D).
false_kc   (dd D) (dd D).
release_ke (dd D) (dd D).
some_ke    (dd D) (dd D) _Term.
store_kc   (dd D) (dd D) indx.
true_ke    (dd _D).
% cut_ke
