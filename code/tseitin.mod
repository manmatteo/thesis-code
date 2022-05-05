storeC  (Index ListClauses) (Index ListClauses) Index.
decideE (Index [(N1,N2)|List]) (Index List) Idx :- get_idx N1 N2 Idx.
andC    (Index ListClauses) ((l Index) ListClauses) ((r Index) ListClauses).
orC     (Index ListClauses) ((l Index) ListClauses) ((r Index) ListClauses).
type cutE                  cert -> cert -> cert -> form -> o.
type initialE              cert -> index -> o.
type releaseE              cert -> cert -> o.
type falseC                cert -> cert -> o.
type trueE                 cert -> o.
