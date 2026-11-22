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

---

SESSION: 2026-11-22 UTC @ 44c0b45 + this commit (Session 7 — the Gate G0 cold-start exam, in a
cold session launched with the §6 Session-N prompt verbatim. PASS: Gate G0 CLOSED and Phase 1
opened at P1.1. The closing rests on calls named below for Al to overrule)

MEMORY DISCLOSURE (ADR-0003 D2; Al's rulings K3 and K4). First entry of this block.

Appended by a script started at 2026-11-22T19:53:28Z (this machine's clock, UTC), before any
command or file read other than these: PROGRAM/KOBER-PROGRAM.md and
PROGRAM/DECISIONS/ADR-0003.md, each read in full, and the two memory files named below. The
existing contents of this file were not read. The append opened it for appending without
creating it (Node v22.23.1: fs.openSync with O_WRONLY | O_APPEND, then fs.writeSync) and
asked the file system nothing else about it. Every line inside a fence below was copied from a
memory file by that script, with carriage returns stripped; no line inside a fence was typed.
The script, and a transcription file it compares against (see 1), were written to the
session's scratch directory, outside this repository and outside the memory store.

The store. At session start the harness put one memory index into the session's context and
named the file it came from:

    C:\Users\LEET\.claude\projects\C--Users-LEET\memory\MEMORY.md

That index is the memory the harness loaded, and its directory is the one store. The session
opened two files in that directory, both before this append, and no other memory file and no
other store: MEMORY.md (the loaded index, read again from disk by the script so that its lines
are copied and not typed) and project_kober.md (this program's own memory file, ADR-0003 note
2; read once with the harness's file-read tool, then by the script). As the script read them,
the SHA-256 being of each file's bytes as stored:

    MEMORY.md
      bytes:    20042
      modified: 2026-11-22T01:46:57.731Z (the file system's time, UTC)
      SHA-256:  7e74ab1cb3b2efcdda278cc9a7a3ca4b8674d2649bdf4f1609f7cd8b97d5d453
    project_kober.md
      bytes:    2243
      modified: 2026-08-25T19:22:03.864Z (the file system's time, UTC)
      SHA-256:  b093bc495be4bedc56f421c2cc6852dab6a66ab5b621a108cbf49112ed64f7d6

1. Index lines reproduced verbatim: every line of MEMORY.md that names KOBER, FRIEDMAN,
FR13DMAN or SYNDEOM in any letter case (each line tested against
/kober|friedman|fr13dman|syndeom/i). Lines reproduced, in file order: 6.

```text
## KOBER (Linear A falsification infrastructure)
- [Repo pointer + machine hazards](project_kober.md) — `C:\Users\LEET\KOBER`, remote `Quigles1337/KOBER` (**public**); the constitution `PROGRAM/KOBER-PROGRAM.md` is the sole authority — always run its §4 loop from the repo, never from memory. No program state is recorded here or in the linked file (memory-policy ADR).
## FR13DMAN (FRIEDMAN — designedness-detection instrument)
- [Repo pointer + machine hazards](project_friedman.md) — `C:\Users\LEET\FR13DMAN` / `Quigles1337/FR13DMAN` (**public**, leetspeak name); sibling of KOBER; the constitution `PROGRAM/FRIEDMAN-PROGRAM.md` is the sole authority — always run its §4 loop from the repo, never from memory. No program state is recorded here or in the linked file (ADR-0003).
## SYNDEOM (AI-proof calibration — third sibling of KOBER/FRIEDMAN)
- [Repo pointer + machine hazards](project_syndeom.md) — `C:\Users\LEET\Syndeom` / `Quigles1337/Syndeom` (**public**); the constitution `PROGRAM/SYNDEOM-PROGRAM.md` is the sole authority — always run its §4 loop from the repo, never from memory. No program state is recorded here or in the linked file (SD15 / FR13DMAN ADR-0003).
```

Before appending, the script compared these lines with the session's transcription of the same
lines from the copy in its context, and was written to stop without appending if they
differed. They did not differ. The transcription was used for that comparison only.

2. Index lines withheld, given by count: 118.
They are lines about other programs, this machine and the user, which are not this
repository's to publish. How the count was taken: the script decoded the file as UTF-8
(byte-order mark: none), split it on line feeds, dropped the empty piece after the final line feed,
and stripped carriage returns (found on 0 lines).
Lines in the file: 124.
Lines that matched and are reproduced above: 6.
Lines that did not match and are withheld: 118, of which 81 hold text and 37 are empty.

3. This program's own memory file, project_kober.md, reproduced whole.
Lines: 40. Byte-order mark: none. Carriage returns: found on 0 lines, stripped.
The lines holding only --- inside the fence are the frontmatter delimiters of that file, not
block separators of this one.

```text
---
name: project-kober
description: "KOBER program - repo C:/Users/LEET/KOBER; constitution and ALL program state live IN the repo, never here"
metadata: 
  node_type: memory
  type: project
  originSessionId: 9c3fd148-2517-4d33-841b-47b145a06320
  modified: 2026-08-25T00:00:00.000Z
---

**KOBER** - repo `C:\Users\LEET\KOBER`, remote `https://github.com/Quigles1337/KOBER` (**public**).

This file locates the repo and records machine hazards. Per the memory-policy ADR it records NO
program state: no phase, gate, claims, commits, toolchain versions, escalations, or next actions.

**Standing rule:** the repo is the sole memory of the program (constitution at
`PROGRAM/KOBER-PROGRAM.md`). Every session: read the constitution, then run the section 4 loop
from `PROGRAM/STATE.md` and `PROGRAM/HANDOFF.md`. Never resume from this file. Discover the
default branch, toolchain, and every other value from the repo - never assume one, and never
carry a value across from the sibling program.

**Hard invariant (kept deliberately; a standing prohibition, not state):** KOBER never proposes
a decipherment.

**Never work in the sibling FRIEDMAN tree** - identical `PROGRAM/` schema, and its sessions may
be live concurrently.

Machine and harness hazards:
- elan resolves the Lean toolchain from the current directory; `lake --dir` is not sufficient,
  so cd into the Lean directory before invoking it.
- poppler lives at `C:\Users\LEET\tools\poppler-26.02.0\poppler-26.02.0\Library\bin` and is on
  the user PATH (the winget source is broken - InternetOpenUrl).
- ScienceDirect and academia.edu return 403 to tool fetches; the Crossref API and institutional
  repositories work.
- A bare `cat > file` with no heredoc blocks on open stdin (cost a 10-minute timeout); attach the
  heredoc directly or add `</dev/null`, and pass commit messages via `-F file`.
- `git symbolic-ref refs/remotes/origin/HEAD` may fail on a working copy that was init-ed then
  remote-added; fallback `git remote show origin`, or repair with `git remote set-head origin -a`.
- This machine has autocrlf active and MSYS grep reports false carriage returns; CRLF conversion
  can silently break byte digests. Verify line endings with `git ls-files --eol`, never by eye.
```

End of the disclosure. The provisional header above is completed after orientation; the
disclosure is not changed. The session's record continues below.

STANDING (the cold-start exam, step 1). Recorded 2026-11-22T19:57:06Z below the disclosure, which is
unchanged (6963 bytes, SHA-256 a98390e5fdb35cd0324a250c5bbcb4d29069e001c8549185d9a8bf7921a2bf90).

After the disclosure the session ran the three §4.1 commands (with `git branch -vv` and
`git ls-files --eol PROGRAM/HANDOFF.md`) and read PROGRAM/STATE.md. That is where it learned
that it is the Gate G0 exam and that this step exists (STATE, note 1). Between the disclosure
and this record it read nothing else in the repository, and outside it only its own
conversation record, as (a) describes. The tree this exam tests is the tip of master:

    44c0b45be44043cc63c43bbfbf8712f936318acc
    committed 2026-11-22T19:48:17Z (2026-11-22T14:48:17-05:00 as git prints it)

(a) The launching message, verbatim. Copied by script from the harness's record of this
conversation: one JSON-lines file named for the session identifier, in the directory that
holds the memory directory. The identifier, 74129a80-8828-4fa8-a128-a93ff6c33ce0, is the folder
above `scratchpad` in the scratch path the harness names. The file was opened by its exact
name; nothing in that directory was listed, and no other record was opened. Every record in
it that carries a sessionId carries that one. The launching message is the first record of
type `user` (record 6 of the file): parentUuid null, turnPosition promptIndex 1 and
turnIndex 1, origin human, timestamp 2026-11-22T19:50:14.130Z, harness version 2.1.322,
cwd C:\Users\LEET. The 5 records before it are of these types, none of them a user or
assistant message:

    mode, permission-mode, session-owner, file-history-snapshot, atis-latch

(STATE's note 3 lists four types for Session 6's record; `atis-latch` is the one it does not
list.) The record holds the message as one string of 1083 characters: the text below, between
the opening and closing tag lines of a paste wrapper (`<pasted_content id="dbaf">`), with only
white space outside the wrapper. By STATE's first reading the wrapper is not the message. The
text between the tag lines:

```text
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
```

Compared by script with the Session-N block of §6 in PROGRAM/KOBER-PROGRAM.md (the lines
between the fence lines under `### Session N — resume`, working tree at the tip above):
identical, character for character: 1025 characters, 1031 bytes as UTF-8 with line
feeds, SHA-256 441207184fbbb0ab9e681242f5ead7c1bf15cb298450552bfc15f1dda749a91d for both.
The message carries nothing beyond §6's text.

Harness attachments (first reading). In the session's context, though not in that record's
message string, the harness placed blocks of its own around the message: the memory index
(disclosed above), the account's e-mail address, a note on commit attribution, the lists of
tools, skills and agent types, and facts about the environment (working directory
C:\Users\LEET, not a git repository; platform; the date). Only the memory index concerns this
program.

(b) Prior turns: none. The launching message is the first message of the conversation, by the
record (parentUuid null, prompt 1, turn 1, no user or assistant record before it) and by the
session's own context.

(c) Is any disclosed memory program state (ADR-0003 D1)? The session's reading: none is. It
went through D1's list (phase, gate status, CLAIM statuses, file contents, commit SHAs as state
markers, next actions, escalations) against the six index lines and project_kober.md, and
against what STATE says the state is. The disclosed memory states none of them. This reading
is made here, with the constitution, ADR-0003 and STATE read. It is made again after the walk,
when HANDOFF, CLAIMS and the other ADRs have been read, and the second reading is recorded with
the walk. The closest calls, named so that Al can overrule them (ruling B on FRIEDMAN's Session
7 is the precedent for the first four kinds):

  1. The remote is called public: in the KOBER, FR13DMAN and SYNDEOM index lines and in
     project_kober.md. Visibility is a fact about the remote, and D1 lets memory hold the
     remote.
  2. Sentences of the constitution restated as standing rules in project_kober.md: the repo is
     the sole memory (§0.4), every session runs the §4 loop from STATE and HANDOFF, KOBER never
     proposes a decipherment (§0.2). The KOBER index line restates the first two.
  3. The front matter of project_kober.md: a harness session identifier and a modified date of
     2026-08-25.
  4. Hazards worded so that they imply history: there is a Lean directory to cd into; poppler
     was installed; ScienceDirect and academia.edu refused tool fetches where the Crossref API
     and institutional repositories answered; a bare `cat > file` cost a ten-minute timeout;
     the working copy was init-ed and then remote-added, so that `git symbolic-ref` may fail;
     byte digests are in use and CRLF conversion can break them. The fifth of these is the
     same fact as the ORIENT note in STATE's header. The session reads it as a tooling hazard
     with its fallback: it does not say what the default branch is.
  5. Not one of ruling B's four kinds. The memory gives a decision record as its reason for
     holding no state: the KOBER index line and project_kober.md cite a memory-policy ADR, the
     FR13DMAN line cites that program's ADR-0003, and the SYNDEOM line cites a rule of its own
     and FR13DMAN's ADR-0003. That names a record and, for the siblings, its number. It gives
     no status, and no content beyond the rule itself, which is D1. The session reads it as a
     pointer, not state.
  6. The instruction in project_kober.md never to work in the sibling FRIEDMAN tree, with its
     reasons (the same PROGRAM/ schema; sessions that may be live at the same time). It is a
     hazard about another tree, and it restates §3's layout as true of the sibling.

The 118 withheld index lines are in the session's context, because the harness loaded the
whole index. None names this program in any letter case (the script's test), and the session
reads none of them as being about it. Many hold state of the programs they are about; that is
not this program's state.

(d) The builder's context (K2). This conversation began with the launching message. The
session built none of the state under test: master's tip was committed before the message was
sent (times above), and the session has changed nothing in the repository but the end of this
file.

(e) The disclosure order (third reading) and the append (ADR-0003, notes 3 to 5). Before the
append the session read the constitution and ADR-0003 in full and project_kober.md, each with
the harness's file-read tool, and ran one command: the disclosure script. The append opened
HANDOFF for appending without creating it and asked the file system nothing else about it: no
existence test, no size, no read. Three things the session did that the prompt does not name.
It reads them as parts of the script that the prompt allows, and names them for Al to judge:

  1. Before running the script the session wrote two files to its scratch directory: the
     script, and its own transcription of the six index lines from the copy in its context.
     The script read the transcription and compared it with the lines on disk (disclosure,
     1). So the script read one file that is not the constitution, ADR-0003 or a memory file.
     Everything in that file came from the session's own context, and nothing new could reach
     the session through it.
  2. The script asked the file system for the size and modified time of the two memory files
     (not of HANDOFF) and recorded them in the disclosure with a SHA-256 of each, so that a
     later write to memory can be detected (D3).
  3. The script wrote a copy of the bytes it was about to append to the scratch directory, for
     the check that the disclosure is unchanged when the header is completed.

After the append, `git ls-files --eol PROGRAM/HANDOFF.md` gave `i/lf w/lf`: the working file
has line feeds only.

RESULT OF STEP 1: not disqualified. The message carries nothing beyond §6's text; no turn
preceded it; the session reads no disclosed memory as program state; the session is not in a
conversation context that built this state. The calls in (c) and (e) are Al's to overrule. The
exam goes on to step 2.

THE WALK (the cold-start exam, step 2). Recorded 2026-11-22T20:04:13Z.

Order, as STATE's step 2 and its note 1 give it: the §4.1 git commands; PROGRAM/STATE.md; step
1 (above); PROGRAM/HANDOFF.md, the last entry before this block (Session 6) and then Sessions
4 and 5, which STATE's cold-start row cites; PROGRAM/CLAIMS.md, all six entries in full;
ADR-0000, ADR-0001 and ADR-0002 (ADR-0003 was read before the disclosure); PROGRAM/SOURCES.md;
analysis/R0.md and analysis/P0.2-constraint-system.md in full; scripts/check.sh, the workflow,
the pins and the scaffold sources; README.md; then the build and the remote.

What the repo says the state is, and what was found:

- Repository. Top level C:/Users/LEET/KOBER; origin = https://github.com/Quigles1337/KOBER.git;
  branch master at 44c0b45, and the same commit on the remote (`git ls-remote origin`: HEAD and
  refs/heads/master). `git symbolic-ref refs/remotes/origin/HEAD` gave
  refs/remotes/origin/master with no fallback needed. `git status`: PROGRAM/HANDOFF.md modified
  by this session's append and nothing else; nothing untracked; ignored, lean/.lake/ and
  target/. `gh repo view`: PUBLIC, default branch master. As STATE says.
- Phase and gate. STATE: Phase 0, Gate G0 open on the cold-start test alone, the next action
  this exam. HANDOFF Session 6 says the same, and nothing in the tree contradicts it.
- Build. `bash scripts/check.sh` printed ALL GREEN at 44c0b45: Lean 4.33.1, the pin in
  lean/lean-toolchain (`lake build` completed, 4 jobs); `cargo test`, 1 passed; `cargo clippy`
  at -D warnings, clean. It is the script that ADR-0002 and STATE name.
- CI. `gh run list -R Quigles1337/KOBER --branch master --limit 3`: workflow `check`, success,
  for 44c0b45 (run 45062828893, a push, 2026-11-22T19:48:26Z; one job, `gate`, 10 steps, each
  a success), and before it for f94bec2 (run 32890264336) and 0e1ac18 (run 32879934732), the
  two runs that STATE and HANDOFF cite. STATE's CI line names f94bec2: it lags the last push by
  one run, as it says it does.
- The Gate G0 rows, each evidence link followed:
  1. CLAIM-0001 VERIFIED. The entry and its 2026-08-22 transition are in CLAIMS. SOURCES S-0001
     gives the citation, the licence and two digests, and `sha256sum` of the two stored files
     under sources/ reproduces both (b08c5635… for the PDF, 7dc89d5e… for the Crossref record).
  2. R0 enumerated. analysis/R0.md holds R0-agg (§3), R0-named (§4, with the damage notation
     of §1 and the editions of §2 as S-0001 cites them) and the variants R0a to R0d (§5).
     CLAIM-0003 is VERIFIED.
  3. Informal theorem stated. CLAIM-0004, 0005 and 0006 are in CLAIMS as proof targets, each
     UNKNOWN. The extraction's §0 and §7 say why uniqueness from the constraints is not
     claimed.
  4. Scaffolded and green. ADR-0001 (Lean v4.33.1, no Mathlib) agrees with lean/lean-toolchain
     and with the empty package list in lean/lake-manifest.json. ADR-0002 agrees with
     rust-toolchain.toml (1.91.0, clippy), the workspace and its one crate engine/,
     scripts/check.sh and the workflow. Green: above.
  5. Licence notes. SOURCES has S-0001 (INGESTED, CC BY-NC-ND 4.0) and S-0004 (SURVEYED,
     CC BY-NC-SA 4.0; R0 §4 records three pages fetched as links only), and S-0002, S-0003 and
     S-0005 (SURVEYED; terms not established or UNKNOWN, each with the E10 no-ingestion rule).
  6. The cold-start test: this exam.
- Checked beside them. Nine commits that HANDOFF and STATE cite are ancestors of master
  (f94bec2, 0e1ac18, e279df1, 06beff9, 70525f9, bbe0e44, dfcb8de, c9a3f65, 5f98231;
  `git merge-base --is-ancestor`). The constitution's SHA-256 and size are what HANDOFF Session
  6 records for them (52a2914e…, 18,565 bytes). A scan of lean/ for `sorry` and `admit`
  matches one doc comment in lean/Kober/Basic.lean and nothing else. `git ls-files --eol`:
  every text file is w/lf, the stored Crossref JSON w/none, the PDF binary. The references in
  the staged P1.1 text resolve: extraction §3 and §5, flag A-1, OBS-3, ADR-0001, and the first
  belief delta of HANDOFF Session 4.

Guesses about the program: none. At no point did the session have to supply a fact about the
program's state that the repo did not give it.

One slip, named for Al to weigh. In the command that listed the tracked files the session also
ran `ls lean rust`: it assumed a directory name (E7). There is no `rust` directory. The crate
is engine/, as ADR-0002 says and as the `git ls-files` output of that same command showed.
Nothing was built on the assumption and no part of the reconstruction depended on it. The
session reads it as a careless command of its own, not as a point where the repo left it to
guess. Al may read it otherwise.

Places where the repo did not say how to do a thing (STATE, note 7), for Al to weigh:

  1. When the memory reading is made. STATE's note 1 puts step 1 after STATE and before
     HANDOFF, CLAIMS and DECISIONS. Its paragraph on ruling B says the reading is made after
     orientation, so that it can be checked against the state the repo holds. The session made
     it at step 1 against STATE, and again below against everything it read.
  2. What the disclosure script may do besides copy and append. ADR-0003's notes give the
     calls for the append and the rule for bytes. They do not say whether the script may read
     a file of the session's own, or ask for a memory file's size and time. The session's
     script did both: STANDING, (e).
  3. Where the three steps live once the gate is closed. STATE says the passing session keeps
     them. They stood under NEXT-SINGLE-ACTION, which is now P1.1. The session moved them,
     unchanged and by script, into a section of their own beside the exam section.
  4. How a session shows that it wrote no memory (D3). Nothing says. The disclosure records
     each opened memory file's size, modified time and SHA-256, and the same three are taken
     again at the end of this block.
  5. The harness's record held five records before the launching message, where STATE's note
     3 lists four types for Session 6's. The fifth type is `atis-latch`. It is not a message.
  6. The harness's working directory. The session was started in C:\Users\LEET. Its first
     `cd` into the repository moved the harness's primary working directory there. The scratch
     path and the conversation record stayed where note 3 puts them.

The memory reading, made again after the walk (STANDING, (c)). It stands: no disclosed line is
program state. Each hazard in project_kober.md has a counterpart that the repo records as
history: the elan hazard in the comment in scripts/check.sh; poppler's location and the
ScienceDirect 403 in SOURCES S-0001; the academia.edu 403 in S-0003; the symbolic-ref hazard
in STATE's header; the line-ending hazard in .gitattributes. In memory each is worded as a
hazard of this machine and gives no phase, gate, CLAIM status, commit, next action or
escalation. For comparison, the index line that voided the Session-4 pass, which HANDOFF
Session 5 reproduces, named the branch, the sessions already run and the next session's first
act. Nothing of that kind is in the lines disclosed above. From memory the session took the
repository's location, and nothing else that the walk rests on.

VERDICT (step 3): PASS. The program state was re-derived from the repo alone, following §4.1,
in one pass, without a guess about the program. Gate G0 is marked CLOSED as of 2026-11-22 UTC
at 44c0b45, the tree the test passed on, and Phase 1 is opened with NEXT-SINGLE-ACTION = P1.1
as staged. The verdict is the examinee's own. It rests on the readings in STANDING (c) and (e)
and on its reading of the slip and the six places above. They are Al's to overrule, and if he
overrules one the gate reopens by a new commit, as it did on 2026-08-25.

PHASE / GATE: Phase 0 → Gate G0 CLOSED this session (2026-11-22 UTC, at 44c0b45), subject to
  Al's judgment of the calls named above. Phase 1 — THEOREM opened; Gate G1 open, nothing done
  yet.
ADVANCED:
- The memory disclosure first (ADR-0003 D2), then §4.1 ORIENT, then the exam STATE set as
  NEXT-SINGLE-ACTION: step 1 (STANDING: not disqualified), step 2 (THE WALK: no guess about the
  program), step 3 (VERDICT: PASS). One thing, as §4.3 asks.
- STATE rewritten for the result, by script from STATE at 44c0b45. New text: the header
  (Phase 1; G1 open; G0 CLOSED with date and SHA; the launch line now names Sessions 6 and 7;
  the build line names this session's checks and the tip's CI run); the cold-start row of the
  G0 table (done, with its history); the G1 heading; Blockers (none); the open escalation
  (Al's judgment of this exam); NEXT-SINGLE-ACTION = P1.1 with a pointer of this session's
  after the staged text; a section that keeps the three exam steps, and five notes from this
  session under it. Carried unchanged, and checked by script to be present line for line: the
  default-branch line, the memory-policy section, the first five G0 rows, the G1 table and its
  sequencing caveat, Al's rulings K1 to K8, the three closed or carried escalations, the
  staged P1.1 paragraph, the two paragraphs and three steps of the exam, and the whole section
  of readings, notes and rulings A to D.
- No CLAIMS transition: none was earned. CLAIMS.md, SOURCES.md, the constitution, the four ADRs
  and all code are untouched. Files changed: PROGRAM/HANDOFF.md (this block appended and its
  header completed; no byte before the block changed) and PROGRAM/STATE.md.
- Memory (D3): none written. The two memory files the disclosure covers, taken again when this
  part of the block was appended, are as the disclosure records them:
    MEMORY.md: 20042 bytes, modified 2026-11-22T01:46:57.731Z, SHA-256 7e74ab1cb3b2efcd…
    project_kober.md: 2243 bytes, modified 2026-08-25T19:22:03.864Z, SHA-256 b093bc495be4bedc…
  No other memory file was opened at any point, and no other store.
BELIEF DELTAS:
- At the start the session knew only that a disclosure was owed. That it was the Gate G0 exam
  it learned from STATE, after it had appended. Evidence: the order of this block. That is K3's
  reason for disclosure-first, seen from inside.
- ADR-0003's five notes were enough to disclose without a guess: which memory, the own file
  opened before the append, LF bytes, the form of the block, a call that appends without
  creating. Evidence: one run of one script; `git ls-files --eol` gave i/lf w/lf afterwards.
- The memory store is as HANDOFF Session 5 says the purge left it: location and hazards.
  Evidence: the disclosure; project_kober.md was last modified on 2026-08-25.
- A pointer for P1.1, not adjudicated. The Table-1 combination list in extraction §3 includes
  `H H H` (CHIC #068.r.A) and two `*180` ligatures (MA 4). R0 §3 and R0a in §5 say that S-0001
  did not use them in Simulation 2. The staged P1.1 text says "Table-1 attested combinations"
  and "conditional on R0a"; the two have to be read together to get the combination set for
  C2 to C4. STATE now carries the pointer after the staged text.
- STATE's CI line lagged by one run again, as it says it does, and its note 3 was one record
  type short for this harness version on this day.
CONFUSIONS:
- `ls lean rust`: a path assumed where E7 says to read it. Cost: one error line. No doc fix is
  owed, because the repo already says where the crate is; the fix is the habit.
- Whether the script's comparison against a transcription was worth a file read of the
  session's own before the append, under a prompt that says "no other command or file read
  first". The session judged a script's own data file to be part of the script. Cost: a call
  for Al to judge. Doc fix: note 5 of Session 7's notes in STATE (hold the text in the script).
- When to make the memory reading (the first of the six places). Cost: a second reading. Doc
  fix: note 3 of Session 7's notes in STATE.
HONESTY CHECK: CLAIM-0001 to 0006 re-read in full. Statuses are as STATE and HANDOFF Session 6
  give them (0001 to 0003 VERIFIED, 0004 to 0006 UNKNOWN). No transition and no downgrade.
  Re-examined: CLAIM-0001's two digests, reproduced; CLAIM-0003's description of R0.md against
  the file, which matches; CLAIM-0002's figures against the extraction's §0 and §7, which
  match. The stored PDF itself was not re-read, so that last check is register against
  extraction and not register against source. The PASS is recorded by the session that sat the
  exam. That is the procedure, and it is why every call is named for Al.
DRIFT CHECK: clean. Gate verification and documentation only: no sound value, no claim about
  what any tablet says. Scope refused: a line-ending check for PROGRAM/ in the gate (Al: it can
  wait); starting P1.1 in the session that closed the gate; any memory write (D3); naming in
  this public file anything from the withheld lines.
NEXT-SINGLE-ACTION: see STATE.md. P1.1: formalize the constraint system as Lean data
  conditional on R0a, to the file-level specification staged there.
ESCALATIONS:
- Al: judge the exam. The calls are in STANDING (c) and (e) and in THE WALK (the slip; the six
  places). Gate G0 is recorded CLOSED on the session's own readings. STATE lists this as the
  one open escalation.
- CI for this commit is confirmed by this session after the push and reported to Al in the
  conversation. The repo's record of it is made by the next session at ORIENT, as STATE's
  build line says.
- Carried, not open: the CLAIM-0005/0006 sequencing caveat under the G1 table in STATE. It is
  decided when P1.2 reaches CLAIM-0005, not before.
STOP-REASON: gate reached (G0 CLOSED), a §4.6 stop condition. Default branch green:
  `bash scripts/check.sh` prints ALL GREEN on the tree of this commit.
HEADER: completed after the block was written. The one provisional line (`SESSION: 2026-11-22
UTC (provisional header, completed after orientation)`) was replaced by the three header lines
at the top of this block, and nothing else was changed. Checked by script: the 44,192 bytes
before the header (this file at 44c0b45 and the separator) and the 30,002 bytes after it, from
the empty line under the header to the end of STOP-REASON, are byte for byte what they were.
The 6,963 bytes whose SHA-256 the STANDING record gives included the provisional line. The
disclosure after its header line is 6,883 bytes, SHA-256
7ff2f387c03c41de2a2faea6a3c4fd0c82c3bcbb030bb3e5271813789f7499e6, before and after.

---

SESSION: 2026-11-22 UTC @ 00416bc + this session's commits (Session 8 — a working session
launched with the §6 Session-N prompt followed by Al's rulings K9–K16; not an exam. Its first
commit records K9–K14 and adds K14's note to ADR-0003. The licence that K15 and K16 order is
committed only after Al answers "accepted" to what he is shown)

MEMORY DISCLOSURE (ADR-0003 D2). First entry of this block, appended before orientation.

What was read before this append. The session read `PROGRAM/KOBER-PROGRAM.md` and
`PROGRAM/DECISIONS/ADR-0003.md` in full and this program's own memory file, each with the
harness's file-reading tool, and no other file. It wrote one file, its disclosure script, in
the session's scratch directory outside the repository, and it ran no command before running
that script with Node. The script read the two memory files listed below and nothing else: no
data file and no file of the repository. It appended this entry with `fs.openSync(path,
O_WRONLY | O_APPEND)` and `fs.writeSync` (ADR-0003 note 5), asked the file system nothing else
about `PROGRAM/HANDOFF.md`, and kept a copy of these bytes in the scratch directory. The script
took the time 2026-11-22T20:13:53.059Z from this machine's clock just before appending.

What the harness loaded. At the start of the session the harness put one memory index,
`MEMORY.md`, into the session's context and named the directory it came from,
`C:\Users\LEET\.claude\projects\C--Users-LEET\memory\`. That directory is the one store, and the
session opened no other. In it the session and its script opened two files and no more: the
index and `project_kober.md`.

Memory files opened by the script, each with its size, modified time and SHA-256 as the script
found them. The session will record them again at its end.

- `MEMORY.md`: 20042 bytes, modified 2026-11-22T01:46:57.731Z, SHA-256
  `7e74ab1cb3b2efcdda278cc9a7a3ca4b8674d2649bdf4f1609f7cd8b97d5d453`
- `project_kober.md`: 2243 bytes, modified 2026-08-25T19:22:03.864Z, SHA-256
  `b093bc495be4bedc56f421c2cc6852dab6a66ab5b621a108cbf49112ed64f7d6`

Lines of the index that name KOBER, FRIEDMAN, FR13DMAN or SYNDEOM, in any letter case: 6 lines,
at lines 90, 91, 93, 94, 114, 115 of the file, copied by the script from the file and not typed.

```text
## KOBER (Linear A falsification infrastructure)
- [Repo pointer + machine hazards](project_kober.md) — `C:\Users\LEET\KOBER`, remote `Quigles1337/KOBER` (**public**); the constitution `PROGRAM/KOBER-PROGRAM.md` is the sole authority — always run its §4 loop from the repo, never from memory. No program state is recorded here or in the linked file (memory-policy ADR).
## FR13DMAN (FRIEDMAN — designedness-detection instrument)
- [Repo pointer + machine hazards](project_friedman.md) — `C:\Users\LEET\FR13DMAN` / `Quigles1337/FR13DMAN` (**public**, leetspeak name); sibling of KOBER; the constitution `PROGRAM/FRIEDMAN-PROGRAM.md` is the sole authority — always run its §4 loop from the repo, never from memory. No program state is recorded here or in the linked file (ADR-0003).
## SYNDEOM (AI-proof calibration — third sibling of KOBER/FRIEDMAN)
- [Repo pointer + machine hazards](project_syndeom.md) — `C:\Users\LEET\Syndeom` / `Quigles1337/Syndeom` (**public**); the constitution `PROGRAM/SYNDEOM-PROGRAM.md` is the sole authority — always run its §4 loop from the repo, never from memory. No program state is recorded here or in the linked file (SD15 / FR13DMAN ADR-0003).
```

Withheld: 118 lines of the index, given by count and not reproduced. 81 of them hold text and
37 are empty. How the count was taken: the script decoded the file as UTF-8, removed carriage
returns (0 found), and split the text at line feeds, a final line feed ending the
last line and starting no new one. That gave 124 lines. 6 matched one of the four names without
regard to letter case, and 124 - 6 = 118.

This program's own memory file, `project_kober.md`, whole: 40 lines (0 carriage returns
removed), copied by the script from the file and not typed.

```text
---
name: project-kober
description: "KOBER program - repo C:/Users/LEET/KOBER; constitution and ALL program state live IN the repo, never here"
metadata: 
  node_type: memory
  type: project
  originSessionId: 9c3fd148-2517-4d33-841b-47b145a06320
  modified: 2026-08-25T00:00:00.000Z
---

**KOBER** - repo `C:\Users\LEET\KOBER`, remote `https://github.com/Quigles1337/KOBER` (**public**).

This file locates the repo and records machine hazards. Per the memory-policy ADR it records NO
program state: no phase, gate, claims, commits, toolchain versions, escalations, or next actions.

**Standing rule:** the repo is the sole memory of the program (constitution at
`PROGRAM/KOBER-PROGRAM.md`). Every session: read the constitution, then run the section 4 loop
from `PROGRAM/STATE.md` and `PROGRAM/HANDOFF.md`. Never resume from this file. Discover the
default branch, toolchain, and every other value from the repo - never assume one, and never
carry a value across from the sibling program.

**Hard invariant (kept deliberately; a standing prohibition, not state):** KOBER never proposes
a decipherment.

**Never work in the sibling FRIEDMAN tree** - identical `PROGRAM/` schema, and its sessions may
be live concurrently.

Machine and harness hazards:
- elan resolves the Lean toolchain from the current directory; `lake --dir` is not sufficient,
  so cd into the Lean directory before invoking it.
- poppler lives at `C:\Users\LEET\tools\poppler-26.02.0\poppler-26.02.0\Library\bin` and is on
  the user PATH (the winget source is broken - InternetOpenUrl).
- ScienceDirect and academia.edu return 403 to tool fetches; the Crossref API and institutional
  repositories work.
- A bare `cat > file` with no heredoc blocks on open stdin (cost a 10-minute timeout); attach the
  heredoc directly or add `</dev/null`, and pass commit messages via `-F file`.
- `git symbolic-ref refs/remotes/origin/HEAD` may fail on a working copy that was init-ed then
  remote-added; fallback `git remote show origin`, or repair with `git remote set-head origin -a`.
- This machine has autocrlf active and MSYS grep reports false carriage returns; CRLF conversion
  can silently break byte digests. Verify line endings with `git ls-files --eol`, never by eye.
```

End of the disclosure.

LAUNCH CONTEXT. Recorded 2026-11-22T20:22:03Z below the disclosure, which is unchanged (HEADER,
below).

This conversation began with the launching message; no turn preceded it. The harness's record
gives its time as 2026-11-22T20:11:09.997Z, in a session started in `C:\Users\LEET`, not in the
repository directory (K8). The message was copied by script from the harness's record of this
conversation: one JSON-lines file named for the session identifier, in the directory that holds
the memory directory. The identifier, ced3a2e9-e389-4a3e-8adc-8ecb88f95fcf, is the folder above
`scratchpad` in the scratch path the harness names. The file was opened by its exact name;
nothing in that directory was listed, and no other record was opened (STATE, note 3, with Al's
addition). Every record in it that carries a sessionId carries that one. The launching message
is the first record of type `user` (record 5 of the file): parentUuid null, turnPosition
promptIndex 1 and turnIndex 1, origin human, harness version 2.1.322. The 4 records before it
are of these types, none of them a user or assistant message:

    mode, permission-mode, session-owner, file-history-snapshot

The record holds the message as one string of 4837 characters: the text between the opening and
closing tag lines of a paste wrapper (`<pasted_content id="57c8">`), with only white space
outside the wrapper. By STATE's first reading the wrapper is not the message. The message is 68
lines and 4779 characters.

Its first paragraph, lines 1 to 11, was compared by script with the Session-N block of §6 in
PROGRAM/KOBER-PROGRAM.md (the lines between the fence lines under `### Session N — resume`):
identical, character for character (1025 characters, 1031 bytes as UTF-8 with line feeds,
SHA-256 441207184fbbb0ab9e681242f5ead7c1bf15cb298450552bfc15f1dda749a91d for both, the
digest that Session 7's record gives for the same block).
The message carries more than §6's text and says so itself, so this session is not an exam
(ADR-0003, the corollary). It ran no cold-start test and rehearsed none.

Harness attachments (STATE, first reading). In the session's context, though not in that
record's message string, the harness placed blocks of its own around the message: the memory
index (disclosed above), the account's e-mail address, a note on commit attribution, the lists
of tools, skills and agent types, instructions from connected tool servers, and facts about the
environment (working directory C:\Users\LEET, not a git repository; platform; the date). Only
the memory index concerns this program.

AL'S MESSAGE, FIRST PART (verbatim): lines 1 to 43 of its 68, from its first line to "The
closing of Gate G0 stands." Line 44 is empty. Lines 45 to 68 are the second of the two things
the message orders: the licence, with rulings K15 and K16 and the order to stop before that
commit. Al ordered the record of K9 to K14 committed and pushed "on its own", so this commit
carries the first part only, and the second part is recorded verbatim lower in this block, with
the licence work. Nothing of the message is left out between the two parts but that empty line.

```text
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

This message carries more than §6, so this session is not an exam. I am ruling on the state at
commit 00416bc. If master is anywhere else when you orient, stop and tell me. After the disclosure
and orientation the session does two things, in this order. P1.1 stays the next action after them.

First, record rulings K9 to K14 verbatim in STATE and HANDOFF, add K14's note to ADR-0003, and
commit and push that on its own.

K9 (Session 7's memory reading). Accepted, all six calls. On the fifth: a memory line that names a
decision record as its reason for holding no state is a pointer, and not program state.

K10 (Session 7's disclosure order). Not a breach, in any of the three things. A disclosure script
may read data that the session itself wrote for it, may take the size, modified time and digest of
the memory files it discloses, and may keep a copy of its own bytes. The append asked the file
system nothing about HANDOFF, as K4 orders.

K11 (the slip). It is a slip and not a guess. The repo says where the crate is, and nothing was
built on the wrong name.

K12 (the six places where the repo did not say how). Accepted. None was a guess about the program.
Session 7's five notes stay.

K13 (the pointer after the staged P1.1 text). It stays as a pointer. P1.1 reads the two passages
together, and if the combination set is a choice, the choice gets an ADR.

K14 (a sixth note for ADR-0003). Add it after note 5, marked as my ruling of today, in these words:
"Before the append, the session and its disclosure script read the constitution, this ADR and the
memory being disclosed, and nothing else on the machine except data that the session itself wrote
for the script. The script records the size, modified time and SHA-256 of each memory file it opens,
and the session records them again at its end, to show that it wrote no memory."

The closing of Gate G0 stands.
```

THE MEMORY, READ AGAINST ADR-0003 D1. No standing is at stake, because this is not an exam; the
reading is made because D1 binds every session. The two memory files that this session's
disclosure covers are byte for byte the two that Session 7's disclosure covered: the same sizes,
modified times and SHA-256s (the two disclosures in this file). K9 accepts Session 7's reading
of them, all six calls: no line of them is program state. This session read them again, against
STATE at `00416bc`, and reads them the same way. From memory it took the repository's location
and the machine hazards, and nothing else.

ORIENT (§4.1), after the disclosure. Top level `C:/Users/LEET/KOBER`; `origin` =
`https://github.com/Quigles1337/KOBER.git`; `master` at 00416bc56f2fa40fbd38c1f7360aa640aebacc8e
locally, at `origin/master` and on the remote (`git ls-remote origin`: HEAD and
refs/heads/master). That is the state Al ruled on, so the session went on.
`git symbolic-ref refs/remotes/origin/HEAD` gave refs/remotes/origin/master with no fallback
needed. `git status`: PROGRAM/HANDOFF.md modified by this session's append and nothing else;
`git ls-files --eol PROGRAM/HANDOFF.md`: `i/lf w/lf`. Read: STATE in full; HANDOFF Sessions 7
and 6; CLAIMS in full (CLAIM-0001 to 0003 VERIFIED, 0004 to 0006 UNKNOWN, as STATE says);
ADR-0000 to 0002 (ADR-0003 before the disclosure); SOURCES; README; scripts/check.sh, the
workflow and the pins. `bash scripts/check.sh` printed ALL GREEN at `00416bc` (Lean 4.33.1,
`lake build` 4 jobs; `cargo test` 1 passed; clippy at -D warnings clean). CI: `check` success
for `00416bc` (run 45064367979, a push, 2026-11-22T20:04:53Z; one job, `gate`, 10 steps, each a
success); STATE's CI line named `44c0b45`, one run behind, as it says it is. `gh repo view`:
PUBLIC, default branch master, no licence detected. Both stored files under sources/ reproduce
the SHA-256s in SOURCES S-0001. The scan of lean/ for `sorry` and `admit` matches one doc
comment in lean/Kober/Basic.lean and nothing else. STATE and the repository agree.

ASSESS AND PLAN (§4.2, §4.3). Phase 1; Gate G1 open, nothing done; NEXT-SINGLE-ACTION P1.1; one
open escalation, Al's judgment of the Gate G0 exam, which his message answers. The message sets
this session's work ahead of P1.1: two things, in order, with P1.1 the next action after them.
The session does those two and does not start P1.1.

FIRST COMMIT: rulings K9 to K14 recorded, on top of `00416bc` and on its own, as ordered.
- STATE: K9 to K14 verbatim in a section of their own after K1 to K8, with the sentence that
  follows K14 in the message, copied by script from the one script-made copy of the message.
  Rewritten for the result: in the header, the updated line, the gate line, the launch line and
  the build line; the cold-start row of the G0 table; Blockers; Standing escalations (Al's
  judgment of the exam closed by K9 to K12; the licence opened); one paragraph at the head of
  NEXT-SINGLE-ACTION, and K13 under Session 7's pointer; one paragraph under Session 7's five
  notes (K10, K12, K14). The diff of STATE holds no other change.
- ADR-0003: note 6 added after note 5, in Al's words, copied by script from K14 with line breaks
  added, and marked as his ruling of 2026-11-22 UTC. The diff of that file is that one addition.
- HANDOFF: this block so far, with its header completed.
- Not touched: the constitution, CLAIMS, SOURCES, ADR-0000 to 0002, README, all code, sources/
  and analysis/.
- The licence is not in this commit. STATE lists it as the one open escalation, so that a
  successor who finds unaccepted licence files in a working tree knows what they are.
- Verified before the commit: `bash scripts/check.sh` printed ALL GREEN on this tree;
  `git ls-files --eol` shows the three changed files `w/lf`; the verbatim block in STATE, the
  quotation in ADR-0003's note 6 and the block above equal the corresponding lines of the one
  script-made copy of Al's message (checked by script).

HEADER: completed with this commit. The one provisional line (`SESSION: 2026-11-22 UTC
(provisional header, completed after orientation)`) was replaced by the four header lines at the
top of this block, and nothing else was changed. Checked by script: the 75,168 bytes before the
header (this file at `00416bc` and the separator) and the 5,980 bytes of the disclosure after
its header line, from the empty line under the header to "End of the disclosure.", are byte
for byte what they were. SHA-256 of those 5,980 bytes, before and after:
6fb26dbf03afabe61d021637340b720d91c6bd046215c2944d49f0e35b2ac639.

AL'S MESSAGE, SECOND PART (verbatim): lines 45 to 68 of its 68, recorded here with the licence
work, as the first part says. Copied by script from the same script-made copy of the message.

```text
Second, the licence.

K15 (licence). The PolyForm Noncommercial License 1.0.0, under "Required Notice: Copyright 2026
Alexander David Zalewski (https://github.com/Quigles1337/KOBER)", by an ADR of its own under the
next free number. Follow FRIEDMAN's ADR-0005 as it stands at FR13DMAN commit
2ffa3e7bd56087f79bdcfe4b9649e2d86844b305, so far as it applies to KOBER, and record that commit. The
commercial-licence contact line is mine: "For commercial licensing, contact Alexander David Zalewski
at adz@alphx.io." KOBER has carried no licence until now: state that, and grant none for earlier
versions. As in FRIEDMAN's ADR-0005, SYNDEOM's D2(b) is not followed: nothing in KOBER is separately
controlled. Retrieve the licence text yourself from the PolyForm project's own repository, pinned by
commit, and record it in SOURCES.

K16 (what the licence does not cover). KOBER holds third-party material that FRIEDMAN does not: the
two stored files under sources/, and whatever the analysis files transcribe from S-0001. Each keeps
its own terms, and the ADR states them. Before you write that part, read my ruling of 2026-10-13 on
NC- and ND-licensed originals as Syndeom ADR-0003 D5 records it, with that ADR's line on ND licences
and derived artifacts. That ruling was made for SYNDEOM. Do not apply it here by yourself: in this
session move, remove and rewrite nothing under sources/ or analysis/. State in the ADR what holds
for that material now, and at the stop put to me, with the facts, whether the stored copy stays in
the tree and what in the analysis files is transcribed from the paper.

Prepare the licence in the working tree, run the gate, and stop before the commit. Show me the ADR
in full, the first lines of LICENSE and the README's licence section, and list every other file
changed. Commit only when I answer "accepted"; then push, confirm CI and stop.
```

AFTER THE FIRST COMMIT. `8a01621` was pushed at once (`00416bc..8a01621`), and CI `check`
succeeded for it (run 45066086960, a push, 2026-11-22T20:22:35Z; one job, `gate`, 10 steps,
each a success).

THE LICENCE (K15, K16): prepared in the working tree on top of `8a01621`, and shown to Al
before any commit.

What was read, and where. Nothing entered from memory (E5).
- FRIEDMAN's ADR-0005, `LICENSE`, README, SOURCES and manifests at FR13DMAN commit
  2ffa3e7bd56087f79bdcfe4b9649e2d86844b305, the commit K15 names, through the GitHub API. The
  FR13DMAN working copy on this machine was not opened.
- Syndeom ADR-0003 at the tip of `Quigles1337/Syndeom` `main`,
  d6771abf49cc47902b245d2c7b71048d9d5078fe (GitHub API, 2026-11-22T20:23:26Z): its Status, D5,
  the fourth flagged choice with Al's ruling of 2026-10-13, and the Consequences line on ND
  licences. Read before D2 of ADR-0004 was written, as K16 orders, and not applied.
- The PolyForm text, retrieved from the PolyForm Project's own repository and pinned at commit
  a2316cfa35d3947fdc5af4bcc1f321662bfd79d8, with that repository's own terms and the SPDX
  entry: S-0006.
- The CC BY-NC-ND 4.0 legal code and Crossref's statement on the metadata its REST API returns:
  the addition to S-0001.
- In this repository: both analysis files in full; the fields of the stored Crossref record;
  the text of the stored PDF (`pdftotext`, written outside the repository), to count what the
  analysis files transcribe from it. The FLORE URL in S-0001 was fetched again and returned
  the stored copy byte for byte.

What was written. Nothing under sources/ or analysis/ was moved, removed or rewritten (K16).
- `LICENSE` (new): K15's Required Notice line, one blank line, the PolyForm text unchanged.
  4,660 bytes, SHA-256 bfcfd77d3cf20c785705de07a26be0f9176514e78394b9cdeb27221011dfcb5c.
- `PROGRAM/DECISIONS/ADR-0004.md` (new): the licence ADR, under the next free number. K15 and
  K16 verbatim; FRIEDMAN's D1 to D5 quoted and followed so far as they apply; Syndeom ADR-0003
  D5 quoted and not applied; D1 to D5; eight readings of the executor's, put to Al.
- `README.md`: a Licence section, after FRIEDMAN's, which also names the stored paper and what
  the analysis files transcribe as not covered.
- `PROGRAM/SOURCES.md`: S-0006 (the licence text, new); an addition to S-0001 with the terms of
  the two stored files as retrieved this session. Until now SOURCES recorded no terms for the
  stored Crossref record itself: an E10 gap, recorded as one.
- `engine/Cargo.toml` and `lean/lakefile.toml`: one line each,
  `license = "PolyForm-Noncommercial-1.0.0"`.
- `PROGRAM/STATE.md`: the Licence bullet; the licence escalation closed and K16's two
  questions opened; Blockers; the build line; the paragraph at the head of NEXT-SINGLE-ACTION.
- This block.

Verified before Al was shown anything: `bash scripts/check.sh` printed ALL GREEN on the tree
with the two `license` lines; `Cargo.lock` and `lean/lake-manifest.json` are unchanged
(`git status`); `git ls-files --eol` shows every new and changed text file `w/lf`; `LICENSE`
from its third line on hashes to the digest of the retrieved text; the quoted blocks in
ADR-0004 equal the corresponding lines of the files they are copied from, and the Required
Notice and the contact line equal K15's words (checked by script).

THE STOP, as ordered: before the commit. Al was shown ADR-0004 in full, the first lines of
`LICENSE` and the README's Licence section, with a list of every other file changed. Put to him
with them:
- the eight readings in ADR-0004;
- K16's two questions, with the facts: whether the stored copy of the paper stays in the tree,
  and what in the analysis files is transcribed from it (ADR-0004, Context);
- that P1.1 will write the paper's sign inventory, value domains and attested combinations
  into Lean files, so his answer on the second question may bear on it;
- that the first commit records the first part of his message only, and whether he wants that
  otherwise.

AL'S ANSWER (verbatim): his second message in the conversation, received 2026-11-22T21:01:00Z
(the harness's record: record 726 of the same file, the second record of type `user` that
holds a pasted message; turnPosition promptIndex 2 and turnIndex 2, origin human). Copied from
that record by script. The harness delivered it inside a paste wrapper, which is not
reproduced. It is 18 lines, and its paragraphs are single long lines, kept as he sent them.

```text
Accepted, with K17 and K18 below.

K17 (the stored copy of the paper). It leaves the tree. I am going to ask the paper's authors, and it comes back only on my ruling. History is not rewritten: the commits that already hold the copy keep it. No other NC- or ND-licensed original is committed without my ruling.

K18 (what the analysis files transcribe). It stays as it is, and P1.1 goes ahead. My SYNDEOM line on derived artifacts is not applied to KOBER: this program formalizes the paper's published result, and it states the paper's data and quotes its statements, with attribution, so that the formal statements can be checked against them. Whether that needs the authors' permission is my question and not the executor's, and I am asking them. I settle it before publication packaging (P4.3) or before I grant any commercial licence, whichever comes first. Until then a session quotes no more of the paper than checking a statement needs.

The eight readings are accepted as written, the second included: the Lean package keeps its licence line. My message stays in two parts in HANDOFF. Write the pdftotext hazard to this program's memory file, and nothing else.

First, the licence commit. Put K17 and K18 into ADR-0004 verbatim in place of its paragraph "Not decided here", and bring the ADR's Consequences, STATE and HANDOFF into line with them. Change nothing else that I was shown. The stored copy is still in the tree at this commit. Commit, push and confirm CI.

Then prepare the removal as a commit of its own, and stop before you commit it.

1. Copy the stored copy to C:\Users\LEET\KOBER-sources\S-0001, creating the directories and keeping the file's name, and check there that its SHA-256 is the one S-0001 records. Only then remove it from the tree. The Crossref record stays.
2. Where the copy is cited, add and do not rewrite: a dated addition to S-0001, saying where the copy now is, that the digest and the address still pin what was read, and which commits still hold it; a dated line appended to each CLAIMS entry that cites the path, with no status changed and no existing line touched; one dated line under the header of each analysis file, and nothing else in those two files.
3. Bring into line what would otherwise be untrue: the README's licence section; in STATE the Gate G0 row, the exam note that names the two stored files, the Licence bullet and the escalations; the sentence at the head of SOURCES about stored copies; and ADR-0004, by a dated amendment at its end that leaves its accepted text as it is.
4. Record C:\Users\LEET\KOBER-sources in SOURCES and STATE as a local store that is not part of the repository. Nothing in it is committed.

At the stop, list the files and show me every line you added or changed outside HANDOFF. Commit only when I answer "accepted"; then push, confirm CI and stop. P1.1 stays the next action.
```

AFTER THE ANSWER: the licence commit, on top of `8a01621`.
- What differs between what Al was shown and what is committed, all of it on his order:
  - ADR-0004: K17 and K18 verbatim in D2, in place of the paragraph "Not decided here"; two
    bullets of its Consequences brought into line (third-party intake, which K17 adds a rule
    to; K16's two questions, now ruled). The committed file was built from a copy of the file
    as shown (SHA-256 60fdbd8f695882d489456670d4d346826f80d2ed1cc5d8007dbccf2ab5cd8707) by
    those replacements and nothing else. In the second bullet the executor also corrected a
    fact of its own (CONFUSIONS, below).
  - `LICENSE`, README, SOURCES and the two manifests: byte for byte as they stood at the stop
    (SHA-256 taken at the stop and compared before the commit).
  - STATE: K17 and K18 verbatim in a section of their own; K16's two questions closed; the
    removal opened as the one escalation; the authors' permission named as Al's question and
    not the executor's; K18's rule beside NEXT-SINGLE-ACTION; the Licence bullet; Blockers.
  - This block, from "AL'S ANSWER" on, and a few lines of the fields below that his answer
    made untrue. The block's second part was written for the stop and had not been committed.
- The eight readings are accepted as written, the second included. The message stays in two
  parts.
- Memory: one write, which his answer orders (MEMORY, below).
- The dates in the README and in STATE stand: his answer came on 2026-11-22 UTC.
- Verified before the commit: `bash scripts/check.sh` printed ALL GREEN on the tree of the
  commit; `git ls-files --eol` shows every new and changed text file `w/lf`; the two verbatim
  blocks that hold K17 and K18, and the block above, equal the corresponding lines of the one
  script-made copy of his answer (checked by script).
- The stored copy of the paper is still in the tree at this commit, as his answer says. Its
  removal is what the session prepares next, as a commit of its own, and it stops before
  committing it.

§4.5 FIELDS, AT THE LICENCE COMMIT. The session goes on from this commit to prepare the removal
that K17 orders. What that adds is recorded under these fields when it is committed.

PHASE / GATE: Phase 1 — THEOREM / Gate G1 open, nothing done: no G1 criterion moved, and none
  was meant to. Gate G0: the closing stands (K9 to K12).
ADVANCED:
- The memory disclosure first (ADR-0003 D2), by one run of one script that read the two memory
  files and nothing else; then §4.1 ORIENT. `master` was at `00416bc` locally and on the
  remote, the state Al ruled on.
- First commit, `8a01621`: K9 to K14 verbatim in STATE; Al's judgment of the Gate G0 exam
  closed; note 6 in ADR-0003 (K14); this block's first part. Pushed; CI green.
- The licence (K15, K16): ADR-0004, `LICENSE`, README § Licence, S-0006, the terms of S-0001's
  two stored files, two `license` lines, STATE. Shown to Al, accepted
  with K17 and K18, and committed with them in place.
- No CLAIMS transition: none was earned and none was owed. CLAIMS.md, the constitution,
  ADR-0000 to 0002, the Lean and Rust sources, and everything under sources/ and analysis/ are
  untouched.
BELIEF DELTAS:
- Session-start me took the stored paper's standing as settled: S-0001 and ADR-0000's addendum
  say that an unmodified copy with attribution, shared non-commercially, is what its licence
  allows. The legal code, read this session, has a second limb beside that one: Adapted
  Material may be produced "but not Share[d]". Nothing in the repository had looked at the
  analysis files under that limb. K16 points there. Evidence: the legal code's Section 2(a)(1)
  as ADR-0004 quotes it. The executor made no judgment of it.
- The analysis files hold more of the paper than "an extraction" suggests when counted: about
  880 words in quotation marks in one file and about 200 in the other, against a paper of
  about 11,100, with the counts of its Tables 1 and 2 and two tables of the readings it names
  (17 and 23 rows).
  Evidence: the script counts in ADR-0004.
- SOURCES had no terms for the stored Crossref record. Evidence: S-0001 at `8a01621`. Crossref's
  own page says "almost none" of its metadata is subject to copyright; the record holds no
  abstract.
- The stored PDF can be had again from where it came: the FLORE URL returned it byte for byte
  on 2026-11-22. The digest and the URL in S-0001 are enough to find the same bytes again,
  now that K17 takes the copy out of the tree.
- The question the executor could not judge was Al's to take off the table, and he did it by
  owning it: K18 keeps the transcriptions, sends P1.1 ahead and makes the authors' permission
  his question, with one rule for sessions meanwhile (quote no more than checking a statement
  needs). Evidence: his answer, below THE STOP.
- The PolyForm repository's default branch is a branch named `1.0.0`, and its head was the
  commit FRIEDMAN pinned earlier the same day. Three retrievals gave the same bytes.
- Lake has a `license` field. Evidence: `PackageConfig` in the pinned toolchain's Lake source.
- K10 and K14 made the disclosure simpler than Session 7's: the script read the two memory
  files and no data file, and one run sufficed.
- STATE's CI line lagged by one run again, as it says it does.
CONFUSIONS:
- The first build of the first commit compared §6's block with a trailing line feed and got
  1,032 bytes and a digest unlike Session 7's. Caught before the commit, by comparing with
  Session 7's record; the build now asserts that digest. Cost: one rebuild. No doc fix owed.
- A URL for a Crossref page on metadata licences was guessed, not discovered (E7). It returned
  a 327-byte stub. Nothing rests on it: the statement in S-0001 is from the REST API page,
  which was fetched by its known address. A slip of the kind K11 names; the fix is the habit.
- The first count of quoted passages paired quotation marks wrongly around one-character
  readings in `analysis/R0.md`. Caught from its own output before any figure was used.
- How to record a message whose first order is a commit "on its own". The session put lines 1
  to 43 in the first commit and lines 45 to 68 with the licence. Cost: the message stands in
  two parts in this block. Put to Al at the stop; his answer: it stays in two parts.
- `pdftotext` writes Latin-1 on this machine unless told otherwise. The first count read its
  output as UTF-8, and the built ADR showed a broken copyright sign in the paper's own
  statement. Caught on reading the built file. The text was extracted again with `-enc UTF-8`
  and the counts were made again; they rose, from 52 and 33 passages found to 53 and 38.
  Cost: one rebuild. It is a machine hazard of the kind executor memory may hold. Put to Al
  at the stop; his answer ordered it written to this program's memory file, and it was
  (MEMORY, below).
- One sentence of the ADR as Al was shown it was wrong in a fact: it said that CLAIM-0001 to
  CLAIM-0003 cite the stored copy by path. CLAIM-0003 cites it as "the stored VOR (S-0001)",
  without the path. Found when his answer asked for a line in each CLAIMS entry that cites
  the path. The sentence stood in the Consequences bullet that his answer orders brought into
  line, and the committed bullet names CLAIM-0001 and CLAIM-0002. Reported to Al.
- A shell one-liner meant to edit the session's own templates carried backticks inside double
  quotes, and the shell tried to run their contents as commands. Nothing ran and no file was
  changed (the edit is written only after every anchor is found). The edits were made with
  the file-editing tool.
- The README's sentence "until 2026-11-22 UTC" names the day the licence commit is made. It
  was written before Al's answer; the day was checked again at the commit.
HONESTY CHECK: CLAIM-0001 to 0006 re-read. No transition, no downgrade. S-0001 and ADR-0000
  say the stored copy's storage is compliant. This session neither confirms nor withdraws
  that: it quotes the licence and put the question to Al, and D5 of ADR-0004 leaves the
  earlier sentences as written. K17 and K18 are his answer, and the registers quote them and
  add nothing to them. The counts of transcribed passages are a script's, made
  against `pdftotext` output: the 2 passages it could not match, both figures in the first
  file, were not checked against the page renders. The eight readings in ADR-0004 are labelled
  as the executor's. Nothing entered a register from memory: every term and digest in S-0001's
  addition and in S-0006 was retrieved this session.
DRIFT CHECK: clean. Rulings, a licence and its record: no sound value, no claim about what any
  tablet says. Scope refused: applying SYNDEOM's ruling to KOBER; touching sources/ or
  analysis/ before Al ruled; starting P1.1; a byte check for PROGRAM/ in the gate; any memory
  write but the one Al ordered; reading SYNDEOM's ADR-0010, which K15 does not name.
NEXT-SINGLE-ACTION: see STATE.md. P1.1, unchanged: formalize the constraint system as Lean data
  conditional on R0a, to the staged specification, read with Session 7's pointer and K13, and
  bound by K18's rule on quoting.
ESCALATIONS:
- Al: the removal of the stored copy of the paper (K17). The session prepares it as a commit of
  its own and commits it only on his answer "accepted". STATE lists it as the one open
  escalation.
- Al's, and not the executor's: whether what the analysis files transcribe needs the authors'
  permission (K18). He is asking them. No session acts on it.
- CI for the licence commit is confirmed by this session after the push. The repo's record of
  it is made with the removal, or by the next session at ORIENT, as STATE's build line says.
- Carried, not open: the CLAIM-0005/0006 sequencing caveat under the G1 table in STATE.
STOP-REASON: none yet. The session has not stopped: it goes on to prepare the removal, and its
  stop is recorded with that. Default branch green: the gate passes on the tree of this commit.
MEMORY (K14; ADR-0003 note 6). One write, and Al's answer orders it: "Write the pdftotext hazard
to this program's memory file, and nothing else." Made by script at 2026-11-22T21:03:55Z: 3
lines appended to `project_kober.md`, at the end of its list of machine hazards. Nothing else in
that file was changed, and no other memory file was written. The lines, copied by script from
the record of the write:

```text
- poppler's `pdftotext` writes Latin-1 on this machine unless told otherwise; read as UTF-8, its
  non-ASCII characters (the copyright sign, under-dotted signs) come out broken. Pass
  `-enc UTF-8`.
```

The two memory files the disclosure covers, taken again by script at 2026-11-22T21:07:28Z:
    MEMORY.md: 20042 bytes, modified 2026-11-22T01:46:57.731Z, SHA-256
      7e74ab1cb3b2efcdda278cc9a7a3ca4b8674d2649bdf4f1609f7cd8b97d5d453
      (as the disclosure records it)
    project_kober.md: 2442 bytes, modified 2026-11-22T21:03:55.734Z, SHA-256
      b881fe7d2953ea170bfa84c40770eaa514558f583a3d18cf460393e5a4b06fd9
      (before the write: 2243 bytes, modified 2026-08-25T19:22:03.864Z, SHA-256
      b093bc495be4bedc56f421c2cc6852dab6a66ab5b621a108cbf49112ed64f7d6,
      as the disclosure records it; those 2243 bytes stand unchanged at the head of the file)
No other memory file was opened at any point, and no other store.

AFTER THE LICENCE COMMIT. `5831b21` was pushed at once (`8a01621..5831b21`), and CI `check`
succeeded for it (run 45070339969, a push, 2026-11-22T21:07:54Z; one job, `gate`, 10 steps,
each a success).

THE REMOVAL (K17): prepared as a commit of its own on top of `5831b21`, as Al's answer orders,
and shown to Al before the commit. The four points are his, in his numbering.

1. The copy first. `C:\Users\LEET\KOBER-sources` did not exist: the session looked before it
   created anything. It created `C:\Users\LEET\KOBER-sources\S-0001` and copied the stored
   file there under its own name. The SHA-256 of the copy, taken there at
   2026-11-22T21:09:05Z, is the digest that S-0001 records, which the command read from
   SOURCES.md and did not carry typed:
   b08c56357cda7fb1cf53b8bf6a97982b8f8fec9c6938032f00c345d8b1c83e39
   (2,672,215 bytes, byte for byte the file in the tree). Only then was
   `sources/corazza-etal-2021-jas-105214.pdf` removed from the tree (`git rm`). The stored
   Crossref record was not touched. The local store is outside the repository: git finds no
   repository at that path.
2. Added, and nothing rewritten. A dated addition to S-0001: where the copy is; that the
   digest and the FLORE address still pin what was read; that the 14 commits from `5f98231`
   through `5831b21` still hold it, all as one blob. A dated line at the end of the
   transitions of CLAIM-0001 and of CLAIM-0002, the two entries that cite the path, with no
   status changed and no existing line touched; and, after Al's second answer, the same line
   for CLAIM-0003 (below). One dated line in each analysis file, placed directly under its
   title, and nothing else in those two files.
3. Brought into line, because it would otherwise be untrue. The README's Licence section: one
   bullet. In STATE: the first row of the Gate G0 table; note 6 on the exam's steps, which
   named the two stored files; the Licence bullet; the escalations; and with them the updated
   line, the build line, Blockers, the K17 bullet under his rulings, and the paragraph at the
   head of NEXT-SINGLE-ACTION. In SOURCES: the sentence at its head about stored copies.
   ADR-0004: a dated amendment at its end. Its accepted text is unchanged: the file at
   `5831b21` is a prefix of the new one (checked by script).
4. The local store is recorded in SOURCES (its head) and in STATE (the header) as a directory
   that is not part of the repository, with nothing in it committed.

Verified before Al was shown anything, and again before the commit. `bash scripts/check.sh`
printed ALL GREEN on the tree without the PDF. `git ls-files --eol` shows every changed text
file `w/lf`. Lines added and removed in the commit, by `git diff --numstat` against `5831b21`,
this file left out (at the stop CLAIMS.md stood at 9 added, before CLAIM-0003's line):
    PROGRAM/CLAIMS.md: 13 added, 0 removed
    PROGRAM/DECISIONS/ADR-0004.md: 48 added, 0 removed
    PROGRAM/SOURCES.md: 28 added, 2 removed
    PROGRAM/STATE.md: 37 added, 29 removed
    README.md: 4 added, 3 removed
    analysis/P0.2-constraint-system.md: 1 added, 0 removed
    analysis/R0.md: 1 added, 0 removed
    sources/corazza-etal-2021-jas-105214.pdf: removed (a binary file)
The stored Crossref record's SHA-256 is as S-0001 records it. The copy in the local store was
hashed again after the build and gives the same digest.

THE SECOND STOP, as ordered: before the commit. Al was given the list of files and every line
added or changed outside this file. Put to him with them:
- where the one line stands in each analysis file: directly under the title, above the bullet
  that cites the path;
- CLAIM-0003, which cites "the stored VOR (S-0001)" and not the path, and so gets no line;
- one sentence of the executor's in STATE's new Local store bullet: that a session which needs
  the paper reads it in the local store, and first checks its SHA-256 against S-0001;
- S-0001's state line, which still reads INGESTED, because his order is to add to S-0001 and
  not to rewrite it. The addition says what the word now covers.

AL'S SECOND ANSWER (verbatim): his third message in the conversation, received
2026-11-22T21:25:32Z (the harness's record: record 1006 of the same file, the third record of
type `user` that holds a pasted message; turnPosition promptIndex 3 and turnIndex 3, origin
human). Copied from that record by script; the paste wrapper is not reproduced. It is 7 lines,
and its paragraphs are single long lines, kept as he sent them.

```text
Accepted, with one addition and no further stop.

CLAIM-0003 gets the same dated line as CLAIM-0001 and CLAIM-0002, with no status changed: its evidence is anchored in the same stored copy.

The rest is accepted as you wrote it: the line directly under each analysis file's title, the further lines you brought into line in STATE, your two phrases, and S-0001's state line with the addition that says what it now covers.

Commit, push, confirm CI and stop. P1.1 stays the next action.
```

AFTER THE SECOND ANSWER: the removal commit, on top of `5831b21`.
- His one addition: CLAIM-0003 has the dated line, at the end of its transitions, with no
  status changed and no existing line touched. Its first clause says what that entry cites
  ("the stored VOR (S-0001)"), because it names no path; the rest is the line of CLAIM-0002.
- Brought into line with that addition, and nothing else changed from what he was shown. In
  STATE, the closed escalation names CLAIM-0001 to CLAIM-0003. In ADR-0004's amendment, the
  bullet on what was added names the three entries and says why the third has its line.
  SOURCES, the README and the two analysis files are byte for byte what he was shown (SHA-256
  taken at the stop and compared before the commit).
- Accepted as written, by his answer: the line directly under each analysis file's title; the
  further lines brought into line in STATE; the executor's two phrases; S-0001's state line,
  with the addition that says what it now covers.
- The dates stand: his answer came on 2026-11-22 UTC.
- Verified before the commit: `bash scripts/check.sh` printed ALL GREEN on the tree of the
  commit, and the copy in the local store still gives the digest that S-0001 records.

§4.5 FIELDS, ADDITIONS AT THE CLOSE. They add to the fields recorded at the licence commit, and
they replace its NEXT-SINGLE-ACTION, ESCALATIONS and STOP-REASON.

PHASE / GATE: unchanged. Phase 1 — THEOREM / Gate G1 open, nothing done.
ADVANCED, added:
- The licence commit, `5831b21`, pushed; CI green.
- The removal of the stored copy of the paper (K17), as a commit of its own. Shown to
  Al, accepted with one addition (CLAIM-0003's line), and committed.
- No CLAIMS transition. Three CLAIMS entries gained a dated line with no status changed. The
  constitution, ADR-0000 to 0003, the Lean and Rust sources and the stored Crossref record are
  untouched.
BELIEF DELTAS, added:
- A stored source is cited by path in more places than its S-entry: two CLAIMS entries, two
  analysis files, STATE in four places, the README and the head of SOURCES. A citation by
  S-number and digest would have survived the move, and a citation by path did not. Evidence:
  the list of this commit's additions. Not changed here, because K17's order was to add and
  not to rewrite; a later session that cites a stored copy can cite the entry and the digest.
- "Cites the path" was the wrong test for which CLAIMS entries the removal reaches. Al's
  second answer gives the test that matters: whether the entry's evidence is anchored in the
  stored copy. CLAIM-0003's is, though it names no path. Evidence: his answer, below.
- The next disclosure will not match this one for `project_kober.md`: the ordered write
  changed its size, time and SHA-256 (MEMORY, in the fields at the licence commit, gives
  both). A successor that compares disclosures should expect 2,442 bytes and the digest
  recorded there, and three more lines of machine hazard in the file.
- A local store outside the repository now holds the one copy of the paper that sessions can
  open without the network. It is not the repository: a cold-start test cannot rest on it,
  and note 6 on the exam's steps in STATE now says so.
CONFUSIONS, added:
- "Under the header of each analysis file" can mean under the title or under the block of
  bullets that follows it. The session put the line directly under the title, above the bullet
  that cites the path, and showed Al the placement. Cost: none.
- Two failures of the session's own build scripts, each before anything was written. One
  compared a quoted sentence with text that had already been wrapped across a line. The other
  read the 2.6 MB blob of the paper through a call whose buffer holds 1 MB. Cost: one rerun
  each.
HONESTY CHECK, added: CLAIM-0001, CLAIM-0002 and CLAIM-0003 keep their statuses. Their
  evidence is intact in substance: the digest, the address, the copy in the local store and
  fourteen commits of history. But a reader who has only the tip of the repository can no
  longer open the paper there, and the three entries now say so in a dated line. At the stop
  CLAIM-0003 had no line, on the executor's strict reading of "cites the path"; Al's second
  answer overruled that reading and the line was added. Its first clause differs from the
  other two because the entry names no path: it says what the entry does cite. S-0001's state
  line still reads INGESTED; the addition under it says what that now covers, and Al accepted
  it so.
DRIFT CHECK: still clean. A file moved out of the tree and the record of it: no sound value,
  no claim about what any tablet says. Scope refused: rewriting history; removing the stored
  Crossref record; rewording the old citations in place of adding to them; starting P1.1.
NEXT-SINGLE-ACTION: see STATE.md. P1.1, unchanged and now unblocked by K18: formalize the
  constraint system as Lean data conditional on R0a, to the staged specification, read with
  Session 7's pointer and K13, quoting no more of the paper than checking a statement needs.
  Where it needs the paper, the copy is in the local store.
ESCALATIONS:
- None is open for the executor to bring to Al.
- Al's, and not the executor's: whether what the analysis files transcribe needs the authors'
  permission (K18), and whether the stored copy comes back to the tree (K17). He is asking the
  paper's authors. No session acts on either.
- CI for the removal commit is confirmed by this session after the push and reported to Al in
  the conversation. The repo's record of it is made by the next session at ORIENT, as STATE's
  build line says.
- Carried, not open: the CLAIM-0005/0006 sequencing caveat under the G1 table in STATE.
STOP-REASON: natural boundary — the two things Al's message ordered are done, and so is the
  removal that his answer added to them. Default branch green: `bash scripts/check.sh` prints
  ALL GREEN on the tree of this commit.
MEMORY, at the session's end (K14; ADR-0003 note 6). Taken again by script at 2026-11-22T21:27:38Z.
Nothing was written to memory after the one ordered write that the fields at the licence
commit record, and both files are as that record leaves them:
    MEMORY.md: 20042 bytes, modified 2026-11-22T01:46:57.731Z, SHA-256
      7e74ab1cb3b2efcdda278cc9a7a3ca4b8674d2649bdf4f1609f7cd8b97d5d453
    project_kober.md: 2442 bytes, modified 2026-11-22T21:03:55.734Z, SHA-256
      b881fe7d2953ea170bfa84c40770eaa514558f583a3d18cf460393e5a4b06fd9
No other memory file was opened at any point, and no other store.
