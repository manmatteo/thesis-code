sig lkf-kernel.

accum_sig lkf-certificates, lkf-formulas.

type lkf_entry      cert -> form -> o.

kind seq                         type.
type unf             list form -> seq.
type foc                  form -> seq.
type check           cert -> seq -> o.
type storage       index -> form -> o.
type store         index -> form -> o -> o.
