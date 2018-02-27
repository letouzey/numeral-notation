(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2016     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(** BinNotation : parse/print numbers in [positive], [N], [Z]
    through Numeral Notation. *)

Require Import NumeralNotation BinNums DecimalBin.

Numeral Notation positive Pos.of_int Pos.to_uint : positive_scope.

Numeral Notation N N.of_int N.to_uint : N_scope.

Numeral Notation Z Z.of_int Z.to_int : Z_scope.