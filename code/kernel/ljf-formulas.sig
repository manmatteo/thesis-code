sig ljf-formulas.

kind form, i                    type. % Formulas and terms

type n, p           A -> form.         % Constructors of literals
type d-, d+      form -> form.         % Delays 
type (&&-)    form -> form -> form. % Conjunctions
type (&&+)   form -> form -> form. % Conjunctions
type (||+)         form -> form -> form. % Disjunction
type (==>)         form -> form -> form. % Implication
type all, some   (A -> form)  -> form. % Quantifiers
type f, t+, t-                   form. % Units

% elpi:skip 3  // the next lines are for Teyjus
infixr &&-, &&+  6.
infixr ||+  5.
infixr ==> 4.


% Note: there are no constructors for type atm.  In fact, I've removed
% atm for a polymorphic typing.  Ultimately, such polymorphism needs
% to be removed.

% The current strategy is to use atomic "client" formulas as atoms themselves.
