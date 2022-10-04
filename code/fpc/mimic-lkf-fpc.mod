accumulate "../util/lib".
% all_kc   A (x\ A). 
% cut_ke    
% false_kc  
% some_ke   
type root index.
type mL, mR index -> index.
type aphase index -> list index -> list index -> cert.
type sphase list index -> index -> cert.

andNeg_kc  (aphase Root Cs [I|R]) (aphase Root [mL I|Cs] [mL I|R]) (aphase Root [mR I|Cs] [mR I|R]).
andPos_ke  (sphase Cs I) (sphase Cs (mL I)) (sphase Cs (mR I)).
decide_ke  (aphase I Cs _J) (sphase Cs I) I.
initial_ke (sphase _Cs I) I.
orNeg_kc   (aphase Root Cs [I|R]) (aphase Root Cs [mL I, mR I|R]).
orPos_ke   (sphase Cs I)   (sphase Cs' (mL I)) left  :-
   memb_and_rest (mL I) Cs Cs'.
orPos_ke   (sphase Cs I)   (sphase Cs' (mR I)) right :-
   memb_and_rest (mR I) Cs Cs'.
release_ke (sphase _Cs I)  (aphase I [] [I]).
store_kc   (aphase Root Cs [I|R]) (aphase Root Cs R) I.
true_ke    (sphase _Cs _I).