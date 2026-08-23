# HANDOFF — append-only session log

Schema: §4.5 of the constitution. Entries are appended, newest last, and never edited after the
session that wrote them ends.

---

```
SESSION: 2026-08-22 @ c9a3f65 (Session 1; the commit adding this entry + the STATE update lands
  immediately on top of c9a3f65)
PHASE / GATE: Phase 0 — FOUNDATION; Gate G0 open. Criteria moved: CLAIM-0001 done; license-notes
  in progress. Still open: R0 (P0.3), informal theorem (P0.4), scaffold (P0.5), cold-start test.
ADVANCED:
- Bootstrap: repo created at C:\Users\LEET\KOBER (ADR-0000; default branch discovered as
  'master'), constitution committed verbatim from the session paste, registers seeded (e3ec346);
  LF determinism pinned via .gitattributes after CRLF warnings (756fd9e).
- P0.1: CLAIM-0001 UNKNOWN -> VERIFIED (5f98231). Corazza, Ferrara, Montecchi, Tamburini &
  Valério, "The mathematical values of fraction signs in the Linear A script: A computational,
  statistical and typological approach", Journal of Archaeological Science 125 (2021) 105214,
  DOI 10.1016/j.jas.2020.105214. VOR PDF + exact-DOI Crossref record stored and SHA-256'd
  (S-0001).
- P0.6: four candidate sources surveyed with retrieval evidence (c9a3f65): S-0002 GORILA,
  S-0003 Younger, S-0004 SigLA, S-0005 lineara.xyz.
BELIEF DELTAS:
- The constitution's memory-belief about the paper was fully correct (all five authors, topic);
  what retrieval added: JAS 125 (2021) art. 105214, online 2020-09-06, VOR license CC BY-NC-ND
  4.0. Evidence: S-0001, three-way concordant (Crossref search, stored exact-DOI Crossref JSON,
  PDF embedded metadata).
- The paper's own keyword block includes "Constraint programming" — the authors themselves model
  the problem as constraints, which is exactly the shape P1 will formalize. Evidence: byte-grep
  of the stored PDF (S-0001).
- Younger's KU site is not merely stale: the host people.ku.edu no longer resolves at all
  (ENOTFOUND). The R0-source landscape tilts toward SigLA, which is live and explicitly
  CC BY-NC-SA 4.0. Evidence: S-0003, S-0004.
- Programmatic-retrieval reality on this machine: ScienceDirect and academia.edu 403 tools;
  Crossref API and institutional repositories (unifi FLORE) work fine. Plan future retrievals
  accordingly.
CONFUSIONS:
- The constitution arrived as a session-prompt paste, not a file on disk; §6's "move/copy this
  file" was satisfied by a verbatim write + provenance note (ADR-0000). Cost: none. Successor: if
  Al produces an original file, diff it against the committed copy.
- `file` reported the stored 2.67 MB PDF as "1 page(s)" — a linearized-PDF heuristic artifact,
  not a page count. Cost: a moment of doubt. Doc fix: noted in S-0001 so nobody re-panics.
HONESTY CHECK: CLAIM-0001 re-examined at close — no downgrade needed; evidence is concordant
  across three independent retrievals. SigLA coverage numbers and the Younger-moved-to-academia
  story are deliberately recorded as reported-not-verified in S-0004/S-0003 rather than as facts.
DRIFT CHECK: clean. Session was infra + bibliography verification; no sound values anywhere.
  S-0003 carries an explicit §0.2 note: Younger transliterations, if ever used, are sign-identity
  labels only, never phonetic claims.
NEXT-SINGLE-ACTION: P0.2 — extract the constraint system from the stored VOR
  (sources/corazza-etal-2021-jas-105214.pdf, SHA in S-0001) into
  analysis/P0.2-constraint-system.md with page-anchored quotes: (a) tablets used, (b) summation
  lines, (c) fraction-sign inventory, (d) candidate assignments, (e) the exact
  uniqueness/optimality claim as stated; then seed the corresponding informal CLAIMS entry
  (feeds P0.4). Prerequisite: poppler is NOT installed (pdftoppm missing; Read cannot render PDF
  pages) — install poppler (winget/choco/scoop) or use Python + pypdf text extraction; verify the
  extraction against S-0001's byte-grep facts.
ESCALATIONS:
- Remote hosting: repo is local-only; creating a GitHub remote is an account action — Al's call
  (ADR-0000, STATE.md standing escalation).
- None on licenses yet; lineara.xyz ingestion (if ever wanted) needs author/terms discovery ->
  would become an escalation then.
STOP-REASON: natural boundary — bootstrap + P0.1 + P0.6 complete, default branch green at every
  commit; P0.2 (deep read of the paper) deserves a fresh session with extraction tooling in
  place.
```

---

```
SESSION: 2026-08-22 @ dfcb8de + scaffold commit (Session 2; the commit adding this entry lands
  on top)
PHASE / GATE: Phase 0 — FOUNDATION; Gate G0 open. Now done: CLAIM-0001 (S1), P0.2 extraction,
  P0.5 scaffold. Remaining for G0: P0.3 (R0), P0.4 (informal theorem), cold-start test.
ADVANCED:
- P0.2 (dfcb8de): full extraction of the constraint system into
  analysis/P0.2-constraint-system.md — 6 constraints (verbatim), 12 CP variables, 36-value
  candidate set, 4 goodness measures with the Tables-6/7 worked-example semantics, complete
  document roster with roles/exclusions, Simulation counts. CLAIM-0002 created VERIFIED.
- P0.5 (this commit): Lean project lean/ pinned v4.33.1 no-Mathlib (ADR-0001), Rust workspace
  engine/ pinned 1.91.0 edition-2024 (ADR-0002), scripts/check.sh local gate; first run ALL
  GREEN (lake build + 1/1 cargo test + clippy -D warnings).
BELIEF DELTAS:
- THE BIG ONE (E3): the paper does NOT claim uniqueness. Constraints 1–6 alone admit 3,794,740
  solutions ("severely underconstrained", p. 6); the headline values are a conditional
  optimality characterization (p. 8 "simple hypothesis"), with H = 1/16, A = 1/24 explicitly
  "tentative". P0.4 must be scoped as solution-set/optimum characterization, never
  "constraints force unique values". Evidence: extraction §0/§7.
- The paper ships NO code or data supplement; MiniZinc + Gecode named but the model must be
  rebuilt from prose. Three genuine model ambiguities recorded (A-1 L-series domain, A-2 soft
  bounds, A-3 G_Optimal denominator grid) plus six internal-text observations (OBS-1..6,
  incl. Table 4's J=138 vs 137 elsewhere, and a ≤/≥ tension at p. 8). These make the published
  counts (2,172,836 / 3,794,740 / 0.67094 / …) the golden targets for Phase-2 replication.
- KH 86.2 is an editorial variant taken by the authors themselves (A A vs GORILA's A B B,
  Table 1 caption) — first confirmed R0a/R0b axis.
- Machine: winget source is broken (InternetOpenUrl failure) — poppler came from the
  oschwartz10612/poppler-windows GitHub release instead, now at C:\Users\LEET\tools\
  poppler-26.02.0 and on user PATH (future sessions can Read PDFs directly; this session used
  absolute paths). Current Lean stable v4.33.1 was already installed; gate is fast (~30 s).
CONFUSIONS:
- The constitution's §P0.2 phrase "summation-line constraint system" misdescribes the paper:
  only HT 104 is a summation; the system is six structural premises over attestation data, and
  the paper itself says no LA totals inscription is problem-free. Cost: none (caught during
  extraction). Doc fix: extraction §0 + §2 states this loudly; P0.4 must not import the phrase.
- pdftotext interleaves the two-column tables; Tables 1/2/4 and Appendices B–C had to be
  verified on page renders. Doc fix: extraction header names which tables were
  render-verified, so successors trust the right layer.
HONESTY CHECK: CLAIM-0001 unchanged (evidence still concordant). CLAIM-0002 written with the
  paper's own hedges preserved (tentative H/A; underconstrainedness) rather than the stronger
  claim a careless reading would produce. Extraction separates verbatim quotes from executor
  inference throughout; OBS-1..6 are framed as replication targets, not errors asserted.
DRIFT CHECK: clean. Everything this session is about mathematical values of fraction signs and
  infrastructure — zero sound-value content. The §7 logical-form analysis exists precisely to
  keep P1 from overclaiming.
NEXT-SINGLE-ACTION: (see STATE.md — P0.3, enumerate R0 with per-document provenance, damage
  flags, and explicit R0a/R0b variants, starting from extraction §1.)
ESCALATIONS:
- Remote hosting still open (ADR-0000; STATE standing escalation). CI wiring waits on it
  (ADR-0002).
STOP-REASON: natural boundary — extraction + scaffold complete, gate ALL GREEN; P0.3 is a
  fresh-session scholarship task.
```
