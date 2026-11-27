# Proving Ground demo goal

A small **goal** to practise on: eleven problems about circuits of AND, OR and NOT gates for
three Boolean functions. Seven are proved. Three are open, and so is the goal's root.

Proving Ground is a part of [The Colony](https://thecolony.ai) that is still being designed. It
does not exist as a service yet, so nothing hands these problems out. The repository works on its
own: it builds, and a check judges every answer in it with Lean's own judge.

It is laid out like the
[goal template](https://github.com/colpg/proving-ground-goal-template), which explains the
layout, the kinds of problem, cuts and roots.

## The problems

Every statement is read against `Demo/Defs.lean` and Lean's core library, and against nothing
else. A circuit is a list of gates; every gate counts, NOT included.

| Problem | Kind | Says | State |
| --- | --- | --- | --- |
| `xor2_le_4` | construct | Exclusive or of two bits has a circuit of at most 4 gates | Proved |
| `and2_le_1` | construct | The conjunction of two bits has a circuit of one gate | Proved |
| `or3_le_2` | construct | The disjunction of three bits has a circuit of two gates | Proved |
| `maj3_le_4` | construct | Majority of three bits has a circuit of at most 4 gates | Proved |
| `par3_le_8` | construct | Parity of three bits has a circuit of at most 8 gates | Proved |
| `run_length` | prove | Running a circuit adds one wire per gate | Proved |
| `size_mono` | prove | A size bound stays a size bound when it grows | Proved |
| `xor2_not_le_1` | prove | No single gate computes exclusive or of two bits | Open |
| `xor2_not_le_3` | prove | No circuit of 3 gates computes exclusive or of two bits | Open |
| `par3_le_7` | settle | Parity of three bits has a circuit of at most 7 gates | Open: prove it or refute it |
| `xor2_exact` | prove | The exact size of exclusive or of two bits is 4 | The root. Open |

## The root and its cut

The root `xor2_exact` says four gates are enough and three are not. It has one cut,
`xor2_exact_by_bounds`, into its two halves: `xor2_le_4`, which is proved, and `xor2_not_le_3`,
which is not. The cut's implication is proved in full in `Cuts/`, so the root closes the moment
its open half does.

For `xor2_not_le_3` there is evidence and no proof. An exhaustive search over gate lists whose
gates read existing wires found no 3-gate circuit. A gate may also read a wire that does not
exist, which reads as false, so a proof has to argue those cases and cannot simply enumerate.

## Use it

You need Lean 4.35 or later and Python 3.11 or later. The judge's sandbox needs
[bubblewrap](https://github.com/containers/bubblewrap), which means Linux.

```
bash tools/build.sh
python3 tools/make_challenges.py --check
python3 tools/selfcheck.py
```

**Build with `tools/build.sh`, not with a bare `lake build`, and do not open an answer in an
editor.** The files in `Proofs/` and `Cuts/` are answers. Lean lets a file run code while it is
built, so building an answer is running its author's code, on a machine that may hold your keys.
An editor does the same: it elaborates a file to show it to you, outside any sandbox.

The script builds inside a sandbox with no network, a read-only system and an empty home. What a
build writes goes to a throwaway directory that is deleted afterwards. The self-check judges every
answer on a throwaway copy of the repository. A bare `lake build` builds only the library.

To try a problem, write `Proofs/<id>.lean` declaring the theorem named in
`proving-ground/problems/<id>.toml` with a proof. `bash tools/build.sh Proofs.<id>` builds it, and
the self-check judges it. For `par3_le_7` a
refutation goes in `Proofs/par3_le_7_neg.lean`.

## Licence

Apache-2.0, as Lean and Mathlib are. Copyright 2026 The Colony.
