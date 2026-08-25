# STATE

- **Updated:** 2026-08-25 (Session 4, close)
- **Phase:** 1 — THEOREM
- **Gate:** G1 (open; nothing done yet). **G0 CLOSED 2026-08-25** (Session 4 cold-start test;
  evidence table below).
- **Default branch:** `master`. Remote: `origin` = `https://github.com/Quigles1337/KOBER`
  (**public**; created by Al Session 3; CI = `.github/workflows/check.yml`).
  **ORIENT note (E7):** the constitution's `git symbolic-ref refs/remotes/origin/HEAD` failed
  on this working copy ("not a symbolic ref") until Session 4 ran `git remote set-head origin -a`
  — the repo was `git init`ed and the remote added afterwards, so the local `origin/HEAD` ref was
  never created (fresh `git clone`s get it automatically). If it ever fails again, the
  source-of-truth fallback is `git remote show origin` (prints `HEAD branch: master`); do not
  guess.
- **Build status:** "green" = `scripts/check.sh` passes (lake build on Lean v4.33.1 + cargo test +
  clippy at deny-warnings; ADR-0002; the same script runs in CI). Last verified: 2026-08-25
  local ALL GREEN at `e279df1` (Session 4 ORIENT) **and** CI success on `master` @ `e279df1`
  (run 32609862124) and @ `06beff9` (run 32609707013). Note: STATE's CI line lags the last push
  by one run — check `gh run list -R Quigles1337/KOBER --branch master` at ORIENT.

## Gate G0 — CLOSED 2026-08-25 (Session 4)

| Criterion | Status | Evidence |
|---|---|---|
| CLAIM-0001 resolved to VERIFIED (P0.1) | **done** | CLAIMS.md CLAIM-0001 transition 2026-08-22; SOURCES.md S-0001 (stored PDF + Crossref record with SHA-256s; both digests re-verified by Session 4) |
| R0 enumerated with provenance (P0.3) | **done** | `analysis/R0.md` (R0-agg + R0-named + variants R0a–R0d, damage notation preserved, editions as cited by S-0001); CLAIM-0003 VERIFIED |
| Informal uniqueness theorem stated in CLAIMS (P0.4) | **done** | CLAIM-0004 (constraint corollaries), CLAIM-0005 (exact solution set, \|S\| = 3,794,740 — kernel-checked non-uniqueness), CLAIM-0006 (optimum characterization = the paper's actual claim); "uniqueness from constraints" deliberately NOT claimed (extraction §0/§7) |
| Repo scaffolded and green (P0.5) | **done** | ADR-0001 (Lean v4.33.1 pinned, no Mathlib), ADR-0002 (layout, Rust 1.91.0 pin, `scripts/check.sh` gate, CI activated Session 3); gate ALL GREEN 2026-08-22 and 2026-08-25 |
| SOURCES.md has license notes for every data source touched | **done** | Touched: S-0001 (INGESTED, CC BY-NC-ND 4.0) and S-0004 SigLA (three document pages fetched link-only, CC BY-NC-SA 4.0). Surveyed only: S-0002 (© EFA, terms not established), S-0003 (UNKNOWN), S-0005 (UNKNOWN) — each with the E10 no-ingestion rule. Session 3 left this row "in progress" while its header said "remaining: cold-start test only"; Session 4 resolved the inconsistency to done: nothing touched lacks a license note, and UNKNOWN *is* the E5/E10-mandated record for the unlicensed ones. |
| Cold-start test (§2) | **done** | Session 4 (2026-08-25, no memory of Sessions 1–3) reconstructed the program state from the repo alone in one pass with no guessing (HANDOFF Session 4 entry records the walk). Every state claim checked against reality: gate ALL GREEN, CI green, zero sorry/admit, source SHA-256s match, toolchain pins match ADRs. Four doc defects found and fixed in the closing commit (origin/HEAD note above; SOURCES.md S-0001 stale "private/local"; `scripts/check.sh` stale "CI stand-in" header; the license row above). |

## Gate G1 exit criteria (Phase 1 — THEOREM)

| Criterion | Status | Evidence |
|---|---|---|
| P1.1 — sign inventory, Constraints 1–6, value domains as Lean data conditional on R0 (E2) | open | — |
| P1.2 — CLAIM-0004 PROVEN; CLAIM-0005/0006 exactly as far as the fixed model supports (never strengthened) | open | — |
| P1.3 — variant-conditional proofs (R0b at minimum; R0c "universal C5 → no solutions") with variant-sensitivity reported | open | — |
| P1.4 — `#print axioms` for every theorem pasted into CLAIMS; E3 statement-fidelity diff recorded per entry | open | — |
| Zero sorry repo-wide; default branch green | holds | Session 4 scan (`grep -rn sorry\|admit lean/` → doc comment only) + gate ALL GREEN |
| CLAIMS coherent (no orphan or contradictory entries) | open | — |
| HANDOFF written; cold-start test | open | — |

**Sequencing caveat (recorded, not decided):** CLAIM-0005 (exact \|S\| = 3,794,740) and CLAIM-0006
depend on Phase-2 replication to fix the model (extraction flags A-1..A-3), and a kernel-checked
count of that size needs a certificate strategy (brute-force `decide` over the product domain is
infeasible; `native_decide` adds an axiom E1 forbids). G1 as written may therefore need either a
CLAIMS re-tiering transition (executor, with evidence) or a §2 amendment (ADR — Al). Decide when
P1.2 reaches CLAIM-0005, not before. CLAIM-0004 has no such dependency.

## Blockers

- none

## Standing escalations (awaiting Al)

- none open. (Publication packaging/announcement remains gated at P4.3 regardless of repo
  visibility. The sequencing caveat above becomes an escalation only if it needs a §2 ADR.)

## NEXT-SINGLE-ACTION

**P1.1 — formalize the constraint system as Lean data conditional on R0a**, in `lean/` (file
names below are suggestions; ADR-0001's design guidance governs, and any new ADR-worthy choice
gets an ADR):

1. `lean/Kober/Frac.lean`: a hand-rolled fraction type per ADR-0001 — `Nat` numerator and
   positive denominator, equality and `<`/`≤` by cross-multiplication, decidable instances, with
   `decide`-checked sanity lemmas (no Mathlib).
2. `lean/Kober/R0.lean`: the 12-sign inventory `J, E, F, K, D, B, H, A, L2, L3, L4, L6` and the
   value domains from `analysis/P0.2-constraint-system.md` §5 — the 36-value candidate set for
   A, B, D, H, K **verbatim** (including the printed "1/108, 1/100" order), and the L-series domain
   parameterized so both A-1 readings (unit fractions 1/2…1/320 only, vs. that set plus 5/6, 2/3)
   are expressible without choosing.
3. `lean/Kober/Constraints.lean`: `Assignment := Sign → Frac`; Constraints 1–6 as `Prop`s —
   C1 (J, E, F fixed), C2/C4 over the Table-1 attested combinations (extraction §3), C3
   (economy), C5 from the **printed** relation list only (R0 §4; carry "B > L2" as a separately
   named optional hypothesis per OBS-3), C6 with hl = 1.
4. Done when: `scripts/check.sh` ALL GREEN with zero sorry, the data compiles, and at least one
   `decide`-checked sanity theorem holds (e.g. the 36-value set has 36 pairwise-distinct
   elements, every domain value is < 1). Commit as `[P1][CLAIM-0004] …` with the HANDOFF entry;
   then P1.2 = prove the CLAIM-0004 corollaries. **Watch-out for P1.2:** "L-series < 1/9" needs
   K's *domain* (largest candidate below 1/8 is 1/9), not C1+C5 alone — see HANDOFF Session 4
   BELIEF DELTAS.
