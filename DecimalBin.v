(************************************************************************)
(*  v      *   The Coq Proof Assistant  /  The Coq Development Team     *)
(* <O___,, *   INRIA - CNRS - LIX - LRI - PPS - Copyright 1999-2016     *)
(*   \VV/  **************************************************************)
(*    //   *      This file is distributed under the terms of the       *)
(*         *       GNU Lesser General Public License Version 2.1        *)
(************************************************************************)

(** * DecimalBin : conversions between Decimal and binary numbers *)

Require Import Decimal PArith NArith ZArith.

(** We provide these conversions as extensions of modules Pos, N, Z. *)

Module Pos.
Include BinPos.Pos.
Local Open Scope positive.

Local Notation ten := 1~0~1~0.

Fixpoint of_uint_acc (d:Decimal.uint)(acc:positive) :=
  match d with
  | Decimal.Nil => acc
  | Decimal.D0 l => of_uint_acc l (mul ten acc)
  | Decimal.D1 l => of_uint_acc l (add 1 (mul ten acc))
  | Decimal.D2 l => of_uint_acc l (add 1~0 (mul ten acc))
  | Decimal.D3 l => of_uint_acc l (add 1~1 (mul ten acc))
  | Decimal.D4 l => of_uint_acc l (add 1~0~0 (mul ten acc))
  | Decimal.D5 l => of_uint_acc l (add 1~0~1 (mul ten acc))
  | Decimal.D6 l => of_uint_acc l (add 1~1~0 (mul ten acc))
  | Decimal.D7 l => of_uint_acc l (add 1~1~1 (mul ten acc))
  | Decimal.D8 l => of_uint_acc l (add 1~0~0~0 (mul ten acc))
  | Decimal.D9 l => of_uint_acc l (add 1~0~0~1 (mul ten acc))
  end.

Fixpoint of_uint (d:Decimal.uint) : N :=
  match d with
  | Decimal.Nil => N0
  | Decimal.D0 l => of_uint l
  | Decimal.D1 l => Npos (of_uint_acc l 1)
  | Decimal.D2 l => Npos (of_uint_acc l 1~0)
  | Decimal.D3 l => Npos (of_uint_acc l 1~1)
  | Decimal.D4 l => Npos (of_uint_acc l 1~0~0)
  | Decimal.D5 l => Npos (of_uint_acc l 1~0~1)
  | Decimal.D6 l => Npos (of_uint_acc l 1~1~0)
  | Decimal.D7 l => Npos (of_uint_acc l 1~1~1)
  | Decimal.D8 l => Npos (of_uint_acc l 1~0~0~0)
  | Decimal.D9 l => Npos (of_uint_acc l 1~0~0~1)
  end.

Definition of_int (d:Decimal.int) : option positive :=
  match d with
  | Decimal.Pos d =>
    match of_uint d with
    | N0 => None
    | Npos p => Some p
    end
  | Decimal.Neg _ => None
  end.

Fixpoint to_little_uint p :=
  match p with
  | 1 => Decimal.D1 Decimal.Nil
  | p~1 => Decimal.Little.succ_double (to_little_uint p)
  | p~0 => Decimal.Little.double (to_little_uint p)
  end.

Definition to_uint p := Decimal.rev (to_little_uint p).

Definition to_int n := Decimal.Pos (to_uint n).

End Pos.

Module N.
Include BinNat.N.

Definition of_uint (d:Decimal.uint) := Pos.of_uint d.

Definition of_int (d:Decimal.int) :=
  match Decimal.norm d with
  | Decimal.Pos d => Some (Pos.of_uint d)
  | Decimal.Neg _ => None
  end.

Definition to_uint n :=
  match n with
  | N0 => Decimal.zero
  | Npos p => Pos.to_uint p
  end.

Definition to_int n := Decimal.Pos (to_uint n).

End N.

Module Z.
Include BinInt.Z.

Definition of_uint (d:Decimal.uint) := of_N (Pos.of_uint d).

Definition of_int (d:Decimal.int) :=
  match d with
  | Decimal.Pos d => of_uint d
  | Decimal.Neg d => opp (of_uint d)
  end.

Definition to_int n :=
  match n with
  | Z0 => Decimal.Pos Decimal.zero
  | Zpos p => Decimal.Pos (Pos.to_uint p)
  | Zneg p => Decimal.Neg (Pos.to_uint p)
  end.

End Z.

