sig lkf-tseitin-certificates.

kind cert, index                         type.
kind choice                              type.
type left, right                       choice.

type all_tkc                  cert -> (A -> cert) -> o.
type andNeg_tkc               cert -> cert -> cert -> o.
type andPos_tke               cert -> cert -> cert -> o.
type cut_tke                  cert -> cert -> cert -> form -> o.
type decide_tke               cert -> cert -> index -> o.
type false_tkc                cert -> cert -> o.
type initial_tke              cert -> index -> o.
type orNeg_tkc                cert -> cert -> o.
type orPos_tke                cert -> cert -> choice -> o.
type release_tke              cert -> cert -> o.
type some_tke                 cert -> cert -> A -> o.
type store_tkc                cert -> cert -> index -> o.
type true_tke                 cert -> o.