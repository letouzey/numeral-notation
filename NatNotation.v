(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2016     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(** NatNotation : parse/print numbers in [nat] through Numeral Notation. *)

Require Import NumeralNotation DecimalNat.

Numeral Notation nat Nat.of_uint Nat.to_uint : nat_scope (abstract after 5000).

