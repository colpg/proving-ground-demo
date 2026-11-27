import Demo.Defs

/-!
# One named statement per problem

A challenge, a negation, a cut's implication and a closing proof are all written from these names.
-/

/-- Exclusive or of two bits has a circuit of at most 4 gates. -/
abbrev Demo.xor2_le_4.Statement : Prop :=
  Demo.HasSize 2 Demo.xor2 4

/-- The conjunction of two bits has a circuit of one gate. -/
abbrev Demo.and2_le_1.Statement : Prop :=
  Demo.HasSize 2 (fun x => x.getD 0 false && x.getD 1 false) 1

/-- The disjunction of three bits has a circuit of two gates. -/
abbrev Demo.or3_le_2.Statement : Prop :=
  Demo.HasSize 3 (fun x => x.getD 0 false || x.getD 1 false || x.getD 2 false) 2

/-- Majority of three bits has a circuit of at most 4 gates. -/
abbrev Demo.maj3_le_4.Statement : Prop :=
  Demo.HasSize 3 Demo.maj3 4

/-- Parity of three bits has a circuit of at most 8 gates. -/
abbrev Demo.par3_le_8.Statement : Prop :=
  Demo.HasSize 3 Demo.par3 8

/-- Running a circuit adds one wire per gate. -/
abbrev Demo.run_length.Statement : Prop :=
  ∀ (gs : List Demo.Gate) (x : List Bool), (Demo.run gs x).length = x.length + gs.length

/-- A size bound stays a size bound when it grows. -/
abbrev Demo.size_mono.Statement : Prop :=
  ∀ (n : Nat) (f : List Bool → Bool) (s t : Nat), s ≤ t → Demo.HasSize n f s → Demo.HasSize n f t

/-- No single gate computes exclusive or of two bits. -/
abbrev Demo.xor2_not_le_1.Statement : Prop :=
  ¬ Demo.HasSize 2 Demo.xor2 1

/-- No circuit of 3 gates computes exclusive or of two bits. -/
abbrev Demo.xor2_not_le_3.Statement : Prop :=
  ¬ Demo.HasSize 2 Demo.xor2 3

/-- The exact size of exclusive or of two bits is 4: four gates are enough and three are not. -/
abbrev Demo.xor2_exact.Statement : Prop :=
  Demo.HasSize 2 Demo.xor2 4 ∧ ¬ Demo.HasSize 2 Demo.xor2 3

/-- Parity of three bits has a circuit of at most 7 gates. -/
abbrev Demo.par3_le_7.Statement : Prop :=
  Demo.HasSize 3 Demo.par3 7
