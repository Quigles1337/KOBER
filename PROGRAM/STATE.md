# STATE

- **Updated:** 2026-08-22 (Session 1, close)
- **Phase:** 0 — FOUNDATION
- **Gate:** G0 (open)
- **Default branch:** `master` (discovered via `git symbolic-ref HEAD` at init; no remote exists)
- **Build status:** no build targets exist yet (Lean/Rust scaffold is P0.5). "Green" currently means:
  working tree clean, all state files committed.

## Gate G0 exit criteria

| Criterion | Status | Evidence |
|---|---|---|
| CLAIM-0001 resolved to VERIFIED (P0.1) | **done** | CLAIMS.md CLAIM-0001 transition 2026-08-22; SOURCES.md S-0001 (stored PDF + Crossref record with SHA-256s) |
| R0 enumerated with provenance (P0.3) | open | — |
| Informal uniqueness theorem stated in CLAIMS (P0.4) | open — **P0.2 prerequisite done** | Extraction `analysis/P0.2-constraint-system.md`; CLAIM-0002 (the paper claims optimality-characterization, NOT uniqueness — E3 anchor: scope P0.4 accordingly) |
| Repo scaffolded and green (P0.5: Lean project, Rust workspace, ADR-0001 toolchain pin, CI decision) | open | — |
| SOURCES.md has license notes for every data source touched | in progress | S-0001 ingested with license (CC BY-NC-ND 4.0). P0.6 survey done: S-0002 GORILA (print, (c) EFA), S-0003 Younger (host dead, license UNKNOWN), S-0004 SigLA (live, CC BY-NC-SA 4.0), S-0005 lineara.xyz (live, license UNKNOWN) |
| Cold-start test (§2) | open | — |

## Blockers

- none

## Standing escalations (awaiting Al)

- **Remote hosting.** Repo is local-only at `C:\Users\LEET\KOBER`. Creating a GitHub remote is an
  account action → Al's call (§4.6, ADR-0000). Suggested default if approved: private repo, never
  public without the §4.6 publication escalation.

## NEXT-SINGLE-ACTION

P0.2 — Extract the constraint system from the stored version of record
(`sources/corazza-etal-2021-jas-105214.pdf`, SHA-256 in S-0001): enumerate (a) the
tablets/documents used, (b) the summation lines, (c) the fraction-sign inventory, (d) the
candidate value assignments considered, (e) the exact uniqueness/optimality claim *as the authors
state it* — into `analysis/P0.2-constraint-system.md` with page-anchored quotes; then seed the
corresponding informal-claim entry in CLAIMS.md (this feeds P0.4). Tooling prerequisite discovered
in Session 1: poppler is NOT installed (`pdftoppm` missing), so the Read tool cannot render PDF
pages — first install poppler (winget/choco/scoop) or use Python + pypdf for text extraction, and
sanity-check the extraction against the byte-grep facts recorded in S-0001.
