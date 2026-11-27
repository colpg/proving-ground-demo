import Demo.Statements

/-- Four gates are enough, and three are not: together that is the exact size. -/
theorem Demo.xor2_exact_by_bounds (h1 : Demo.xor2_le_4.Statement) (h2 : Demo.xor2_not_le_3.Statement) :
    Demo.xor2_exact.Statement :=
  ⟨h1, h2⟩
