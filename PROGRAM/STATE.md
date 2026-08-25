# STATE

- **Updated:** 2026-08-25 (Session 5, close)
- **Phase:** 0 — FOUNDATION
- **Gate:** G0 **REOPENED 2026-08-25 by the architects** — the Session-4 cold-start pass is
  **WITHDRAWN** (see the cold-start row below). Remaining for G0: the cold-start test, run by a
  session that is actually cold (protocol in NEXT-SINGLE-ACTION). Session-4 work product and its
  documentation fixes stand; only the certification lapsed.
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
  local ALL GREEN at `0e1ac18` (Session 5 ORIENT) **and** CI success on `master` @ `0e1ac18`
  (run 32879934732, 10 steps). Note: STATE's CI line lags the last push by one run — check
  `gh run list -R Quigles1337/KOBER --branch master` at ORIENT.

## Memory policy (ratified by the architects 2026-08-25; ADR text owed AFTER the exam)

Ratified for KOBER by the architects' Session-5 prompt: the executor memory discipline adopted by
the sibling program (FR13DMAN `PROGRAM/DECISIONS/ADR-0003.md`, ratified there 2026-08-25) —
**D1** executor memories hold environment/tooling hazards and the repo *location* only, never
program state (phase, gate status, CLAIM statuses, file contents, commit SHAs as state markers,
next actions, escalations); **D2** any session attempting a gate's cold-start test reproduces
every recalled memory verbatim as the first entry of its HANDOFF block (unrelated private
programs disclosed by count and withheld), and the exam counts only if no recalled memory holds
program state; **D3** no memory writes during an exam session — **plus the corollary**, quoted
from the architects: *"a session in the builder's conversation context is not cold regardless of
memory, extended to cover prompts written by the architects."* Executor reading of the extension,
to be pinned by the ADR (Al corrects if wrong): the launching prompt is a memory channel whoever
writes it; a cold session is launched with the §6 "Session N — resume" prompt verbatim and
nothing that carries program state. **Standing order:** the session after the exam passes drafts
this as **ADR-0003** (number reserved) — not before (architects' sequencing).

## Gate G0 exit criteria

| Criterion | Status | Evidence |
|---|---|---|
| CLAIM-0001 resolved to VERIFIED (P0.1) | **done** | CLAIMS.md CLAIM-0001 transition 2026-08-22; SOURCES.md S-0001 (stored PDF + Crossref record with SHA-256s; digests re-verified 2026-08-25) |
| R0 enumerated with provenance (P0.3) | **done** | `analysis/R0.md` (R0-agg + R0-named + variants R0a–R0d, damage notation preserved, editions as cited by S-0001); CLAIM-0003 VERIFIED |
| Informal uniqueness theorem stated in CLAIMS (P0.4) | **done** | CLAIM-0004 (constraint corollaries), CLAIM-0005 (exact solution set, \|S\| = 3,794,740 — kernel-checked non-uniqueness), CLAIM-0006 (optimum characterization = the paper's actual claim); "uniqueness from constraints" deliberately NOT claimed (extraction §0/§7) |
| Repo scaffolded and green (P0.5) | **done** | ADR-0001 (Lean v4.33.1 pinned, no Mathlib), ADR-0002 (layout, Rust 1.91.0 pin, `scripts/check.sh` gate, CI activated Session 3); gate ALL GREEN 2026-08-22 and 2026-08-25 (×2) |
| SOURCES.md has license notes for every data source touched | **done** | Touched: S-0001 (INGESTED, CC BY-NC-ND 4.0) and S-0004 SigLA (three document pages fetched link-only, CC BY-NC-SA 4.0). Surveyed only: S-0002 (© EFA, terms not established), S-0003 (UNKNOWN), S-0005 (UNKNOWN) — each with the E10 no-ingestion rule. Resolved to done by Session 4 (reasoning: nothing touched lacks a license note; UNKNOWN *is* the E5/E10-mandated record). |
| Cold-start test (§2) | **open — Session-4 pass WITHDRAWN 2026-08-25** | Withdrawn by the architects: the executor memory store held program state at the time (claims, R0 variants, toolchain versions, phase targets — the recalled index line alone carried "Sessions 1–3 ran … next FIRST act: the G0 cold-start test"), so a cold reconstruction was not demonstrated (HANDOFF Session 5, D2 disclosure). The store has since been purged of program state by the architects. Session 5 was instructed to re-run the exam and **DISQUALIFIED itself**: it ran in the conversation context that built Session 4's state (ratified corollary). Session 4's walk and its four doc fixes remain useful evidence that the docs *can* be walked, not that they were walked cold. |

## Gate G1 exit criteria (pre-staged; Phase 1 opens only when G0 closes)

| Criterion | Status | Evidence |
|---|---|---|
| P1.1 — sign inventory, Constraints 1–6, value domains as Lean data conditional on R0 (E2) | open | — |
| P1.2 — CLAIM-0004 PROVEN; CLAIM-0005/0006 exactly as far as the fixed model supports (never strengthened) | open | — |
| P1.3 — variant-conditional proofs (R0b at minimum; R0c "universal C5 → no solutions") with variant-sensitivity reported | open | — |
| P1.4 — `#print axioms` for every theorem pasted into CLAIMS; E3 statement-fidelity diff recorded per entry | open | — |
| Zero sorry repo-wide; default branch green | holds | Session 4/5 scans (`grep -rn sorry\|admit lean/` → doc comment only) + gate ALL GREEN |
| CLAIMS coherent (no orphan or contradictory entries) | open | — |
| HANDOFF written; cold-start test | open | — |

**Sequencing caveat (recorded, not decided):** CLAIM-0005 (exact \|S\| = 3,794,740) and CLAIM-0006
depend on Phase-2 replication to fix the model (extraction flags A-1..A-3), and a kernel-checked
count of that size needs a certificate strategy (brute-force `decide` over the product domain is
infeasible; `native_decide` adds an axiom E1 forbids). G1 as written may therefore need either a
CLAIMS re-tiering transition (executor, with evidence) or a §2 amendment (ADR — Al). Decide when
P1.2 reaches CLAIM-0005, not before. CLAIM-0004 has no such dependency.

## Blockers

- **G0 cannot be closed from any session that is not cold** (ratified corollary). The exam needs
  a fresh conversation launched by the architects under the protocol below. Nothing else blocks.

## Standing escalations (awaiting Al)

- **Pre-exam purge residue (Al, on the machine):** the executor memory store still contains
  pre-purge backups holding program state — `project_kober.md.bak`, `MEMORY.md.bak`,
  `project_friedman.md.bak` in the memory directory (observed 2026-08-25, Session 5). They are
  not indexed, but they carry `name:` frontmatter identical to the live files and could be
  recalled or read. Session 5 did not delete them (not its files; D3 forbids memory writes in an
  exam-attempt session). Recommend deleting them before the exam session is launched.
- Publication packaging/announcement remains gated at P4.3 regardless of repo visibility.

## NEXT-SINGLE-ACTION

**Run the G0 cold-start test (§2) — in a session that is cold.** Launch conditions (architects):
a **fresh conversation** (no prior turns), the executor memory store purged of KOBER program
state (and the `.bak` residue above removed), launched with the constitution's §6 "Session N —
resume" prompt **verbatim** and nothing else. The exam session then, in order:

1. **Self-check before acting.** As the first entry of its HANDOFF block: (a) the launching
   prompt it received, verbatim; (b) every recalled memory verbatim (KOBER and sibling lines),
   unrelated private programs by count (D2); (c) whether the conversation contains any turn
   before the launching prompt. If any recalled memory holds program state, or the prompt carries
   program state beyond §6's text, or prior turns exist → record **DISQUALIFIED**, commit the
   HANDOFF entry, stop. No memory writes at any point (D3).
2. **The walk.** §4.1 ORIENT strictly from the repo — git facts → this file → HANDOFF last entry
   → CLAIMS skim → DECISIONS → `scripts/check.sh` — noting every point where reconstruction
   required a guess.
3. **On PASS** (no guessing): record the walk in HANDOFF, mark the cold-start row done, flip
   Gate **G0 → CLOSED**, open **Phase 1** with NEXT-SINGLE-ACTION = **P1.1** as staged below,
   and note that the session after it owes the memory-policy ADR-0003 draft (standing order
   above). **On guessing:** fix the documentation first — the gate is not passed by working code
   with unreconstructable context (§2).

**Staged P1.1 (becomes NEXT-SINGLE-ACTION when G0 closes):** formalize the constraint system as
Lean data conditional on R0a, in `lean/` (file names are suggestions; ADR-0001's design guidance
governs; any ADR-worthy choice gets an ADR): (1) `lean/Kober/Frac.lean` — hand-rolled fraction
type (`Nat` numerator, positive denominator, `=`/`<`/`≤` by cross-multiplication, decidable
instances, `decide`-checked sanity lemmas; no Mathlib); (2) `lean/Kober/R0.lean` — the 12-sign
inventory `J, E, F, K, D, B, H, A, L2, L3, L4, L6` and the value domains from
`analysis/P0.2-constraint-system.md` §5, the 36-value candidate set for A, B, D, H, K
**verbatim** (including the printed "1/108, 1/100" order), the L-series domain parameterized so
both A-1 readings are expressible without choosing; (3) `lean/Kober/Constraints.lean` —
`Assignment := Sign → Frac`, Constraints 1–6 as `Prop`s (C1 fixes J, E, F; C2/C4 over the
Table-1 attested combinations, extraction §3; C3 economy; C5 from the **printed** relation list
only, "B > L2" as a separately named optional hypothesis per OBS-3; C6 with hl = 1); (4) done
when `scripts/check.sh` is ALL GREEN with zero sorry and at least one `decide`-checked sanity
theorem holds. Commit `[P1][CLAIM-0004] …`; then P1.2 proves the CLAIM-0004 corollaries.
Watch-out: "L-series < 1/9" needs K's *domain* (largest candidate below 1/8 is 1/9), not
C1+C5 alone (HANDOFF Session 4, BELIEF DELTAS).
