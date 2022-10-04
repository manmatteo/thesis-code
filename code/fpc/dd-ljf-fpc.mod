type dd     int -> cert.
type indx   index.

storeL_jc   (dd D) (dd D) indx.
decideL_je  (dd D) (dd D') indx :- D > 0, D' is D - 1.
decideR_je  (dd D) (dd D') :- D > 0, D' is D - 1.
storeR_jc   (dd D) (dd D).
releaseL_je (dd D) (dd D).
releaseR_je (dd D) (dd D).
initialL_je (dd _D).
initialR_je (dd _D) indx.
some_jc     (dd D) (x\ dd D).
all_jc      (dd D) (x\ dd D).
some_je     (dd D) (dd D) _.
all_je      (dd D) (dd D) _.
arr_jc      (dd D) (dd D).
andPos_jc    (dd D) (dd D).
or_jc       (dd D) (dd D) (dd D).
andNeg_jc   (dd D) (dd D) (dd D).
arr_je      (dd D) (dd D) (dd D).
andPos_je   (dd D) (dd D) (dd D).
or_je       (dd D) (dd D) _.
andNeg_je   (dd D) (dd D) _.
true_je    (dd _D).
true_jc    (dd D) (dd D).