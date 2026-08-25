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

---

```
SESSION: 2026-08-22 @ 06beff9 + this commit (Session 3)
PHASE / GATE: Phase 0 — FOUNDATION; Gate G0 open, remaining: cold-start test ONLY (by design a
  fresh session runs it — see NEXT-SINGLE-ACTION).
ADVANCED:
- Remote wired (70525f9): Al created github.com/Quigles1337/KOBER (PUBLIC, was empty) — the
  ADR-0000 standing escalation is RESOLVED (addendum written). origin/master pushed with full
  history intact; content audited pre-push (no secrets; S-0001 PDF redistribution compliant
  under CC BY-NC-ND with SOURCES.md attribution).
- CI wired per ADR-0002's activation clause (70525f9) and fixed (06beff9): run 1 failed in 9 s
  for a REAL reason (all 10 steps executed — NOT the machine's billing signature): the elan
  shim resolves lean-toolchain from cwd, and `lake --dir` from repo root found none. Gate now
  cds into lean/ and prints the resolved Lean version. Run 2: SUCCESS in 44 s
  (run 32609707013). E9 now enforced locally and in CI.
- P0.3 (this commit): analysis/R0.md — R0-agg + R0-named (~26 documents, damage notation
  verbatim, editions as cited by S-0001) + variants R0a/R0b/R0c/R0d with consequence analyses.
  CLAIM-0003 VERIFIED.
- P0.4 (this commit): three-tier informal theorem statements — CLAIM-0004 (constraint-layer
  corollaries), CLAIM-0005 (exact solution set, |S| = 3,794,740 = kernel-checked
  NON-uniqueness), CLAIM-0006 (optimum characterization = the paper's actual claim). All
  UNKNOWN = P1 targets; "uniqueness from constraints" deliberately not claimed anywhere.
BELIEF DELTAS:
- The repo is PUBLIC (Al's owner decision at creation). Program consequence: none for content
  discipline (nothing secret was ever committed), but P4.3's packaging/announcement escalation
  still stands.
- elan toolchain resolution is cwd-anchored; `lake --dir` does NOT anchor it. Evidence: CI run
  1 log ("no default toolchain configured") vs run 2 green after the cd fix. The gate printing
  `lean --version` is now the standing proof the pin is what actually runs.
- SigLA addresses documents as https://sigla.phis.me/document/<ID with space>/ — verified for
  HT 104, KH 86, ZA 11a. KH 86 lists fractions as GORILA-style numbers (A701/702/704/707):
  the letter↔A7xx concordance is a P2.2 prerequisite. ZA 11a's SigLA sign list showed NO
  fraction signs while the paper (via GORILA) reads L L2 at ZA 11a.4 — first live specimen of
  transcription-source divergence, recorded UNRESOLVED in R0 §4/§6. Do not repeat it as a
  finding; it is a to-adjudicate.
- The 9-second CI failure had 10 executed steps — the billing gotcha (0-step jobs) did NOT
  recur. Lesson: check step counts before pattern-matching to billing.
CONFUSIONS:
- I assumed `lake --dir` was equivalent to running in the project dir. It is for lake's own
  build, but NOT for elan's toolchain resolution. Cost: one red CI run. Doc fix: comment in
  scripts/check.sh + this entry.
HONESTY CHECK: CLAIM-0005 carries its own downgrade path in the statement (if no reasonable
  domain disambiguation reproduces the published count, the discrepancy is the registered
  result). R0b's "solution set unchanged" prediction is labeled executor-inference with the
  domain argument sketched, awaiting machine check (P1.3). ZA 11a recorded as unresolved
  tension, not as "SigLA contradicts GORILA".
DRIFT CHECK: clean. R0 and the claim tiers are values-and-structure only; CLAIM-0006 exists
  precisely to pin the formal target to what the paper supports and no more.
NEXT-SINGLE-ACTION: (see STATE.md — the cold-start test, first act of the next fresh session;
  on pass: close G0, open Phase 1 at P1.1.)
ESCALATIONS: none open. (Remote resolved this session; publication packaging remains a future
  P4.3 escalation by rule.)
STOP-REASON: natural boundary — G0's sole remaining criterion is, by its own definition, a task
  for a cold successor. Repo green locally and in CI.
```

---

```
SESSION: 2026-08-25 @ e279df1 + this commit (Session 4 — the cold-start session)
PHASE / GATE: Phase 0 → **Gate G0 CLOSED** this session. Phase 1 — THEOREM opened; Gate G1
  open, nothing done yet.
ADVANCED:
- Cold-start test (§2) executed as the FIRST act of a session with no memory of Sessions 1–3:
  §4.1 ORIENT strictly from the repo — git facts → STATE → HANDOFF → CLAIMS → ADR-0000/1/2 →
  SOURCES → analysis/R0.md + P0.2 extraction → `scripts/check.sh`. Result: ALL GREEN locally
  at e279df1 (Lean 4.33.1 build, 1/1 cargo test, clippy -D warnings); CI success on master at
  e279df1 (run 32609862124) as well as 06beff9; zero sorry/admit in lean/ (only the doc
  comment matches); both stored-source SHA-256s reproduce SOURCES.md; elan 4.2.3 / Rust
  1.91.0 match the ADRs. No point in the walk required a guess. Verdict: PASS.
- Four documentation defects a cold successor would hit, fixed in this commit: (1) the
  constitution §4.1 command `git symbolic-ref refs/remotes/origin/HEAD` failed ("not a
  symbolic ref") on this working copy — `git remote set-head origin -a` run (local, untracked)
  and the source-of-truth fallback (`git remote show origin`) recorded in STATE; (2) SOURCES.md
  S-0001 still said the repo was private/local — struck through with a dated pointer to
  ADR-0000's public-repo compliance audit; (3) scripts/check.sh header still called itself a
  CI stand-in; (4) STATE's G0 table had the license criterion "in progress" against a header
  saying only cold-start remained — resolved to done, with the reasoning in the row.
- STATE: G0 flipped CLOSED with the full evidence table; Phase 1 opened with the G1 criteria
  table, a recorded sequencing caveat, and NEXT-SINGLE-ACTION = P1.1 spelled out to the file
  level. No CLAIMS transitions this session (none were earned).
BELIEF DELTAS:
- CLAIM-0004's "L-series < 1/9" is a *domain* corollary, not a C1+C5 corollary: C1+C5 give
  only L4 < L2 < K < F = 1/8; the 1/9 bound needs K ∈ the 36-value candidate set (largest
  candidate below 1/8 is 1/9, so K ≤ 1/9 and L2 < 1/9). The paper's "Constraints 1 and 5
  imply … smaller than 1/9" (p. 5) is loose. CLAIM-0004's hypotheses already include the
  domains, so the register is correctly scoped — but the P1.2 proof must import the K domain
  explicitly. Evidence: extraction §5 domain list against the printed C5 chain.
- A cold `git clone` gets origin/HEAD for free; only this init-then-add-remote working copy
  lacked it. The constitution's command is sound for successors on fresh clones, and now here.
- STATE's CI evidence lags the last push by one run (Session 3 wrote STATE before e279df1's
  run finished; it later succeeded). Successors: `gh run list` at ORIENT, not STATE, is the
  CI evidence.
CONFUSIONS:
- Momentary: whether "not a symbolic ref" meant the remote lacked a default branch. It meant
  the local ref was never created. Cost: one extra command. Doc fix: STATE ORIENT note.
- The G0 license row vs. header inconsistency. Cost: a re-read of all five SOURCES entries to
  adjudicate. Doc fix: the row now carries its reasoning so it cannot be re-litigated.
HONESTY CHECK: re-read CLAIM-0001..0006 cold. No downgrades. CLAIM-0004 scoping confirmed
  correct (delta 1). CLAIM-0003's R0b arithmetic re-derived by hand (A < 1/2 → A ≤ 1/3 in the
  domain; B < 1/4 → B ≤ 1/5; max A + 2B = 11/15 < 1): holds. The CLAIM-0005/0006 sequencing
  problem is recorded under ESCALATIONS rather than silently re-tiered.
DRIFT CHECK: clean. Session was gate verification and documentation; zero sound values, zero
  new claims about what any tablet says.
NEXT-SINGLE-ACTION: (see STATE.md — P1.1, formalize the constraint system as Lean data
  conditional on R0a; file-level spec there.)
ESCALATIONS:
- None blocking. Heads-up for a possible later ADR (Al's call under §4.6 "constitution
  amendments"): CLAIM-0005 and CLAIM-0006 are registered as P1 targets but depend on Phase-2
  replication to fix the model (flags A-1..A-3), and a kernel-checked |S| = 3,794,740 needs a
  certificate strategy (brute-force `decide` infeasible; `native_decide` adds an axiom E1
  forbids). Gate G1 "all Phase-1 claims PROVEN" may therefore need a CLAIMS re-tiering
  transition (executor, with evidence) or a §2 amendment (ADR — Al). Decide when P1.2
  reaches CLAIM-0005, not before.
STOP-REASON: gate reached (G0 CLOSED) — §4.6 stop condition. Repo green locally at this
  commit; its CI run is checked at the next ORIENT (STATE's CI line lags by one run, by
  construction).
```
