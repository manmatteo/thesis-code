type memb_and_rest A -> list A -> list A -> prop.
memb_and_rest X [X] [].
memb_and_rest X [H|R] [H|R'] :- memb_and_rest X R R'.