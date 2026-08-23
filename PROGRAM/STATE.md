# STATE

- **Updated:** 2026-08-22 (Session 3, close)
- **Phase:** 0 — FOUNDATION
- **Gate:** G0 (open; remaining: **cold-start test only**)
- **Default branch:** `master`. Remote: `origin` = `https://github.com/Quigles1337/KOBER`
  (**public**; created by Al, wired Session 3; CI = `.github/workflows/check.yml`)
- **Build status:** "green" = `scripts/check.sh` passes (lake build on Lean v4.33.1 + cargo test +
  clippy at deny-warnings; ADR-0002). Last verified: 2026-08-22 local ALL GREEN **and** CI
  success on `master` @ `06beff9` (run 32609707013, 44 s; run 1 failed for a diagnosed non-billing
  reason — elan cwd resolution — fixed same session).

## Gate G0 exit criteria

| Criterion | Status | Evidence |
|---|---|---|
| CLAIM-0001 resolved to VERIFIED (P0.1) | **done** | CLAIMS.md CLAIM-0001 transition 2026-08-22; SOURCES.md S-0001 (stored PDF + Crossref record with SHA-256s) |
| R0 enumerated with provenance (P0.3) | **done** | `analysis/R0.md` (R0-agg + R0-named + variants R0a–R0d, damage notation preserved, editions as cited by S-0001); CLAIM-0003 VERIFIED |
| Informal uniqueness theorem stated in CLAIMS (P0.4) | **done** | CLAIM-0004 (constraint corollaries), CLAIM-0005 (exact solution set, |S| = 3,794,740 — kernel-checked non-uniqueness), CLAIM-0006 (optimum characterization = the paper's actual claim); scoping per CLAIM-0002/extraction §7 — "uniqueness from constraints" deliberately NOT claimed |
| Repo scaffolded and green (P0.5: Lean project, Rust workspace, ADR-0001 toolchain pin, CI decision) | **done** | ADR-0001 (Lean v4.33.1 pinned, no Mathlib), ADR-0002 (layout, Rust 1.91.0 pin, CI deferred to remote-day, `scripts/check.sh` gate); gate run ALL GREEN 2026-08-22 |
| SOURCES.md has license notes for every data source touched | in progress | S-0001 ingested with license (CC BY-NC-ND 4.0). P0.6 survey done: S-0002 GORILA (print, (c) EFA), S-0003 Younger (host dead, license UNKNOWN), S-0004 SigLA (live, CC BY-NC-SA 4.0), S-0005 lineara.xyz (live, license UNKNOWN) |
| Cold-start test (§2) | open | — |

## Blockers

- none

## Standing escalations (awaiting Al)

- none open. (Remote hosting: **resolved 2026-08-22** — Al created
  `https://github.com/Quigles1337/KOBER`, public; see ADR-0000 addendum. Publication
  *packaging/announcement* remains gated at P4.3 regardless of repo visibility.)

## NEXT-SINGLE-ACTION

Run the **cold-start test** (§2) — the last open G0 criterion. By design it must be executed by
a session with no conversational memory of Sessions 1–3, so it is the FIRST act of the next
fresh session: perform §4.1 ORIENT strictly from the repo (git facts → this file → HANDOFF last
entry → CLAIMS skim → DECISIONS → run `scripts/check.sh`), noting any point where
reconstruction required guessing. If none: record the walk as evidence in HANDOFF, mark the
criterion done, flip Gate **G0 → CLOSED** here, and open **Phase 1** with NEXT-SINGLE-ACTION =
P1.1 (formalize the sign inventory, Constraints 1–6, and the value domains as Lean data
conditional on R0a, targeting CLAIM-0004 first). If guessing was needed: fix the documentation
first — the gate is not passed by working code with unreconstructable context (§2).
