# CLAIMS — append-only claim register

Entry schema (§3.3): `ID | informal statement | status | evidence | reading-set deps | axiom print
(if PROVEN) | transitions log`.

Statuses: `UNKNOWN → VERIFIED (externally checked) / PROVEN (kernel-checked) / CONDITIONAL /
FALSIFIED / RETRACTED`.

Rules: append-only — never delete or rewrite an entry or a past transition; a correction is a new
transition line. Transitions require evidence. Downgrades are always permitted and never shameful
(E5, §4.5 honesty check). The **Status** field always reflects the latest transition.

---

## CLAIM-0001 — identity of the 2021 computational fraction-values paper

- **Informal statement:** The 2021 computational paper on the mathematical values of Linear A
  fraction signs is by Corazza, Ferrara, Montecchi, Tamburini & Valério. This is *program memory*
  carried in the constitution (§P0.1), not knowledge: authors, exact title, venue, year, and DOI
  are unestablished until the paper is retrieved this-session and the full citation is verified
  against the retrieved source (E5).
- **Status:** VERIFIED
- **Evidence:** S-0001 in SOURCES.md — Crossref registry record retrieved twice (bibliographic
  search, then exact-DOI fetch stored at `sources/crossref-10.1016-j.jas.2020.105214.json`) and the
  version-of-record PDF retrieved from the University of Florence FLORE repository (stored at
  `sources/corazza-etal-2021-jas-105214.pdf`, SHA-256 in S-0001), whose embedded metadata matches
  Crossref on DOI, title, journal, authors, and license.
- **Reading-set deps:** none
- **Axiom print:** n/a (not a formal claim)
- **Transitions:**
  - 2026-08-22 (Session 1) — seeded UNKNOWN per §P0.1.
  - 2026-08-22 (Session 1) — UNKNOWN → **VERIFIED**. The paper is: Michele Corazza, Silvia
    Ferrara, Barbara Montecchi, Fabio Tamburini, Miguel Valério, "The mathematical values of
    fraction signs in the Linear A script: A computational, statistical and typological approach",
    *Journal of Archaeological Science* 125 (2021), 105214, DOI 10.1016/j.jas.2020.105214 (online
    2020-09-06). The constitution's memory-belief was correct on all five authors and the topic;
    venue/year/DOI now established by retrieval, not memory. Evidence: S-0001.

---

## CLAIM-0002 — what Corazza et al. 2021 actually claims

- **Informal statement:** The paper's result is a *conditional optimality characterization*, not
  a uniqueness theorem. Its Constraints 1–6 alone are "severely underconstrained" (3,794,740
  solutions in Simulation 2, over 12 sign variables with W, X, Y, Ω, L excluded). The headline
  assignment — J = 1/2, E = 1/4, F = 1/8, B = 1/5, D = 1/6, K = 1/10, L2 = 1/20, L3 = 1/30,
  L4 = 1/40, L6 = 1/60 — is asserted only under two further hypotheses (typological attestation
  of values; optimality of the system under the paper's four defined goodness measures), and the
  further assignments H = 1/16, A = 1/24 are stated by the authors to be "tentative". Any KOBER
  theorem must be scoped to this hypothesis form (E3): "given Constraints 1–6 the solution set is
  exactly S", or "relative to the defined measures, the optimum carries exactly these ten
  values" — never "the constraints force unique values".
- **Status:** VERIFIED
- **Evidence:** full-text extraction `analysis/P0.2-constraint-system.md` (page-anchored, §7 for
  the verbatim claim from p. 8 of the stored VOR; §0 for the underconstrainedness quote from
  p. 6), against `sources/corazza-etal-2021-jas-105214.pdf` (SHA-256 in S-0001). Extraction also
  records three model ambiguities (A-1..A-3) and six internal-text observations (OBS-1..OBS-6)
  that replication must resolve.
- **Reading-set deps:** none yet (this is a claim about the paper's content; the paper's own
  reading choices are catalogued in the extraction §1 and become R0 at P0.3).
- **Axiom print:** n/a (not a formal claim)
- **Transitions:**
  - 2026-08-22 (Session 2) — created VERIFIED with retrieval-extraction evidence (P0.2).

---

## CLAIM-0003 — identity and provenance of reading set R0

- **Informal statement:** `analysis/R0.md` faithfully enumerates the reading set the S-0001
  constraint system depends on: the aggregate attestation matrix (Tables 1–2 as published,
  with the honest limitation that S-0001 does not decompose it per inscription), the ~26
  individually named readings with the paper's damage notation preserved verbatim, the edition
  attributions as cited by S-0001 (GORILA vols. 1/3/5 + later publications; vols. 2/4 never
  cited), and four explicit variant axes: R0a (paper-operative baseline), R0b (KH 86.2 = A B B
  per GORILA), R0c (E J genuine → universal C5 inconsistent), R0d (PH 7b.3 = L E).
- **Status:** VERIFIED
- **Evidence:** `analysis/R0.md` (2026-08-22), every row page-anchored into the stored VOR
  (S-0001); three SigLA document pages fetched as independent pointers (HT 104, KH 86,
  ZA 11a — the last showing a possible transcription divergence on the L L2 reading, recorded
  as unresolved in R0 §4/§6, not adjudicated).
- **Reading-set deps:** self (this claim defines R0).
- **Axiom print:** n/a
- **Transitions:**
  - 2026-08-22 (Session 3) — created VERIFIED (P0.3).

---

## CLAIM-0004 — [P1 target, tier 1] constraint-layer corollaries

- **Informal statement:** Conditional on R0a and the formalization of Constraints 1–6 with the
  S-0001 value domains (extraction §4–§5): every satisfying assignment obeys the bounds the
  paper states — A < 1/2, H < 1/2, B < 1/4 (from C1 + C5), L4 < L2 < K < 1/8, L2 ≥ 3/320,
  L-series < 1/9 — and the series ratios L2 = (3/2)·L3, L2 = 2·L4, L2 = 3·L6 (C6 with hl = 1;
  this corrects the inverted phrasing flagged as OBS-4).
- **Status:** UNKNOWN (proof target for P1.1–P1.2; expected first PROVEN entries)
- **Evidence:** statement anchored to `analysis/P0.2-constraint-system.md` §4–§5, §7 form (2).
- **Reading-set deps:** R0a (CLAIM-0003).
- **Axiom print:** pending proof.
- **Transitions:**
  - 2026-08-22 (Session 3) — created UNKNOWN (P0.4 statement; E3 anchor).

---

## CLAIM-0005 — [P1 target, tier 2] exact solution set of the constraint layer

- **Informal statement:** Conditional on R0a and on a domain reconstruction that resolves
  extraction flags A-1–A-3 (L-series domain; soft bounds; G_Optimal grid) while reproducing the
  paper's published counts: the solution set of Constraints 1–6 is exactly a set S with
  |S| = 3,794,740 — in particular, **kernel-checked non-uniqueness of the constraint layer**
  (the anti-claim that makes the falsification story precise). If no reasonable disambiguation
  reproduces the published count, the discrepancy itself becomes the registered result
  (downgrade path prepared in advance).
- **Status:** UNKNOWN (requires Phase-2 replication to fix the model, then P1 certification)
- **Evidence:** statement anchored to extraction §5–§6, §7 form (1); golden targets listed in
  extraction §9.
- **Reading-set deps:** R0a; variant-sensitivity vs R0b predicted nil at this layer (R0 §5,
  executor inference — must be machine-checked, P1.3).
- **Axiom print:** pending proof.
- **Transitions:**
  - 2026-08-22 (Session 3) — created UNKNOWN (P0.4 statement).

---

## CLAIM-0006 — [P1 target, tier 3] optimum characterization (the paper's "simple hypothesis")

- **Informal statement:** Conditional on R0a, the reconstructed domains, and the four goodness
  measures exactly as defined in S-0001 (G_FreqVSDiv, G_AmbCombs, G_Typ, the MULT top-5000
  filter, G_Optimal): the G_Optimal minimizers carry exactly J = 1/2, E = 1/4, F = 1/8,
  B = 1/5, D = 1/6, K = 1/10, L2 = 1/20, L3 = 1/30, L4 = 1/40, L6 = 1/60, with H and A
  underdetermined precisely as published (H ∈ {1/16, 1/24, 1/32, 1/36, 1/48, 1/64, 1/72,
  1/84}, A ∈ {1/24, 1/32, 1/36, 1/48, 1/64, 1/72, 1/84} among the 28 best). This — not
  "uniqueness from constraints" — is the theorem the paper's claim actually supports (E3;
  extraction §0/§7). The paper's tentative H = 1/16, A = 1/24 preference is palaeographic/
  structural and is NOT part of this formal target.
- **Status:** UNKNOWN (the anchor deliverable; depends on CLAIM-0005's model fixation)
- **Evidence:** statement anchored to extraction §6–§7 (verbatim claim quoted there from
  S-0001 p. 8).
- **Reading-set deps:** R0a; R0b touches the measure layer (G_AmbCombs, the A A argument) —
  variant-conditional proof required by P1.3.
- **Axiom print:** pending proof.
- **Transitions:**
  - 2026-08-22 (Session 3) — created UNKNOWN (P0.4 statement; completes the G0 "informal
    theorem stated" criterion together with CLAIM-0004/0005).
