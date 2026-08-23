# STATE

- **Updated:** 2026-08-22 (Session 2, close)
- **Phase:** 0 — FOUNDATION
- **Gate:** G0 (open; remaining: P0.3, P0.4, cold-start test)
- **Default branch:** `master`. Remote: `origin` = `https://github.com/Quigles1337/KOBER`
  (**public**; created by Al, wired Session 3; CI = `.github/workflows/check.yml`)
- **Build status:** "green" = `scripts/check.sh` passes (lake build on Lean v4.33.1 + cargo test +
  clippy at deny-warnings; ADR-0002). Last verified: 2026-08-22, ALL GREEN.

## Gate G0 exit criteria

| Criterion | Status | Evidence |
|---|---|---|
| CLAIM-0001 resolved to VERIFIED (P0.1) | **done** | CLAIMS.md CLAIM-0001 transition 2026-08-22; SOURCES.md S-0001 (stored PDF + Crossref record with SHA-256s) |
| R0 enumerated with provenance (P0.3) | open | — |
| Informal uniqueness theorem stated in CLAIMS (P0.4) | open — **P0.2 prerequisite done** | Extraction `analysis/P0.2-constraint-system.md`; CLAIM-0002 (the paper claims optimality-characterization, NOT uniqueness — E3 anchor: scope P0.4 accordingly) |
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

P0.3 — Enumerate reading set R0 into `analysis/R0.md`, starting from the document roster in
`analysis/P0.2-constraint-system.md` §1. For each document: ID; role in the constraint system;
the reading as the paper uses it (verbatim, preserving damage notation — dotted letters,
brackets); the edition the paper cites for it (GORILA volume per its References, p. 13–14, or
the later publication); an independent transcription-source pointer where one exists (SigLA
entry URL — S-0004 is CC BY-NC-SA 4.0, but ingest nothing yet, links only); and damage/
restoration flags (E4). Enumerate variants explicitly, at minimum: R0a = the paper's readings
(incl. KH 86.2 = A A) vs R0b = GORILA's KH 86.2 = A B B; also record the flagged doubts
(HT 123a.3–4 / ZA 8.4 possible E J; PH 7b.3) as variant axes or documented exclusions. Seed a
CLAIMS entry for R0's identity/provenance. This is scholarship work — E5 applies to every
edition attribution: cite only what is retrieved or already stored (the paper's own References
pages are in the stored PDF and are citable as "as cited by S-0001").
