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

---

```
SESSION: 2026-08-25 @ 0e1ac18 + this commit (Session 5 — exam attempt: DISQUALIFIED)
D2 DISCLOSURE (first entry, per the memory policy ratified for KOBER this session): this
  session runs in the SAME CONVERSATION as Session 4. The memory index recalled at the start
  of that conversation contained the following KOBER entry, verbatim:
    ## KOBER (Linear A falsification infrastructure)
    - [Repo pointer + session discipline](project_kober.md) — `C:\Users\LEET\KOBER`, branch
      `master`, remote `Quigles1337/KOBER` (**public**, created by Al 2026-08-22); constitution
      `PROGRAM/KOBER-PROGRAM.md` is the sole authority — always run its §4 loop from the repo,
      never from memory; Sessions 1–3 ran 2026-08-22 (paper verified+extracted, scaffold green,
      R0 enumerated); next session's FIRST act: the G0 cold-start test.
  and the sibling's entry, verbatim:
    - [Repo pointer + session discipline](project_friedman.md) — `C:\Users\LEET\FR13DMAN` /
      `Quigles1337/FR13DMAN` (**public**, leetspeak name), branch `main`; KOBER's sibling
      program; constitution `PROGRAM/FRIEDMAN-PROGRAM.md` is the sole authority — always run
      its §4 loop from the repo, never from memory; Session 1 (2026-08-22): bootstrap +
      CLAIM-0001..0003 all VERIFIED (Nair 2026 percentile-scorecard-no-ROC confirmed; Timm
      generator MIT); next: F0.3 manifest ADR; **escalation open: Al to ferry the founding
      sweep report (F0.1)**.
  Also recalled: 1 user-identity line, 4 machine/working-preference lines (hazards; D1-legal),
  and ~27 index lines for unrelated private programs (withheld). In addition, Session 4 read
  the full `project_kober.md` from the store (phase, targets, toolchain versions, gotchas) and
  at its close WROTE program state back into it (G0 closed, tip SHA, next action, the
  CLAIM-0005/0006 caveat) — a D1/D3 violation in hindsight, before any policy existed.
  Verdict on the recalled content: it held program state (phase target, session history, the
  next action) → Session 4's exam did not count, exactly as the architects ruled.
PHASE / GATE: Phase 0 — FOUNDATION. **Gate G0 REOPENED by the architects 2026-08-25**: the
  Session-4 cold-start pass is WITHDRAWN (memory store held program state; cold reconstruction
  not demonstrated). Session-4 work product and doc fixes stand. This session was instructed to
  re-run the exam and is **DISQUALIFIED** under the ratified corollary (it is in the
  conversation context that built Session 4's state; the entire content of every state file is
  in its context window). The exam was NOT run. G0 remains open on the cold-start row only.
ADVANCED:
- ORIENT from the repo anyway (state files are claims): tree clean, `0e1ac18` == origin/master,
  `origin/HEAD` now resolves (Session 4 fix holds), gate ALL GREEN at 0e1ac18, CI success at
  0e1ac18 (run 32879934732, 10 steps). Nothing in the repo changed between sessions.
- Purge verification (claim vs evidence): the live store now holds a hazards-only
  `project_kober.md` and a matching index line ("No program state is recorded here") — D1
  satisfied for the live files. BUT pre-purge backups survive in the store directory:
  `project_kober.md.bak`, `MEMORY.md.bak`, `project_friedman.md.bak`, carrying the old
  program-state content with identical `name:` frontmatter. Escalated (STATE) — not deleted by
  this session (not its files; D3).
- Retrieved the sibling's ratified policy text (FR13DMAN `PROGRAM/DECISIONS/ADR-0003.md`,
  commit c1fc6f0 there) so STATE cites D1–D3 accurately instead of paraphrasing; recorded the
  architects' corollary + extension verbatim in STATE with the executor's reading of the
  extension flagged for Al to correct in the ADR.
- STATE rewritten: G0 reopened with the withdrawal trail in the cold-start row; a full exam
  protocol for a cold successor (self-check → DISQUALIFIED-or-walk → close-or-fix); the
  memory-policy standing order (ADR-0003 reserved, drafted AFTER the exam per the architects);
  G1 table kept as pre-staged; P1.1 staged verbatim so the passing session can promote it.
- No memory writes this session (D3). No CLAIMS transitions (none earned).
BELIEF DELTAS:
- "No conversational memory of Sessions 1–3" (Session 4's premise) was true and irrelevant:
  the memory store is a second channel, and the recalled index line alone named the phase
  target and the next action. Coldness is a property of ALL channels — store, conversation,
  and launching prompt — not of one. Evidence: the D2 disclosure above; FR13DMAN HANDOFF
  Session 4 found the same independently.
- The disqualification is a fortiori: a memory line with a one-sentence summary voided
  Session 4; this session holds every state file in full. Any "walk" from here would be
  recitation. Evidence: this conversation.
- Backups made during a purge are themselves un-purged memory. A purge is complete only when
  no file in the store carries program state, indexed or not. Evidence: the three `.bak` files.
CONFUSIONS:
- Briefly weighed obeying the instruction literally ("re-run the exam as this session's one
  thing") against the corollary ratified in the same instruction. Resolved by the sibling's
  precedent (FR13DMAN STATE: "if the session is not cold, record DISQUALIFIED and stop") and
  by §0.3 — a false certification is the one output worse than none. Cost: none. Doc fix: the
  exam protocol in STATE now begins with the self-check so no successor has to weigh it.
- Whether to draft the memory-policy ADR now. The architects said "after the exam"; drafting it
  here would also be a second thing (§4.3). Deferred; recorded as a standing order with the
  number reserved so it cannot be lost.
HONESTY CHECK: Session 4's HONESTY CHECK claimed a re-read of CLAIM-0001..0006 "cold" — that
  adverb was wrong (memory-warm); the re-reads themselves stand. Session 4's cold-start row
  evidence now reads "shows the docs can be walked, not that they were walked cold". No CLAIMS
  downgrades: nothing in the register depended on the certification.
DRIFT CHECK: clean. Session was governance and documentation; zero sound values, zero claims
  about tablets.
NEXT-SINGLE-ACTION: (see STATE.md — the G0 cold-start test, run by a cold session under the
  launch conditions and self-check protocol recorded there.)
ESCALATIONS:
- Al: delete the pre-purge `.bak` files from the executor memory store before launching the exam
  session (STATE standing escalations).
- Al: launch the exam as a fresh conversation with the §6 resume prompt verbatim; the executor
  cannot create that condition from inside any existing conversation.
- For the ADR (after the exam): confirm or correct the executor's reading of "extended to cover
  prompts written by the architects" (STATE memory-policy section).
STOP-REASON: blocker — this session is not cold by the ratified corollary; nothing further it
  can do advances G0. Repo green locally at this commit; its CI run is checked at the next
  ORIENT.
```

---

SESSION: 2026-11-22 UTC @ f94bec2 (Session 6 — an informed working session launched with Al's
rulings K1–K8; not launched with the amended §6 Session-N prompt and not an exam. One commit
carrying this entry, ADR-0003, the constitution edit and the STATE rewrite lands on top of
`f94bec2`, made only after Al accepted what he was shown)

FORM: from this block on, a HANDOFF block is plain text and is not wrapped in a code fence, as
the blocks of Sessions 1 to 5 are. This block carries fenced verbatim text of its own, and so
will every block that opens with a memory disclosure (ADR-0003, note 4).

LAUNCH CONTEXT: the first turn of a new conversation; no turn preceded it. Received
2026-11-22T19:18:40Z (the harness's record), in a session started in `C:\Users\LEET`, not in the
repository directory. Al's whole message is reproduced below, copied by script from the
harness's record of it. The harness had delivered it inside a paste wrapper, which is not part
of the message and is not reproduced. The harness also loaded the executor's memory index into
the session's context. This session makes no memory disclosure and reproduces no line of
executor memory in this repository: Al's message says so, and the session was not launched with
the Session-N prompt (K3). It opened no memory file and wrote no memory. It took the repo's
location from the memory index's line for this program, which ADR-0003 D1 allows memory to
hold. It built the state the exam will test, so it is **not cold** (K2), and it neither ran nor
rehearsed the exam.

AL'S MESSAGE (verbatim):

```text
You are the executor of the KOBER program. Read PROGRAM/KOBER-PROGRAM.md in full, then run the
metacognitive loop (§4) exactly: ORIENT from the repo (state files are claims; builds are evidence),
ASSESS, PLAN one thing, EXECUTE under the §1 constitution, VERIFY, RECORD+REFLECT per the §4.5
schema, and stop clean per §4.6. Honor escalations — some decisions are Al's, not yours.

Al's rulings follow. This session records them and makes the Gate G0 cold-start exam runnable. It
does not run the exam: it builds the state the exam will test, so it is not cold. It makes no memory
disclosure and reproduces no line of executor memory in this repository. I am ruling on the state at
commit f94bec2. If master is anywhere else when you orient, stop and tell me.

K1 (the memory ADR comes first). Write KOBER's memory-policy ADR in this session, as ADR-0003, the
number STATE reserves. This replaces the sequencing STATE records: the ADR is written before the
exam, not after it. Its decisions are the policy STATE records as ratified on 2026-08-25, D1 to D3
and the corollary, as K2 to K4 amend them.

K2 (the corollary). Your reading of its extension is right, and I ratify it in these words. A
session running in the conversation context that built the state under test is not cold, whatever
its memory holds, and its exam attempt does not count. A cold session is launched with the §6
Session-N prompt verbatim and nothing that carries program state.

K3 (disclosure first; amends D2 and the constitution's §6). Every session launched with the §6
Session-N prompt makes the D2 disclosure, whether or not it will attempt a cold-start test, as the
first entry of its HANDOFF block, before any action except reading the constitution and ADR-0003 in
full and reading the memory it discloses. It appends the disclosure to PROGRAM/HANDOFF.md without
reading that file's existing contents. Reason: a cold session learns that it is an exam only from
STATE, after it has acted. FRIEDMAN adopted this order on 2026-11-22 UTC, and its Gate F0 exam
passed under it.

K4 (what a disclosure holds; amends D2). The disclosure covers the memory the harness loads for the
session, and the session opens no other store. It reproduces verbatim every recalled line that names
KOBER, FRIEDMAN, FR13DMAN or SYNDEOM, and this program's own memory file if the session recalls or
opens it. Every other line is withheld and given by count: this repository is public, and a line
about any other program is not this repository's to publish. A verbatim reproduction is copied from
the file by script, never typed. The append opens PROGRAM/HANDOFF.md for appending without creating
it, and asks the file system nothing else about it: no existence test and no size.

K5 (the new §6 Session-N prompt). Replace the Session-N prompt in §6 with the text between the two
marker lines below, verbatim and without the marker lines. Note the amendment in the constitution's
header in the way FRIEDMAN's header notes its own, read at the commit K6 names.

BEGIN SESSION-N PROMPT
Before anything else, make the memory disclosure that ADR-0003 requires: read
PROGRAM/KOBER-PROGRAM.md and PROGRAM/DECISIONS/ADR-0003.md in full, read the executor memory they
tell you to disclose, and append the disclosure as the first entry of a new block at the end of
PROGRAM/HANDOFF.md, whether or not this session will attempt a gate's cold-start test, and with no
other command or file read first. Append it without reading HANDOFF's existing contents (a shell
append or a script, not a file-editing tool that reads the file first), under a provisional block
header that carries the UTC date and that you complete after orientation without changing the
disclosure. You are the executor of the KOBER program. Having disclosed, run the metacognitive loop
(§4) exactly: ORIENT from the repo (state files are claims; builds are evidence), ASSESS, PLAN one
thing, EXECUTE under the §1 constitution, VERIFY, RECORD+REFLECT per the §4.5 schema, and stop clean
per §4.6. Honor escalations — some decisions are Al's, not yours.
END SESSION-N PROMPT

K6 (FRIEDMAN's notes and exam procedure, fitted to KOBER). Read these at FR13DMAN commit
2ffa3e7bd56087f79bdcfe4b9649e2d86844b305 and record that commit: in its ADR-0003, the five notes for
the session making a disclosure; in its STATE, the cold-start exam procedure with its three readings
and the notes of its Session 7, and my rulings A to D on that session. I accepted them for FRIEDMAN,
and I will read your fitting of them before the commit. Put the notes for a disclosure in KOBER's
ADR-0003 and the exam procedure in STATE. Where they name FRIEDMAN's gate, phase, checks or next
action, use KOBER's. Step 1 of the exam protocol in STATE becomes this: the session has already made
its disclosure; below it, without changing it, the session records the launching message it
received, verbatim, and whether any turn preceded it; it records DISQUALIFIED and stops if the
message carries anything beyond §6's text, or a prior turn exists, or any disclosed memory is
program state, or the session is running in a conversation context that built this state. Steps 2
and 3 stay as they are, except that the ADR is no longer owed after the exam.

K7 (the pre-purge copies). In the executor memory directory that holds project_kober.md, which I
believe is C:\Users\LEET\.claude\projects\C--Users-LEET\memory, delete MEMORY.md.bak,
project_kober.md.bak and project_friedman.md.bak if they exist. Confirm that project_kober.md is in
that directory before you touch anything. Do not open the three files. Record each one's name, size
and SHA-256 before deleting it, and nothing about any other file there. This is a memory write that
I order, and this session is not an exam. FRIEDMAN's Session 6 looked for the same three names on
2026-11-22 UTC and found none of them; record what you find.

K8 (launch directory). Where I launch a session from is my practice and not a condition of an exam.
Record it in STATE.

What to do, in order. Record these rulings verbatim: K1 to K6 in ADR-0003, and all of them in STATE
and HANDOFF. Make the edits that K3 to K6 order. Carry out K7. Rewrite STATE for the result: the
memory policy points to ADR-0003; the escalation about the pre-purge copies is closed with what you
found; NEXT-SINGLE-ACTION is the exam, in a new conversation launched with the amended §6 Session-N
prompt verbatim and nothing else.

Then stop before you commit. Show me ADR-0003 in full and the complete diff of the constitution, and
list every other file changed. Commit and push only when I answer "accepted". After the push,
confirm that CI passes on the new tip, then end your last message with the amended §6 Session-N
prompt in a code block, exactly as the constitution has it, so that I can launch the exam with it.
```

AL'S ANSWER TO WHAT HE WAS SHOWN (verbatim): his second message in the conversation, received
2026-11-22T19:47:00Z (the harness's record) and copied from that record by script. The harness
delivered it inside a paste wrapper, which is not reproduced. Its paragraphs are single long
lines, kept as he sent them.

```text
Accepted, as shown, and no further stop.

The eight places where your fitting departs from FRIEDMAN's text are accepted as written. On the fourth reading you read me rightly: a disqualified session stops the exam, completes and commits its HANDOFF block, and stops clean. Notes 5 to 7 on the steps stay as your notes. Rulings A to D stand here as you put them: precedent for calls of those kinds, not advance acceptance of a KOBER session's own.

A line-ending check for PROGRAM/ in the gate can wait. I will ask for it if I want it.

Commit, push, confirm CI, and end your last message with the amended §6 Session-N prompt in a code block, as ordered.
```

PHASE / GATE: Phase 0 — FOUNDATION / Gate G0 open on the cold-start test alone; not passed.
ADVANCED:
- ORIENT (§4.1): top level `C:/Users/LEET/KOBER`; `origin` =
  `https://github.com/Quigles1337/KOBER.git`; `master` at `f94bec2` both locally and on the
  remote (`git ls-remote origin`), which is the state Al ruled on; tree clean; `origin/HEAD` →
  `refs/remotes/origin/master` without the fallback. `bash scripts/check.sh` → `ALL GREEN` at
  `f94bec2` (Lean 4.33.1 build; 1/1 cargo test; clippy `-D warnings`). CI `check` `success` for
  the tip `f94bec2` (run 32890264336, 2026-08-25T19:33:41Z; one job, `gate`, 10 steps). Read:
  the constitution in full; STATE; HANDOFF, Sessions 1 to 5; CLAIMS for statuses (CLAIM-0001 to
  0003 VERIFIED, CLAIM-0004 to 0006 UNKNOWN); ADR-0000, 0001 and 0002; `scripts/check.sh` and
  the workflow. Checked beside them: both stored files under `sources/` reproduce the SHA-256s
  in SOURCES.md S-0001; the `sorry`/`admit` scan of `lean/` matches one doc comment and nothing
  else. STATE and the repo disagreed in one place, which is outside the repo: the pre-purge
  memory copies (K7, below).
- K1 to K6 recorded in **ADR-0003** (new file): the rulings verbatim; the policy STATE recorded
  as ratified on 2026-08-25, copied by script from STATE at `f94bec2`; D1 to D3 and the
  corollary as K2 to K4 amend them; five notes for the disclosing session, fitted from
  FRIEDMAN's; a closing section that says what was taken from FRIEDMAN, at which commit, and
  where KOBER's notes differ and why.
- Constitution (K5): the §6 Session-N prompt replaced by the text between K5's marker lines, and
  an **Amendments** line added to the header in the form FRIEDMAN's header uses. Nothing else in
  it changed; the version string stays "v1.0" and the footer is as it was. SHA-256 at `f94bec2`
  (17,736 bytes): `e913b14a427537ba17351b8b59bf66b429a1ef23a21aeecdbdbbaf9ed177e089`. SHA-256
  with this commit (18,565 bytes):
  `52a2914ed3c42addfc07fb37f0ba74b853c2b2750c45613a08530ebf4efeb2b5`.
- K6, read at FR13DMAN commit `2ffa3e7bd56087f79bdcfe4b9649e2d86844b305`, the tip of that
  repository's `main` on the remote today (`git ls-remote`): its ADR-0003 and its STATE in full;
  its constitution's header and §6, with the diff that amended them; its HANDOFF Sessions 6 and
  7, to learn what rulings A–D refer to and how its Session 6 recorded a session of this kind.
  Its HANDOFF Session 8 was not read. The disclosure notes went into ADR-0003. The exam material
  went into STATE: step 1 is now Al's text, steps 2 and 3 are as they were less the clause about
  an ADR owed after the exam, and a new section carries the readings of step 1, seven notes on
  the steps, and rulings A–D verbatim with what they mean here. Nothing was written in the
  FR13DMAN working copy (`git status --porcelain` empty afterwards).
- K7 carried out. `project_kober.md` was confirmed present in
  `C:\Users\LEET\.claude\projects\C--Users-LEET\memory` before anything else was done there.
  `MEMORY.md.bak`, `project_kober.md.bak` and `project_friedman.md.bak` were each **absent**: by
  a Git Bash file test at 2026-11-22T19:21:04Z, and by a second method (.NET `File.Exists`, from
  PowerShell 7.7.0) at 19:21:05Z. The same two tests found `project_kober.md`, so the absence
  is not a check that failed quietly. Nothing existed to delete: nothing was deleted, nothing
  was opened, and there is no size or SHA-256 to record. Nothing else in that directory was
  listed, read or recorded.
- K8 recorded in STATE. STATE rewritten for the result: the memory policy points to ADR-0003;
  the pre-purge escalation is closed with what K7 found; NEXT-SINGLE-ACTION is the exam, in a
  new conversation launched with the amended §6 Session-N prompt verbatim and nothing else. The
  first five Gate G0 rows, the Gate G1 section, step 2 and the staged P1.1 text were carried
  from STATE at `f94bec2` by script, unchanged.
- Verified before Al was shown anything: `bash scripts/check.sh` → `ALL GREEN` on the edited
  tree; `git ls-files --eol` shows no working file with a carriage return (the text files
  `w/lf`; the stored one-line Crossref JSON `w/none`); the constitution's Session-N block
  equals the text between K5's marker lines byte for byte; the constitution's diff touches
  only the header and that block; the verbatim blocks in ADR-0003, STATE and this entry equal
  the corresponding lines of the one script-made copy of Al's message; rulings A–D equal
  FRIEDMAN's STATE at `2ffa3e7`; the new HANDOFF begins with the old HANDOFF's bytes unchanged;
  CLAIMS.md, SOURCES.md and every file outside the four named here are untouched.
- The stop, and Al's answer. Before any commit Al was shown ADR-0003 in full and the
  constitution's complete diff. STATE and this entry were listed with a summary of each, as his
  order asked, and the eight places where the fitting departs from FRIEDMAN's text were put to
  him as a list. He accepted all of it as shown, with no change (his answer, above). ADR-0003
  and the constitution are byte for byte what he was shown, and STATE is byte for byte what
  stood in the tree when he answered (SHA-256 taken before the files were regenerated and
  compared after). This entry was completed with his answer: the answer itself, this bullet,
  and the two ESCALATIONS items that his answer settles. On the final tree
  `bash scripts/check.sh` → `ALL GREEN` again, and the byte checks above were repeated.
BELIEF DELTAS:
- Session-start me read STATE's escalation about the three `.bak` files as a description of the
  machine. It described 2026-08-25. On 2026-11-22 all three were gone. Evidence: the two tests
  above, and FRIEDMAN's Session 6 finding the same earlier in the day. State files are claims,
  and a claim about something outside the repo ages without a commit to show it.
- FRIEDMAN's note on bytes could not be carried over as written. Its gate fails on a carriage
  return in a `PROGRAM/` file; KOBER's gate looks at no `PROGRAM/` file. What KOBER has is
  `.gitattributes`: in a scratch clone a CRLF append reached the index as LF and left the
  working file mixed. Evidence: `git ls-files --eol` → `i/lf w/mixed` after `git add`, with the
  warning "CRLF will be replaced by LF the next time Git touches it". ADR-0003's note 3 says
  this, and tells the session to check its own bytes.
- "A shell append" (the §6 prompt) and "without creating it" (K4) meet in fewer calls than I
  expected. A bare `>>` created a missing file; so did Node's `fs.appendFileSync`. `dd` with
  `conv=notrunc,nocreat oflag=append`, Python's `os.open` without `O_CREAT`, and Node's
  `fs.openSync` with `O_WRONLY | O_APPEND` each failed on a missing file and created nothing.
  Evidence: scratch tests this session (Python 3.11.9, Node 22.23.1, GNU bash 5.2.37,
  coreutils 8.32). The calls are in ADR-0003's note 5, which a session reads before it appends.
- Under disclosure-first, STATE's step 2 ("HANDOFF last entry") points at the exam session's own
  provisional block. Step 2 stays as Al ordered; note 5 in STATE says which entry is meant.
- KOBER's HANDOFF wrapped each block in a code fence. A block that opens with a disclosure
  holds fenced text, and a fence cannot hold another. From this block on, blocks are plain text
  (FORM, above; ADR-0003, note 4).
- STATE's CI line lagged by one run, as it says it does: `f94bec2`'s own run had succeeded on
  2026-08-25 and STATE still named `0e1ac18`.
CONFUSIONS:
- What "steps 2 and 3 stay as they are" leaves room for. FRIEDMAN's procedure has five steps
  after standing and says things KOBER's two do not: what `git status` will show, the CI check,
  the evidence links, what counts as a guess. I left the two steps' text alone and put those
  points in notes marked as the executor's (STATE, notes 5 to 7). Cost: none. Put to Al before
  the commit.
- A `cd` into the FR13DMAN working copy moved the harness's working directory, and the next
  command was held for a second review. FRIEDMAN's Session 6 recorded the same lesson and I
  had not yet read it. Cost: one repeated call. Fix, used from then on: `git -C <path>` and
  absolute paths for anything outside this repo.
- A `grep -c` I ran to show that `scripts/check.sh` has no byte check counted lines that
  matched ordinary letters. The claim in ADR-0003's note 3 rests on reading the script, which
  is fourteen lines, not on that count.
HONESTY CHECK: no CLAIM transition; CLAIMS.md is untouched, and its six statuses were re-read,
  not re-derived. The cold-start row stays open and says "not passed". K7 is recorded as
  "nothing to delete", not as a deletion. In ADR-0003 and STATE, Al's words sit in verbatim
  blocks or marked quotations and the executor's are labelled as the executor's. Every
  observation in ADR-0003's notes was made this session on this machine; none was carried from
  FRIEDMAN's record, though each agreed with it. Nothing entered a register from memory.
DRIFT CHECK: clean. The session was governance and documentation: no sound value, no claim about
  what any tablet says. The live temptation was scope, and each item was refused: a disclosure
  script in the repo; a byte check added to the gate; opening the program's memory file to see
  what the exam session will find; a rehearsal of the exam, which K2 voids for a builder.
NEXT-SINGLE-ACTION: see STATE.md — the Gate G0 cold-start exam, in a new conversation that Al
  launches with the amended §6 Session-N prompt verbatim and nothing else. The directory he
  launches it from is his practice (K8), not a condition of the exam.
ESCALATIONS:
- Al: launch the exam. The executor cannot create a cold session from inside a conversation.
- Not open; recorded so that it is not reopened. The five notes in ADR-0003, the four readings
  of step 1 and the seven notes on the steps in STATE are the executor's words, except where
  they quote Al. He accepted them as written, with the eight places where the fitting departs
  from FRIEDMAN's text (his answer, above). STATE calls the fourth reading of step 1 "KOBER's
  own"; his answer confirms it in his words: a disqualified session stops the exam, completes
  and commits its HANDOFF block, and stops clean. Rulings A to D stand in STATE as he accepted
  them: precedent for calls of those kinds, not advance acceptance of a KOBER session's own.
- Not open. KOBER's gate has no check on line endings in `PROGRAM/`, where FRIEDMAN's has one.
  Al's answer: it can wait, and he will ask for it if he wants it. No session adds it unasked.
- CI for this commit is confirmed by Session 6 after the push and reported to Al in the
  conversation; the repo's record of it is made by the next session at ORIENT, as STATE's build
  line says.
STOP-REASON: blocker requiring Al — the next action is an exam that only a cold session can run,
  and only Al can launch one. Default branch green.
