import Demo.Statements

theorem Demo.size_mono : Demo.size_mono.Statement := by
  intro n f s t hst h
  obtain ⟨gs, out, hlen, hc⟩ := h
  exact ⟨gs, out, Nat.le_trans hlen hst, hc⟩
