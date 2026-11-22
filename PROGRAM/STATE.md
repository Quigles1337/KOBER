# STATE

- **Updated:** 2026-11-22 UTC (Session 8, close: Al's rulings K9–K14 recorded in `8a01621`, and
  the closing of Gate G0 stands; KOBER licensed by ADR-0004 in `5831b21`, on his rulings K15
  to K18; the stored copy of the paper removed from the tree by the commit after it, on K17)
- **Phase:** 1 — THEOREM (opened 2026-11-22 UTC by Session 7, when Gate G0 closed)
- **Gate:** G1 **open**, nothing done yet (table below). Gate G0 **CLOSED 2026-11-22 UTC at
  `44c0b45`**, the tree its cold-start test passed on. The closing rested on readings that the
  exam session made of itself and named for Al to overrule. He ruled on them on 2026-11-22 UTC
  (K9–K12, below) and overruled none: the closing of Gate G0 stands.
- **Default branch:** `master`. Remote: `origin` = `https://github.com/Quigles1337/KOBER`
  (**public**; created by Al Session 3; CI = `.github/workflows/check.yml`).
  **ORIENT note (E7):** the constitution's `git symbolic-ref refs/remotes/origin/HEAD` failed
  on this working copy ("not a symbolic ref") until Session 4 ran `git remote set-head origin -a`
  — the repo was `git init`ed and the remote added afterwards, so the local `origin/HEAD` ref was
  never created (fresh `git clone`s get it automatically). If it ever fails again, the
  source-of-truth fallback is `git remote show origin` (prints `HEAD branch: master`); do not
  guess.
- **Launch (K8):** where Al launches a session from is his practice and not a condition of an
  exam (ruled 2026-11-22 UTC). Sessions 6, 7 and 8 were started in `C:\Users\LEET`, not in
  the repository directory, and took the repo's location from the line for this program in the
  executor's memory index, which ADR-0003 D1 allows memory to hold.
- **Build status:** "green" = `bash scripts/check.sh` prints `ALL GREEN` (lake build on Lean
  v4.33.1 + cargo test + clippy at deny-warnings; ADR-0002; the same script runs in CI). Last
  verified locally 2026-11-22 UTC by Session 8: at `00416bc`, at `8a01621`, at `5831b21`, and
  on the tree of the commit that removes the stored copy. CI: last known success on `master` @
  `5831b21` (run 45070339969, 2026-11-22T21:07:54Z; one job, `gate`, 10 steps). This line lags
  the last push by one run: check `gh run list -R Quigles1337/KOBER --branch master` at ORIENT.
- **Licence:** the PolyForm Noncommercial License 1.0.0, from the commit that adds `LICENSE`
  (ADR-0004; Al's ruling K15 of 2026-11-22 UTC). Copyright is Al's, held personally. No licence
  is granted for earlier commits. The licence does not cover third-party material: the stored
  Crossref record under `sources/`, and what the analysis files transcribe from S-0001, keep
  their own terms (ADR-0004 D2 and its amendment; K16 to K18). The stored copy of the paper is
  no longer in the tree (K17). The text and its provenance: `LICENSE`, S-0006.
- **Local store:** `C:\Users\LEET\KOBER-sources`, a directory on Al's machine beside the
  repository. It is not part of the repository, and nothing in it is committed. It holds the
  stored copies that are not committed: so far one, the paper, at
  `S-0001\corazza-etal-2021-jas-105214.pdf` (K17; SOURCES.md, its head and S-0001). A session
  that needs the paper reads it there, and first checks its SHA-256 against S-0001. K18's rule
  on quoting applies to whatever a session takes from it.

## Memory policy — ADR-0003

The policy is `PROGRAM/DECISIONS/ADR-0003.md`, written on 2026-11-22 UTC by Al's ruling K1:
before the exam, not after it as this file said until then. The ADR governs; this paragraph only
orients. Executor memory holds machine hazards and the repo's location, never program state
(D1). Every session launched with the §6 Session-N prompt discloses the memory the harness
loaded for it, first, appended to HANDOFF without reading it (D2, as K3 and K4 amend it). No
memory is written during an exam session (D3). A session running in the conversation context
that built the state under test is not cold, and a cold session is launched with the §6
Session-N prompt verbatim and nothing that carries program state (the corollary, K2).

## Gate G0 exit criteria — CLOSED 2026-11-22 UTC at `44c0b45`

| Criterion | Status | Evidence |
|---|---|---|
| CLAIM-0001 resolved to VERIFIED (P0.1) | **done** | CLAIMS.md CLAIM-0001 transition 2026-08-22; SOURCES.md S-0001 (stored PDF + Crossref record with SHA-256s; digests re-verified 2026-08-25). Since 2026-11-22 UTC the PDF is kept in the local store and not in the tree (K17), under the same SHA-256; the Crossref record is in the tree. |
| R0 enumerated with provenance (P0.3) | **done** | `analysis/R0.md` (R0-agg + R0-named + variants R0a–R0d, damage notation preserved, editions as cited by S-0001); CLAIM-0003 VERIFIED |
| Informal uniqueness theorem stated in CLAIMS (P0.4) | **done** | CLAIM-0004 (constraint corollaries), CLAIM-0005 (exact solution set, \|S\| = 3,794,740 — kernel-checked non-uniqueness), CLAIM-0006 (optimum characterization = the paper's actual claim); "uniqueness from constraints" deliberately NOT claimed (extraction §0/§7) |
| Repo scaffolded and green (P0.5) | **done** | ADR-0001 (Lean v4.33.1 pinned, no Mathlib), ADR-0002 (layout, Rust 1.91.0 pin, `scripts/check.sh` gate, CI activated Session 3); gate ALL GREEN 2026-08-22 and 2026-08-25 (×2) |
| SOURCES.md has license notes for every data source touched | **done** | Touched: S-0001 (INGESTED, CC BY-NC-ND 4.0) and S-0004 SigLA (three document pages fetched link-only, CC BY-NC-SA 4.0). Surveyed only: S-0002 (© EFA, terms not established), S-0003 (UNKNOWN), S-0005 (UNKNOWN) — each with the E10 no-ingestion rule. Resolved to done by Session 4 (reasoning: nothing touched lacks a license note; UNKNOWN *is* the E5/E10-mandated record). |
| Cold-start test (§2) | **done — passed 2026-11-22 UTC at `44c0b45`** | Session 7, a cold session: launched with the §6 Session-N prompt verbatim as the first turn of a new conversation (ADR-0003, K2). It disclosed its memory first (D2), recorded its standing (not disqualified: it read no disclosed memory as program state), and walked §4.1 from the repo: git facts → this file → HANDOFF Session 6 (then Sessions 4 and 5) → CLAIMS → ADR-0000 to 0003 → SOURCES and `analysis/` → `scripts/check.sh` ALL GREEN and CI `check` success on the tip. No point required a guess about the program. Record: HANDOFF Session 7 (MEMORY DISCLOSURE, STANDING, THE WALK, VERDICT). The session named its closest calls for Al to overrule; he ruled on them on 2026-11-22 UTC (K9–K12, below) and overruled none. History: Session 4 recorded a pass on 2026-08-25 and the architects withdrew it the same day (the executor memory store held program state); Session 5 disqualified itself (it ran in the conversation that built Session 4's state); Session 6 made the exam runnable and neither ran nor rehearsed it (HANDOFF Sessions 4 to 6). |

## Gate G1 exit criteria (Phase 1; open)

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

- None. K18 says that P1.1 goes ahead.

## Al's rulings K1–K8 of 2026-11-22 UTC (verbatim)

Given in the message that launched Session 6 (received 2026-11-22T19:18:40Z by the harness's
record), on the state at `f94bec2`, and copied here by script from the harness's record of that
message, not typed. The whole message, with its work order, is in HANDOFF (Session 6). K1–K6 are
implemented in ADR-0003, in the constitution's §6 and header, and in the exam procedure below;
K7 and K8 are implemented in this file. Everywhere in this file "K1" to "K8" mean these rulings.

```text
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
```

## Al's rulings K9–K14 of 2026-11-22 UTC (verbatim)

Given in the message that launched Session 8 (received 2026-11-22T20:11:09Z by the harness's
record), on the state at `00416bc`, and copied here by script from the harness's record of that
message, not typed. They are Al's judgment of the Gate G0 exam: the calls that Session 7 named
for him to overrule (HANDOFF Session 7: STANDING (c) and (e), THE WALK). The last line of the
block is the sentence that follows K14 in his message. The same message carries K15 and K16, on
a licence for KOBER; they are recorded verbatim in ADR-0004 and not here. Everywhere in this
file "K9" to "K14" mean these rulings, and "K15" and "K16" the two in ADR-0004.

```text
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

What they change here, in the executor's words. Where these and the rulings differ, the rulings
govern.

- **K9 to K12** judge Session 7's exam: its memory reading, the three things its disclosure
  script did besides copy and append, the slip, and the six places where the repo did not say
  how. None is overruled, and the closing of Gate G0 stands. The escalation that held those
  calls is closed (Standing escalations).
- **K9 and K10** each hold a sentence worded generally, which a later session can read as it
  stands: a memory line that names a decision record as its reason for holding no state is a
  pointer, and not program state (K9); a disclosure script may read data that the session itself
  wrote for it, may take the size, modified time and digest of the memory files it discloses,
  and may keep a copy of its own bytes (K10). For any other call of a later session, K9 to K12
  are precedent for calls of their kinds, as rulings A to D are, and not acceptance in advance
  (Al's answer to Session 6, in HANDOFF).
- **K12** keeps the five "Executor's notes from Session 7", which stand under the three steps
  of the exam, below.
- **K13** is carried out under NEXT-SINGLE-ACTION: the pointer after the staged P1.1 text stays
  a pointer, with the ruling beside it.
- **K14** is note 6 of the notes for the session making a disclosure in ADR-0003, added by
  Session 8 in Al's words.

## Al's rulings K17 and K18 of 2026-11-22 UTC (verbatim)

Given in Al's answer to the licence as Session 8 showed it to him (his second message in that
conversation, received 2026-11-22T21:01:00Z by the harness's record), and copied here by script
from the harness's record of it, not typed. They rule on the two things K16 put to him. Each is
one line, as he sent it. They are also in ADR-0004, D2, and his whole answer is in HANDOFF,
Session 8. Everywhere in this file "K17" and "K18" mean these rulings.

```text
K17 (the stored copy of the paper). It leaves the tree. I am going to ask the paper's authors, and it comes back only on my ruling. History is not rewritten: the commits that already hold the copy keep it. No other NC- or ND-licensed original is committed without my ruling.

K18 (what the analysis files transcribe). It stays as it is, and P1.1 goes ahead. My SYNDEOM line on derived artifacts is not applied to KOBER: this program formalizes the paper's published result, and it states the paper's data and quotes its statements, with attribution, so that the formal statements can be checked against them. Whether that needs the authors' permission is my question and not the executor's, and I am asking them. I settle it before publication packaging (P4.3) or before I grant any commercial licence, whichever comes first. Until then a session quotes no more of the paper than checking a statement needs.
```

What they change here, in the executor's words. Where these and the rulings differ, the rulings
govern.

- **K17: the stored copy of the paper left the tree** on 2026-11-22 UTC, by a commit of its
  own, the one after `5831b21` (Standing escalations). It is kept in the local store (header).
  It comes back only on Al's ruling. History is not rewritten: the 14 commits from `5f98231`
  through `5831b21` hold the copy and keep it.
- **K17, a standing rule:** no other NC- or ND-licensed original is committed without Al's
  ruling. It stands beside E10 and the rules at the head of SOURCES.md.
- **K18: what the analysis files transcribe stays as it is, and P1.1 goes ahead.** Al's line
  for SYNDEOM on derived artifacts is not applied to KOBER.
- **K18, a standing rule until Al settles his question to the authors:** a session quotes no
  more of the paper than checking a statement needs. It binds P1.1 and every session after
  it. Whether the transcription needs the authors' permission is Al's question and not the
  executor's. He settles it before publication packaging (P4.3) or before he grants any
  commercial licence, whichever comes first.

## Standing escalations

- **Closed by Al's "accepted" (2026-11-22 UTC): the removal of the stored copy of the paper
  (K17).** Session 8 copied the file to `C:\Users\LEET\KOBER-sources\S-0001`, checked there
  that its SHA-256 is the one S-0001 records, and only then removed
  `sources/corazza-etal-2021-jas-105214.pdf` from the tree, by a commit of its own. The
  Crossref record stays. Where the copy was cited, lines were added and none rewritten:
  S-0001, CLAIM-0001 to CLAIM-0003 and both analysis files. ADR-0004 carries a dated
  amendment.
- **Al's, and not the executor's: the authors' permission (K18).** Al is asking the paper's
  authors. No session acts on it. What binds sessions meanwhile is K18's last sentence.
- **Closed by K17 and K18 (2026-11-22 UTC): K16's two questions,** which Session 8 put to Al
  at its stop with the facts (ADR-0004, Context): whether the stored copy stays in the tree,
  and what in the analysis files is transcribed from the paper.
- **Closed by Al's "accepted" (2026-11-22 UTC): the licence (K15).** ADR-0004, `LICENSE`,
  README § Licence, S-0006 and the header's Licence bullet. Al accepted the eight readings in
  ADR-0004 as written. HANDOFF Session 8 has his message and his answer.
- **Closed by K9–K12 (2026-11-22 UTC): Al's judgment of the Gate G0 exam (Session 7).** G0 was
  recorded CLOSED on the exam session's own readings, which HANDOFF Session 7 gives in full
  and named for Al to overrule: (1) the memory reading, that no disclosed line is program
  state, with six closest calls, the fifth of a kind that ruling B did not cover (the memory
  cites a decision record as its reason for holding no state); (2) the disclosure order:
  before it appended, the disclosure script read a transcription file that the session had
  written itself, took the size and modified time of the two memory files, and wrote a scratch
  copy of its own bytes; (3) one slip in the walk, a directory name assumed in a listing
  command, with nothing built on it; (4) six places where the repo did not say how to do a
  thing. Al's rulings, verbatim above: K9 accepts (1), all six calls; K10 finds no breach in
  (2); K11 reads (3) as a slip and not a guess; K12 accepts (4). The closing of Gate G0
  stands.
- **Standing rule, not a pending question:** publication packaging and announcement remain
  gated at P4.3 whatever the repo's visibility (§4.6).
- **Closed by K7 (2026-11-22 UTC), recorded in HANDOFF Session 6: the pre-purge memory copies.**
  `project_kober.md` was confirmed present in
  `C:\Users\LEET\.claude\projects\C--Users-LEET\memory` before anything else was done there.
  `MEMORY.md.bak`, `project_kober.md.bak` and `project_friedman.md.bak` were each **absent**: by
  a Git Bash file test at 2026-11-22T19:21:04Z, and by a second method (.NET `File.Exists`, from
  PowerShell 7.7.0) at 19:21:05Z. The same two tests found `project_kober.md`, so the absence is
  not a check that failed quietly. Nothing existed to delete: nothing was deleted, nothing was
  opened, and there is no size or SHA-256 to record. Nothing else in that directory was listed,
  read or recorded. Session 5 saw the three files on 2026-08-25; FRIEDMAN's Session 6 found
  them absent earlier on 2026-11-22 UTC (FR13DMAN HANDOFF at `2ffa3e7`). Who removed them, and
  when, no repository says.
- **Closed by K1 and K2 (2026-11-22 UTC):** the executor's reading of the corollary's extension
  (ratified in Al's words, K2) and the order of the ADR and the exam (the ADR first, K1).
- **Carried, not open:** the CLAIM-0005/0006 sequencing caveat under the G1 table. It is decided
  when P1.2 reaches CLAIM-0005, not before.

## NEXT-SINGLE-ACTION

**P1.1 — formalize the constraint system as Lean data conditional on R0a.** Gate G0 closed on
2026-11-22 UTC, so the task that Session 4 staged is now the next single action. The paragraph
below is the staged text, copied by script from this file at `44c0b45`, unchanged, label and
all. Its label ("Staged … when G0 closes") is history: this is the action.

Al's message to Session 8 keeps it so: P1.1 is the next action after the two things that
message orders, the record of K9–K14 (`8a01621`) and the licence (ADR-0004). Both are done,
and K18 says that P1.1 goes ahead. K18 also binds it: P1.1 quotes no more of the paper than
checking a statement needs. The removal of the stored copy of the paper (K17) is done as
well: where P1.1 needs the paper, it is in the local store (header) and not in the tree.

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

Session 7's pointer, not part of the staged text and not adjudicated: the Table-1 combination
list in extraction §3 includes `H H H` (CHIC #068.r.A) and two `*180` ligatures (MA 4), which
S-0001 did not use in Simulation 2 (`analysis/R0.md` §3, and R0a in §5). The staged text's
"Table-1 attested combinations" and "conditional on R0a" have to be read together to get the
combination set for C2 to C4.

Al's ruling on that pointer (K13, 2026-11-22 UTC), copied by script from his message:

> K13 (the pointer after the staged P1.1 text). It stays as a pointer. P1.1 reads the two passages
> together, and if the combination set is a choice, the choice gets an ADR.

## The cold-start exam: the three steps, as Gate G0's exam ran them

Kept by the session that passed the exam, as the section below orders ("it keeps the three
steps and this section"). Until Gate G0 closed, this text stood under NEXT-SINGLE-ACTION: where
the section below says "in NEXT-SINGLE-ACTION above", it means here. It is copied by script
from this file at `44c0b45`, unchanged, and it is written for Gate G0, which is closed: it is
not the current action. Whether a later gate's exam uses it as it stands is Al's to say when
that exam becomes the next action.

**Run the Gate G0 cold-start test (§2) — in a session that is cold.** Only Al can start one: a
new conversation, launched with the constitution's §6 "Session N — resume" prompt as amended on
2026-11-22 UTC, **verbatim** and with nothing else (ADR-0003, K2). The executor cannot create
that condition from inside an existing conversation. The directory Al launches from is his
practice, not a condition of the exam (K8): a session launched from another directory is no less
cold for it.

A session launched that way has already appended its memory disclosure when it reads this: the
prompt orders the disclosure before this file is read. It is the exam. It does the three steps
below, in order, and writes no memory at any point (ADR-0003 D3). The section after the steps
holds the executor's readings of step 1, notes on the steps, and Al's rulings on the sibling
program's exam. Read that section before doing step 1.

1. **Standing.** Al's text (K6), copied by script from his ruling, with line breaks added:

   > the session has already made its disclosure; below it, without changing it, the session records
   > the launching message it received, verbatim, and whether any turn preceded it; it records
   > DISQUALIFIED and stops if the message carries anything beyond §6's text, or a prior turn
   > exists, or any disclosed memory is program state, or the session is running in a conversation
   > context that built this state.

2. **The walk.** §4.1 ORIENT strictly from the repo — git facts → this file → HANDOFF last entry
   → CLAIMS skim → DECISIONS → `scripts/check.sh` — noting every point where reconstruction
   required a guess.
3. **On PASS** (no guessing): record the walk in HANDOFF, mark the cold-start row done, flip
   Gate **G0 → CLOSED**, open **Phase 1** with NEXT-SINGLE-ACTION = **P1.1** as staged below.
   **On guessing:** fix the documentation first — the gate is not passed by working code
   with unreconstructable context (§2).

### Executor's notes from Session 7 (the Gate G0 exam)

The executor's, not rulings. Al had not read them when the commit that added them was made.

1. *The record.* On 2026-11-22 UTC (harness version 2.1.322) Session 7's record was where note
   3 below puts it. Five records preceded the launching message, of types `mode`,
   `permission-mode`, `session-owner`, `file-history-snapshot` and `atis-latch`. Note 3 lists
   the first four. None is a user or assistant message.
2. *The working directory.* Session 7 was started outside the repository. Its first shell
   command changed directory into it, and the harness's primary working directory moved there.
   The scratch path did not move, and with it the session identifier and the record's place.
3. *The memory reading, twice.* Note 1 below puts step 1 before HANDOFF, CLAIMS and DECISIONS
   are read, and the paragraph on ruling B wants the reading checked against the state the repo
   holds. Session 7 made the reading at step 1 against this file, made it again after the walk,
   and recorded both.
4. *D3, shown.* Session 7's disclosure recorded the size, modified time and SHA-256 of each
   memory file it opened, and its HANDOFF block records the same values taken again at the end
   of the session.
5. *A script's own files.* Session 7's disclosure script read a file that the session had
   written: its transcription of the index lines, which the script compared with the lines on
   disk before it appended. Whether the §6 prompt's "no other command or file read" allows that
   is among the calls put to Al (Standing escalations). Until he rules, a session that wants
   such a check can hold the comparison text inside the script.

Al's rulings on these notes (2026-11-22 UTC; verbatim above). K12: the five notes stay. K10 is
the ruling that note 5 waits for: a disclosure script may read data that the session itself
wrote for it. K14 is now note 6 of the notes in ADR-0003, which a session reads before it
appends; its second sentence is the practice that note 4 describes.

## The cold-start exam: readings, notes, and Al's rulings on FRIEDMAN's exam (K6)

K6 orders these read at FR13DMAN commit `2ffa3e7bd56087f79bdcfe4b9649e2d86844b305` and fitted to
KOBER: from FRIEDMAN's STATE, "The cold-start exam procedure" with the three readings of its
step (0) and the "Executor's notes from Session 7", and Al's rulings A–D on that session.
FRIEDMAN's Gate F0 closed by that procedure on 2026-11-22 UTC. Al accepted the readings and
notes for FRIEDMAN, and read this fitting before the commit.

The steps themselves are KOBER's own: three, numbered 1 to 3, in NEXT-SINGLE-ACTION above, as
this file has had them since Session 5. Step 1 is now Al's text (K6). Steps 2 and 3 are as they
were, except that step 3 no longer says an ADR is owed after the exam (K1, K6). FRIEDMAN's steps
are numbered (0) to (5): its (0) is step 1 here, its (1) to (4) fall under step 2, and its (5)
is step 3. A session that passes the exam rewrites this file; it keeps the three steps and this
section, so that the next gate's exam does not have to recover them from history. Whether a
later gate's exam uses them as they stand is Al's to say when that exam becomes the next action.

### The executor's readings of step 1

Not rulings. The first three are FRIEDMAN's three readings of its step (0), which Al accepted
there. The fourth is KOBER's own.

- *The launching message is what Al sent as the first user turn.* What the harness attaches
  around it is not part of it. In Session 6 the harness delivered Al's pasted text inside a
  paste wrapper and attached context blocks of its own, the loaded memory among them. The
  session says that such attachments were present and reproduces memory only as ADR-0003 D2
  allows.
- *A difference from §6's text in line breaks or surrounding whitespace alone is not content.*
  Compare the message with the Session-N block in §6 of the constitution, by script, and record
  the result.
- *A breach of the disclosure order is Al's to judge.* If the session ran a command or read a
  file before disclosing, other than what the prompt allows, or its append did what ADR-0003's
  note 5 forbids, it says so in its standing record, does not mark the gate CLOSED, and
  escalates: the rulings do not say what such a breach costs.
- *"Stops" means that the exam stops.* A disqualified session does not go on with the exam and
  does not close the gate (FRIEDMAN's step (0) says so in those words). It still completes its
  HANDOFF block per §4.5, commits it with its disclosure, and stops clean per §4.6. Step 1 as
  this file had it before K6 said "commit the HANDOFF entry, stop"; Al's text says "stops", and
  this reading keeps the commit so that the working tree is not left holding an uncommitted
  disclosure.

### Notes on the steps

The executor's, not rulings. Notes 1 to 4 are the four "Executor's notes from Session 7" in
FRIEDMAN's STATE, which Al ruled stay (ruling D, below), fitted to KOBER. Notes 5 to 7 fit to
KOBER what FRIEDMAN's steps (1) to (5) say and KOBER's steps 2 and 3 leave unsaid.

1. *When step 1 is done.* A session learns that it is an exam, and that step 1 exists, only by
   reading this file. FRIEDMAN's Session 7 ran the §4.1 commands, read STATE, did its step (0),
   and then read the rest of what its next step lists. Here that order is: the §4.1 commands,
   this file, step 1, then HANDOFF, CLAIMS and DECISIONS.
2. *The append in the disclosure.* A session reading this has already appended. The rule for
   the append and the calls that follow it are in ADR-0003, notes 3 to 5, which the session read
   first. If its append did anything those notes forbid — created the file, tested for it, took
   its size — it says so in its standing record (third reading, above).
3. *The launching message, verbatim.* On Al's machine on 2026-11-22 UTC (harness version
   2.1.322) the harness kept its record of a conversation as one JSON-lines file, named for the
   session identifier, in the directory that holds the memory directory; the session identifier
   is the folder above `scratchpad` in the scratch path the harness names. FRIEDMAN's Session 7
   inferred that and tested it, and KOBER's Session 6 found its own record the same way. Open
   that one file by name and list nothing: the same directory holds the records of earlier
   conversations, and those carry program state. Confirm the file by its `sessionId` field. The
   launching message is the first record of type `user`: its `parentUuid` is null and its
   `turnPosition` is prompt 1, turn 1. In Session 6's record the four records before it were of
   types `mode`, `permission-mode`, `session-owner` and `file-history-snapshot`, none of them a
   user or assistant message. When Al pastes the prompt, the record holds it between the tags
   of a paste wrapper, and the wrapper is not the message (first reading). Copy the message and
   compare it with §6 by script.

   *Al's addition (ruling D on FRIEDMAN's Session 7, 2026-11-22 UTC), in his words, copied by
   script from that ruling as FRIEDMAN's STATE records it, with line breaks added. "R1" is
   FRIEDMAN's name for the ruling that is K2 here:*

   > a session opens its own conversation record and no other, by its exact name, and lists nothing
   > in that directory. If the record is not where the note puts it, the session does not look for
   > it: it records the launching message from its own context, states that it did, and I judge. A
   > session that opens another conversation's record has taken on that conversation's context and
   > is not cold (R1).

4. *Completing the provisional header.* Nothing says what a completed header looks like.
   FRIEDMAN's Session 7 replaced the one provisional header line with a header in the §4.5 form
   and checked by script that every byte before and after that line was unchanged.
5. *Step 2, what ORIENT will show.* `git status` will show `PROGRAM/HANDOFF.md` modified by the
   session's own append, and should show nothing else. "HANDOFF last entry" means the last
   entry before the session's own block: Session 6. "DECISIONS" means ADR-0000 to ADR-0003;
   ADR-0003 was read before the disclosure.
6. *Step 2, evidence.* `bash scripts/check.sh` must print `ALL GREEN`, and
   `gh run list -R Quigles1337/KOBER --branch master --limit 3` must show `check` succeeding
   for `master`'s tip. Confirm each Gate G0 row's evidence link: a cited commit is on `master`
   (`git merge-base --is-ancestor`), a cited file exists, a recorded digest matches (the stored
   Crossref record under `sources/` against its SHA-256 in SOURCES.md, S-0001). Gate G0's exam
   checked two stored files there. The second, the paper, left the tree on 2026-11-22 UTC
   (K17): its digest can be checked against the copy in the local store, or against a fresh
   retrieval from the address in S-0001, and neither of those is the repository.
7. *Step 2, what counts as a guess; step 3.* Any guess about the program fails the gate. A
   place where the repo did not say *how to do a thing* is written down as well, for Al to weigh
   (ruling C, below). On a pass, G0 is marked CLOSED with the date and the SHA at which the test
   passed.

### Al's rulings A–D on FRIEDMAN's Session 7 (verbatim)

Al gave these to FRIEDMAN's Session 8 on 2026-11-22 UTC, on the exam its Session 7 ran. They are
rulings on FRIEDMAN. They are here because K6 orders them read and because the notes above rest
on them. Copied by script from FRIEDMAN's `PROGRAM/STATE.md` at `2ffa3e7`, which says that it
copied them by script from the harness's record. Each ruling is one line.

```text
A. The disclosure order. Not a breach. The prompt allows a script, the script read none of the file's bytes, and Session 7 learned the size only after the append was written. The closing of Gate F0 stands. From now on the append asks the file system nothing, as Session 7's note 2 has it.
B. The memory reading. Accepted, all four calls. None of them is program state.
C. The four places where the repo did not say how. Accepted. None was a guess about the program.
D. Session 7's four notes on the exam procedure stay, with one addition to note 3, in my words: a session opens its own conversation record and no other, by its exact name, and lists nothing in that directory. If the record is not where the note puts it, the session does not look for it: it records the launching message from its own context, states that it did, and I judge. A session that opens another conversation's record has taken on that conversation's context and is not cold (R1).
```

What they mean here, in the executor's words. Where these and the rulings differ, the rulings
govern. A ruling that judged FRIEDMAN's Session 7 judged that session, and not a KOBER session
that has not yet run.

- **A.** FRIEDMAN's Session 7 appended with a script that first tested whether HANDOFF existed
  and took its size. Al ruled that this was not a breach, and that from then on the append asks
  the file system nothing. For KOBER that rule is the last sentence of K4, and it is in ADR-0003
  (D2 and note 5), which a session reads before it appends. A KOBER session that queries the
  file has therefore not followed the ADR, and says so (third reading).
- **B.** FRIEDMAN's Session 7 read its disclosed memory as holding no program state and named
  its four closest calls: the remote being called public; one sentence of the constitution
  restated in the program's memory file as a standing rule; a harness session identifier and a
  last-modified time in that file's front matter; machine hazards worded so that they imply
  history. Al accepted all four: none is program state. A KOBER exam session makes its own
  reading against ADR-0003 D1, after orientation, so that the reading can be checked against
  the state the repo holds, and it names its closest calls so that Al can overrule it. Ruling B
  is the precedent for calls of those four kinds.
- **C.** In four places FRIEDMAN's repo did not say how to do a thing: finding the repo from a
  session started in another directory (Session 7 took the location from its memory index,
  which D1 allows); where the harness's record is; what a completed header is; when the
  standing step is done. Al accepted all four: none was a guess about the program. For KOBER,
  the *Launch* line at the top of this file covers the first and notes 3, 4 and 1 above cover
  the others. A KOBER exam session still writes down every such place it meets (note 7).
- **D.** The four notes stay, with Al's addition to note 3. They are notes 1 to 4 above, and
  his addition is under note 3 in his words.
