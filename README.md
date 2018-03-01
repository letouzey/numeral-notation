
Numeral Notation
================

This library provides a `Numeral Notation` command, that allows one to
declare how to parse and print values belonging to an inductive type
representing numbers.

More information in the corresponding Pull Request https://github.com/coq/coq/pull/496 .

The present library is meant to let this work be available to Coq 8.7.x users,
even though the above Pull Request is still work-in-progress.

Compared with the Pull Request code, the Coq files here have been slightly
reorganized, in order to work as a third-party package. In particular:

 - The main `Numeral Notation` command is made available by `NumeralNotation.v`
 - Exemples of use for `nat`, `positive`, `N`, `Z` are in `NatNotation.v` and `BinNotations.v`


Install
-------

 - Be sure to have a coq 8.7.x in your `$PATH` or `$COQBIN`.
 - Run `make`.
 - Run `make install`.


Authors
-------

Copyright INRIA 2016-2018.

Initial code by Daniel de Rauglaudre, see https://github.com/coq/coq/pull/156 .
Current extension by Pierre Letouzey, see https://github.com/coq/coq/pull/496 .

License
-------

LGPL 2.1
