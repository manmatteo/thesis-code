type dd     nat -> cert.
type indx   index.
kind nat    type.
type zero   nat.
type s      nat -> nat.
% The decide expert reduces the depth by one
decideE  (dd (s D)) (dd D) indx.
% All other clerks and experts only thread through the certificate in this fashion
andE   (dd D) (dd D) (dd D).
