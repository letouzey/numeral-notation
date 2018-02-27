(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2016     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(** * NumeralNotation *)

(** This loads the Numeral Notation command, and provides a
    (pretty straightforward) parsing/printing of decimal numbers *)

Require Import Decimal.

Declare ML Module "numeral_notation_plugin".

Numeral Notation uint uint_of_uint uint_of_uint : uint_scope.
Numeral Notation int int_of_int int_of_int : int_scope.

