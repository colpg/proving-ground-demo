import Demo.Statements

theorem Demo.run_length : Demo.run_length.Statement := by
  intro gs
  induction gs with
  | nil => intro x; simp [Demo.run]
  | cons g gs ih =>
    intro x
    have h := ih (x ++ [g.eval x])
    simp only [Demo.run, List.foldl_cons] at h ⊢
    rw [h]
    simp
    omega
